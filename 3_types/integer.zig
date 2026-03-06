const std = @import("std");

pub fn main() void {
    {
        const i8Min: i8 = std.math.minInt(i8);
        const i8Max: i8 = std.math.maxInt(i8);
        std.debug.print("i8 from {d} to {d}\n", .{ i8Min, i8Max });
    }
    {
        const i16Min: i16 = std.math.minInt(i16);
        const i16Max: i16 = std.math.maxInt(i16);
        std.debug.print("i16 from {d} to {d}\n", .{ i16Min, i16Max });
    }
    {
        const i32Min: i32 = std.math.minInt(i32);
        const i32Max: i32 = std.math.maxInt(i32);
        std.debug.print("i32 from {d} to {d}\n", .{ i32Min, i32Max });
    }
    {
        const i64Min: i64 = std.math.minInt(i64);
        const i64Max: i64 = std.math.maxInt(i64);
        std.debug.print("i64 from {d} to {d}\n", .{ i64Min, i64Max });
    }
    {
        const i128Min: i128 = std.math.minInt(i128);
        const i128Max: i128 = std.math.maxInt(i128);
        std.debug.print("i128 from {d} to {d}\n", .{ i128Min, i128Max });
    }
    {
        const iSizeMin: isize = std.math.minInt(isize);
        const iSizeMax: isize = std.math.maxInt(isize);
        std.debug.print("isize from {d} to {d}\n", .{ iSizeMin, iSizeMax });
    }
}
