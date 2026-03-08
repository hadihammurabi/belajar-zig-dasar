const std = @import("std");
const net = std.net;

pub fn main() !void {
    const addr = try net.Address.parseIp4("0.0.0.0", 8080);
    var server = try addr.listen(.{
        .reuse_address = true,
    });
    defer server.deinit();

    std.debug.print("Listening on {f}\n", .{addr});

    while (true) {
        const conn = try server.accept();
        try handleConn(conn.stream);
    }
}

fn handleConn(stream: net.Stream) !void {
    defer stream.close();

    std.debug.print("client connected\n", .{});
    try stream.writeAll("welcome :)\n");

    while (true) {
        var buf: [1024]u8 = undefined;
        _ = try stream.read(&buf);

        if (std.mem.eql(u8, &buf, "q")) {
            try stream.writeAll("bye!\n");
            break;
        }

        try stream.writeAll(&buf);
    }
}
