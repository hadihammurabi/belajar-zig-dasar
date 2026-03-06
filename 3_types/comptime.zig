const std = @import("std");

fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

pub fn main() !void {
    std.debug.print("max of 2 and 8 is {}\n", .{max(u8, 2, 8)});
}
