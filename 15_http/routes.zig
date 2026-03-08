const std = @import("std");
const net = std.net;
const heap = std.heap;
const http = std.http;

fn register(allocator: std.mem.Allocator) !std.StringHashMap(Handler) {
    var handlers = std.StringHashMap(Handler).init(allocator);
    try handlers.put("/", index);
    try handlers.put("/users", users);
    return handlers;
}

fn index(req: *http.Server.Request) !void {
    try req.respond("hello\n", .{});
}

fn users(req: *http.Server.Request) !void {
    try req.respond("users\n", .{});
}

pub fn main() !void {
    const addr = try net.Address.parseIp4("0.0.0.0", 8080);
    var server = try addr.listen(.{
        .reuse_address = true,
    });
    defer server.deinit();

    std.debug.print("Listening on {f}\n", .{addr});

    var arena = heap.ArenaAllocator.init(heap.page_allocator);
    defer arena.deinit();

    const handlers = try register(arena.allocator());

    while (true) {
        const conn: net.Server.Connection = try server.accept();

        var bufR: [1024]u8 = undefined;
        var bufW: [1024]u8 = undefined;

        var w = conn.stream.writer(&bufW).file_writer;
        var r = conn.stream.reader(&bufR).file_reader;

        var h = http.Server.init(&r.interface, &w.interface);

        var req = try h.receiveHead();

        try handle(handlers, &req);
    }
}

const Handler = *const fn (*http.Server.Request) anyerror!void;

fn handle(handlers: std.StringHashMap(Handler), req: *http.Server.Request) !void {
    const handler = handlers.get(req.head.target);
    try handler.?(req);
}
