const std = @import("std");

fn add(a: i8, b: i8) i8 {
    return a + b;
}

fn div(a: i8, b: i8) ?i8 {
    if (b == 0) return null;
    return @divTrunc(a, b);
}

pub fn main() !void {
    const result1 = add(21, 65);
    std.debug.print("result: {d}\n", .{result1});

    const result2 = div(21, 7);
    std.debug.print("result: {?d}\n", .{result2});
}
