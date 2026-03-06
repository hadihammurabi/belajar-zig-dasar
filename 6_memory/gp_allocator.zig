const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    const nums = try allocator.alloc(u8, 5);
    defer allocator.free(nums);

    for (nums, 0..) |*item, i| {
        item.* = @intCast(i + 1);
    }

    for (nums, 0..) |item, i| {
        std.debug.print("result: {d} {}\n", .{ item, i });
    }
}
