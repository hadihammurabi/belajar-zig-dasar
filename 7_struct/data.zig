const std = @import("std");

const User = struct {
    email: []const u8,
    password: []const u8,
};

pub fn main() !void {
    const u = User{
        .email = "hello@main.com",
        .password = "123123",
    };

    std.debug.print("email={s} password={s}\n", .{ u.email, u.password });
}
