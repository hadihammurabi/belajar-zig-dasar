const std = @import("std");

fn sum(input: []const u8) u16 {
    var total: u16 = 0;
    for (input) |i| total += i;
    return total;
}

pub fn main() !void {
    const scores = [_]u8{ 70, 80, 30, 50, 90, 20 };
    std.debug.print("scores = {any}, sum = {}\n", .{ scores, sum(&scores) });

    const firstScores = scores[0..3];
    std.debug.print("firstScores = {any}, sum = {}\n", .{ firstScores, sum(firstScores) });

    const lastScores = scores[3..];
    std.debug.print("lastScores = {any}, sum = {}\n", .{ lastScores, sum(lastScores) });
}
