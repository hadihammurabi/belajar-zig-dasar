const std = @import("std");

const String = []const u8;
const User = struct {
    email: String,
    password: String,
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    var buf: std.io.Writer.Allocating = .init(allocator);
    defer buf.deinit();

    try std.json.Stringify.value(User{
        .email = "alex@mail.com",
        .password = "123123",
    }, .{}, &buf.writer);

    std.debug.print("{s}\n", .{buf.written()});
}
