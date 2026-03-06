const std = @import("std");

pub fn main() !void {
    const maybe: ?*i8 = null;
    std.debug.print("x is {} at {}\n", .{
        if (maybe) |ptr| ptr.* else null,
        if (maybe) |ptr| ptr else null,
    });

    var x: i8 = 99;
    const safe = maybe orelse &x;
    std.debug.print("x is {} at {}\n", .{ safe.*, safe });
}
