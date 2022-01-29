pub const libpq = @cImport({
    @cInclude("libpq-fe.h");
});

pub const Raw = struct {
    pub const ConnStatusType = enum(libpq.ConnStatusType) {
        CONNECTION_OK = libpq.CONNECTION_OK,
        CONNECTION_BAD = libpq.CONNECTION_BAD,
        CONNECTION_STARTED = libpq.CONNECTION_STARTED,
        CONNECTION_MADE = libpq.CONNECTION_MADE,
        CONNECTION_AWAITING_RESPONSE = libpq.CONNECTION_AWAITING_RESPONSE,
        CONNECTION_AUTH_OK = libpq.CONNECTION_AUTH_OK,
        CONNECTION_SETENV = libpq.CONNECTION_SETENV,
        CONNECTION_SSL_STARTUP = libpq.CONNECTION_SSL_STARTUP,
        CONNECTION_NEEDED = libpq.CONNECTION_NEEDED,
        CONNECTION_CHECK_WRITABLE = libpq.CONNECTION_CHECK_WRITABLE,
        CONNECTION_CONSUME = libpq.CONNECTION_CONSUME,
        CONNECTION_GSS_STARTUP = libpq.CONNECTION_GSS_STARTUP,
        CONNECTION_CHECK_TARGET = libpq.CONNECTION_CHECK_TARGET
    };

    pub fn PQconnectdb(conninfo: ?[*:0]const u8) error{OutOfMemory}!*libpq.PGconn {
        const conn_ptr = libpq.PQconnectdb(conninfo orelse "");

        if (conn_ptr) |conn| {
            return conn;
        } else {
            return error.OutOfMemory;
        }
    }

    pub fn PQfinish(conn: *libpq.PGconn) void {
        libpq.PQfinish(conn);
    }

    pub fn PQreset(conn: *libpq.PGconn) void {
        libpq.PQreset(conn);
    }

    pub fn PQstatus(conn: *libpq.PGconn) ConnStatusType {
        return switch (libpq.PQstatus(conn)) {
            @enumToInt(ConnStatusType.CONNECTION_OK) => ConnStatusType.CONNECTION_OK,
            @enumToInt(ConnStatusType.CONNECTION_BAD) => ConnStatusType.CONNECTION_STARTED,
            @enumToInt(ConnStatusType.CONNECTION_STARTED) => ConnStatusType.CONNECTION_STARTED,
            @enumToInt(ConnStatusType.CONNECTION_MADE) => ConnStatusType.CONNECTION_MADE,
            @enumToInt(ConnStatusType.CONNECTION_AWAITING_RESPONSE) => ConnStatusType.CONNECTION_AWAITING_RESPONSE,
            @enumToInt(ConnStatusType.CONNECTION_AUTH_OK) => ConnStatusType.CONNECTION_AUTH_OK,
            @enumToInt(ConnStatusType.CONNECTION_SETENV) => ConnStatusType.CONNECTION_SETENV,
            @enumToInt(ConnStatusType.CONNECTION_SSL_STARTUP) => ConnStatusType.CONNECTION_SSL_STARTUP,
            @enumToInt(ConnStatusType.CONNECTION_NEEDED) => ConnStatusType.CONNECTION_NEEDED,
            @enumToInt(ConnStatusType.CONNECTION_CHECK_WRITABLE) => ConnStatusType.CONNECTION_CHECK_WRITABLE,
            @enumToInt(ConnStatusType.CONNECTION_CONSUME) => ConnStatusType.CONNECTION_CONSUME,
            @enumToInt(ConnStatusType.CONNECTION_GSS_STARTUP) => ConnStatusType.CONNECTION_GSS_STARTUP,
            @enumToInt(ConnStatusType.CONNECTION_CHECK_TARGET) => ConnStatusType.CONNECTION_CHECK_TARGET,
            else => unreachable
        };
    }
};
