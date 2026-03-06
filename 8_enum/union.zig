const std = @import("std");

const Shape = union(enum) {
    circle: f32,
    rect: struct { w: f32, h: f32 },

    pub fn area(self: Shape) f32 {
        return switch (self) {
            .circle => |r| std.math.pi * r * r,
            .rect => |r| r.w * r.h,
        };
    }
};

pub fn main() !void {
    var s = Shape{ .circle = 10 };
    std.debug.print("shape is {}, the area is {}\n", .{ s, s.area() });

    s = Shape{ .rect = .{ .w = 10, .h = 5 } };
    std.debug.print("shape is {}, the area is {}\n", .{ s, s.area() });
}
