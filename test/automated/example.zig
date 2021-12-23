const message_db = @import("message-db");

const testing = @import("std").testing;

test "Example test" {
    try testing.expect(message_db.some_function(11) == 12);
}
