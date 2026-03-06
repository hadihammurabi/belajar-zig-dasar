const std = @import("std");

pub fn main() void {
    const number = 10;
    std.debug.print("{d}\n", .{number});
}
