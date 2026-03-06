const std = @import("std");

pub fn main() !void {
    var x: i8 = 10;
    const ptr = &x;
    std.debug.print("x is {} at {}\n", .{ ptr.*, ptr });

    ptr.* = 99;
    std.debug.print("x is {} at {}\n", .{ ptr.*, ptr });
}
