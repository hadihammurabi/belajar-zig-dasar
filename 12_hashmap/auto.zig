const std = @import("std");
const hash_map = std.hash_map;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    var h = hash_map.AutoHashMap(u8, []const u8).init(allocator);
    defer _ = h.deinit();

    try h.put(1, "Alex Under");
    try h.put(2, "Jakarta, ID");

    var it = h.iterator();
    while (it.next()) |entry| {
        std.debug.print("{d}: {s}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}
