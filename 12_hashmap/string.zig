const std = @import("std");
const hash_map = std.hash_map;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    var h = hash_map.StringHashMap([]const u8).init(allocator);
    defer _ = h.deinit();

    try h.put("name", "Alex Under");
    try h.put("address", "Jakarta, ID");

    var it = h.iterator();
    while (it.next()) |entry| {
        std.debug.print("{s}: {s}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}
