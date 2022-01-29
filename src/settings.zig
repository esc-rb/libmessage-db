const std = @import("std");

pub const Settings = struct {
    // See: https://www.postgresql.org/docs/9.1/libpq-connect.html
    // See: https://github.com/eventide-project/message-store-postgres/blob/master/lib/message_store/postgres/settings.rb#L12-L32
    host: ?[]const u8 = null,
    hostaddr: ?[]const u8 = null,
    port: ?u32 = null,
    dbname: ?[]const u8 = null,
    user: ?[]const u8 = null,
    password: ?[]const u8 = null,
    connect_timeout: ?u32 = null,
    //client_encoding
    options: ?[]const u8 = null,
    //application_name
    //fallback_application_name
    keepalives: ?u32 = null,
    keepalives_idle: ?u32 = null,
    keepalives_interval: ?u32 = null,
    keepalives_count: ?u32 = null,
    //tty
    //sslmode
    //requiressl (deprecated)
    //sslcert
    //sslkey
    //sslrootcert
    //sslcrl
    //requirepeer
    //krbsrvname
    //gsslib
    //service

    //pub const Read = struct {
    //    pub const Arguments = struct {
    //        path: []const u8 = "settings/message_db.json",
    //        allocator: ?*std.mem.Allocator = null
    //    };

    //    pub fn call(args: Arguments) Settings {
    //        const path = args.path;

    //        var allocator: *std.mem.Allocator = undefined;

    //        if (args.allocator) |a| {
    //            allocator = a;
    //        } else {
    //            var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    //            defer arena.deinit();

    //            allocator = &arena.allocator;
    //        }

    //        const file = std.fs.cwd().openFile(path, .{ .read = true }) catch unreachable;

    //        const file_reader = file.reader();

    //        const buffer = allocator.alloc(u8, 1024) catch unreachable;
    //        defer allocator.free(buffer);

    //        const bytes = file_reader.readAll(buffer) catch unreachable;

    //        var token_stream = std.json.TokenStream.init(buffer[0..bytes]);
    //        comptime {
    //            @setEvalBranchQuota(100000);
    //        }
    //        var settings = std.json.parse(Settings, &token_stream, .{ .allocator = allocator }) catch unreachable;

    //        return settings;
    //    }
    //};

    //pub fn read(args: Read.Arguments) Settings {
    //    return Read.call(args);
    // }
};
