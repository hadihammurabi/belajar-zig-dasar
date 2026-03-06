const std = @import("std");

fn add(a: i8, b: i8) void {
    std.debug.print("result: {d}\n", .{a + b});
}

pub fn main() !void {
    add(21, 65);
}
