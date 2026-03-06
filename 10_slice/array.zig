const std = @import("std");

pub fn main() !void {
    const scores = [_]u8{ 70, 80, 30 };
    std.debug.print("scores = {any}\n", .{scores});

    const ip = [4]u8{ 192, 168, 10, 1 };
    std.debug.print("ip = {any}\n", .{ip});

    const combined = scores ++ ip;
    for (combined, 0..) |s, i| {
        std.debug.print("[{d}] {d}\n", .{ i + 1, s });
    }

    const ip4times = [4]u8{ 192, 168, 10, 1 } ** 4;
    std.debug.print("ip4times = {any}\n", .{ip4times});
}
