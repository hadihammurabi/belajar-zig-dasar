const std = @import("std");

pub fn main() void {
    {
        const u8Min: u8 = std.math.minInt(u8);
        const u8Max: u8 = std.math.maxInt(u8);
        std.debug.print("u8 from {d} to {d}\n", .{ u8Min, u8Max });
    }
    {
        const u16Min: u16 = std.math.minInt(u16);
        const u16Max: u16 = std.math.maxInt(u16);
        std.debug.print("u16 from {d} to {d}\n", .{ u16Min, u16Max });
    }
    {
        const u32Min: u32 = std.math.minInt(u32);
        const u32Max: u32 = std.math.maxInt(u32);
        std.debug.print("u32 from {d} to {d}\n", .{ u32Min, u32Max });
    }
    {
        const u64Min: u64 = std.math.minInt(u64);
        const u64Max: u64 = std.math.maxInt(u64);
        std.debug.print("u64 from {d} to {d}\n", .{ u64Min, u64Max });
    }
    {
        const u128Min: u128 = std.math.minInt(u128);
        const u128Max: u128 = std.math.maxInt(u128);
        std.debug.print("u128 from {d} to {d}\n", .{ u128Min, u128Max });
    }
    {
        const usizeMin: usize = std.math.minInt(usize);
        const usizeMax: usize = std.math.maxInt(usize);
        std.debug.print("usize from {d} to {d}\n", .{ usizeMin, usizeMax });
    }
}
