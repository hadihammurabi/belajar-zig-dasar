const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    var scores: std.ArrayList(u8) = .empty;
    defer _ = scores.deinit(allocator);

    try scores.appendSlice(allocator, &.{ 70, 80, 30, 50, 90, 20 });
    std.debug.print("scores = {any}\n", .{scores});

    for (scores.items, 0..) |s, i| {
        std.debug.print("[{d}] {d}\n", .{ i + 1, s });
    }
}
