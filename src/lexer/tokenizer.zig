source: []const u8,
index: u32 = 0,

pub fn init(source: []const u8) Tokenizer {
    const max_size = std.math.maxInt(u32);
    if ( source.len() == max_size) {
        std.debug.print("The source lenght bigger then {u}", .{max_size});
        std.process.exit(1);
    }
    return .{ .source = source };
}

fn getChar(self: *Tokenizer)  u8 {
    return self.source[self.index];
}

pub fn next(self: *Tokenizer) Token {
    while (std.ascii.isWhitespace(self.getChar())) {
     self.index += 1;
    }

    const start = self.index;
    return switch (self.getChar()) {
        0...9 => {
            while (std.ascii.isDigit(self.getChar())) {
                self.index += 1;
            }

            if ( !std.ascii.isWhitespace(self.source(self.index + 1)) ) {
                // Error
                std.process.exit(1);
            }

            return .{ .start = start, .end = self.index, .tag = .number};
        },
        '+' => {
            return .{ .start = start, .end = start, .tag = .plus};
        },

        else => {
            std.debug.print("Unknown symbol", .{});
            std.process.exit(1);
        }
    };
}

const Tokenizer = @This();
const Token = @import("token.zig");
const std = @import("std");
