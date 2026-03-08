const std = @import("std");

const String = []const u8;
const User = struct {
    email: String,
    password: String,

    pub fn format(self: User, writer: anytype) !void {
        try writer.print("User{{ \"{s}\" \"{s}\" }}", .{ self.email, self.password });
    }
};

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const jsonS =
        \\{"email":"alex@mail.com","password":"123123"}
    ;
    const parsed = try std.json.parseFromSlice(
        User,
        arena.allocator(),
        jsonS,
        .{},
    );
    defer parsed.deinit();

    std.debug.print("{f}\n", .{parsed.value});
}
