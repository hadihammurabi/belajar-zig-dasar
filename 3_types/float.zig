const std = @import("std");

pub fn main() void {
    {
        const f16Min: f16 = std.math.floatMin(f16);
        const f16Max: f16 = std.math.floatMax(f16);
        std.debug.print("f16 from {d} to {d}\n", .{ f16Min, f16Max });
    }
    {
        const f32Min: f32 = std.math.floatMin(f32);
        const f32Max: f32 = std.math.floatMax(f32);
        std.debug.print("f32 from {d} to {d}\n", .{ f32Min, f32Max });
    }
    {
        const f64Min: f64 = std.math.floatMin(f64);
        const f64Max: f64 = std.math.floatMax(f64);
        std.debug.print("f64 from {d} to {d}\n", .{ f64Min, f64Max });
    }
    {
        const f128Min: f128 = std.math.floatMin(f128);
        const f128Max: f128 = std.math.floatMax(f128);
        std.debug.print("f128 from {d} to {d}\n", .{ f128Min, f128Max });
    }
    {
        const c_longdoubleMin: c_longdouble = std.math.floatMin(c_longdouble);
        const c_longdoubleMax: c_longdouble = std.math.floatMax(c_longdouble);
        std.debug.print("c_longdouble from {d} to {d}\n", .{ c_longdoubleMin, c_longdoubleMax });
    }
}
