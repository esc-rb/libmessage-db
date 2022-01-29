const MessageDB = @import("message-db");

const std = @import("std");

test "Connect, Raw, Default Values" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb(null);

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_OK);
}

test "Connect, Raw, URL" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb("postgresql://localhost:5432/postgres");

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_OK);
}

test "Connect, Raw, Keyword/Value" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb("host=localhost port=5432 dbname=postgres");

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_OK);
}

test "Connect, Then Disconnect" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb(null);

    MessageDB.Connect.Raw.PQfinish(pg_connection);

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_STARTED);
}

test "Connect, Then Reset Connection" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb(null);

    MessageDB.Connect.Raw.PQreset(pg_connection);

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_OK);
}

test "Connect, No Server" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb("port=11111");

    var status = MessageDB.Connect.Raw.PQstatus(pg_connection);

    try std.testing.expect(status == MessageDB.Connect.Raw.ConnStatusType.CONNECTION_STARTED);
}

test "Connect, Perform Query" {
    var pg_connection = try MessageDB.Connect.Raw.PQconnectdb(null);

    var result = MessageDB.Connect.Raw.PQexec(pg_connection, "SELECT 1;");

    try std.testing.expect(result == 1);
}
