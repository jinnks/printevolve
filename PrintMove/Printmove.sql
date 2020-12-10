--
-- Create a very simple database to hold Client and Request information
--
PRAGMA foreign_keys = ON;
CREATE TABLE request (
        id                   INTEGER PRIMARY KEY,
        request_type         TEXT ,
        request_message      TEXT,
        request_from         TEXT
);
CREATE TABLE client_request (
        client_id     INTEGER REFERENCES client(id) ON DELETE CASCADE ON UPDATE CASCADE,
        request_id    INTEGER REFERENCES request(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY   (client_id, request_id)
);
CREATE TABLE client (
        id           INTEGER PRIMARY KEY,
        client_name  TEXT
);
--
-- load client data
--

INSERT INTO client VALUES (1, 'IBM');
INSERT INTO client VALUES (2, 'MICROSOFT');
INSERT INTO client VALUES (3, 'APPLE');
INSERT INTO client VALUES (4, 'FACEBOOK');
INSERT INTO client VALUES (5, 'GOOGLE');