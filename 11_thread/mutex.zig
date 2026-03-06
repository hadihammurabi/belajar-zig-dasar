const std = @import("std");

var mutex: std.Thread.Mutex = .{};
var val: u32 = 0;

fn worker(id: u8) void {
    mutex.lock();
    defer mutex.unlock();
    for (0..1000) |_| {
        val += 1;
    }
    std.debug.print("id = {}\n", .{id});
}

pub fn main() !void {
    const t1 = try std.Thread.spawn(.{}, worker, .{1});
    const t2 = try std.Thread.spawn(.{}, worker, .{2});
    const t3 = try std.Thread.spawn(.{}, worker, .{3});
    const t4 = try std.Thread.spawn(.{}, worker, .{4});
    const t5 = try std.Thread.spawn(.{}, worker, .{5});
    t1.join();
    t2.join();
    t3.join();
    t4.join();
    t5.join();

    std.debug.print("val = {}\n", .{val});
}
