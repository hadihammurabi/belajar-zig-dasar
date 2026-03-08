const std = @import("std");
const net = std.net;
const heap = std.heap;
const http = std.http;

pub fn main() !void {
    const addr = try net.Address.parseIp4("0.0.0.0", 8080);
    var server = try addr.listen(.{
        .reuse_address = true,
    });
    defer server.deinit();

    std.debug.print("Listening on {f}\n", .{addr});

    while (true) {
        const conn: net.Server.Connection = try server.accept();

        var bufR: [1024]u8 = undefined;
        var bufW: [1024]u8 = undefined;

        var w = conn.stream.writer(&bufW).file_writer;
        var r = conn.stream.reader(&bufR).file_reader;

        var h = http.Server.init(&r.interface, &w.interface);

        var req = try h.receiveHead();

        try handle(&req);
    }
}

fn handle(req: *http.Server.Request) !void {
    try req.respond("hello\n", .{});
}
