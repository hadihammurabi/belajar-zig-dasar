const std = @import("std");

const User = struct {
    email: []const u8,
    password: []const u8,

    pub fn format(self: User, writer: anytype) !void {
        try writer.print("User{{ \"{s}\" \"{s}\" }}", .{ self.email, self.password });
    }

    pub fn new(email: []const u8, password: []const u8) User {
        return .{
            .email = email,
            .password = password,
        };
    }
};

pub fn main() !void {
    const u = User.new("hello@main.com", "123123");
    std.debug.print("{f}\n", .{u});
}
