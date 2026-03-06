const std = @import("std");

fn worker(id: u8) void {
    std.debug.print("id = {}\n", .{id});
}

pub fn main() !void {
    const t1 = try std.Thread.spawn(.{}, worker, .{1});
    const t2 = try std.Thread.spawn(.{}, worker, .{2});
    t1.join();
    t2.join();
}
