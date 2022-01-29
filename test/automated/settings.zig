const message_db = @import("message-db");

const std = @import("std");

//test "Local File" {
//    const settings = message_db.Settings.read(.{});
//    defer std.json.parseFree(message_db.Settings, settings);
//
//    try std.testing.expect(std.mem.eql(u8, settings.dbname.?, "message_store"));
//    try std.testing.expect(std.mem.eql(u8, settings.host.?, "localhost"));
//    try std.testing.expect(settings.port.? == 5432);
//}

test "Local File, Explicit Allocator" {
    const settings = message_db.Settings.read(.{ .allocator = std.testing.allocator });
    defer std.json.parseFree(message_db.Settings, settings, .{ .allocator = std.testing.allocator });

    try std.testing.expect(std.mem.eql(u8, settings.dbname.?, "message_store"));
    try std.testing.expect(std.mem.eql(u8, settings.host.?, "localhost"));
    try std.testing.expect(settings.port.? == 5432);
}

//test "Local File, Explicit File"

//test "Local File, Explicit File, No Such File"

//test "Local File, Parse Error"
