const std = @import("std");

pub fn main() void {
    var number: i32 = 10;
    std.debug.print("{d}\n", .{number});

    number += 1;
    std.debug.print("{d}\n", .{number});
}
