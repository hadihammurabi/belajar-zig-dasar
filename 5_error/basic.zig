const std = @import("std");

const Error = error{InvalidArguments};

fn process() Error!void {
    return error.InvalidArguments;
}

pub fn main() !void {
    try process();

    process() catch |err| {
        std.debug.print("error: {}\n", .{err});
    };
}
