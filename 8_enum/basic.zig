const std = @import("std");

const Direction = enum {
    north,
    south,
    east,
    west,
};

const Color = enum { red, yellow, green, blue };

pub fn main() !void {
    const home = Direction.north;
    const color = switch (home) {
        .north => .red,
        .south => .yellow,
        .east => .green,
        .west => .blue,
    };
    std.debug.print("your home is in {} and the color is {}\n", .{ home, color });
}
