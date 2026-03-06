const std = @import("std");

fn hello() void {
    std.debug.print("hello my friends!\n", .{});
}

pub fn main() !void {
    hello();
}
