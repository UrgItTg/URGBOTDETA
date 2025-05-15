BEGIN TRANSACTION;
CREATE TABLE channels (
            channel_id INTEGER PRIMARY KEY AUTOINCREMENT,
            owner_id INTEGER,
            channel_username TEXT,
            display_name TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(owner_id, channel_username)
        );
CREATE TABLE coin_orders (
            order_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            quantity INTEGER,
            price REAL,
            receipt_file_id TEXT,
            status TEXT DEFAULT 'pending',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            admin_id INTEGER
        );
CREATE TABLE joined_channels (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            channel_username TEXT,
            join_type TEXT,
            order_id INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(user_id, channel_username, join_type)
        );
CREATE TABLE referrals (
            referrer_id INTEGER NOT NULL,
            referred_user_id INTEGER NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (referrer_id, referred_user_id)
        );
CREATE TABLE settings (
            key TEXT PRIMARY KEY,
            value TEXT
        );
CREATE TABLE subscriber_orders (
            order_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id INTEGER,
            channel_username TEXT,
            required INTEGER,
            current INTEGER DEFAULT 0,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
CREATE TABLE transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            amount REAL,
            date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            description TEXT
        );
CREATE TABLE users (
            user_id INTEGER PRIMARY KEY,
            phone TEXT,
            coin_balance INTEGER DEFAULT 2,
            coin_fraction REAL DEFAULT 0,
            warnings INTEGER DEFAULT 0,
            banned INTEGER DEFAULT 0,
            registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
DELETE FROM "sqlite_sequence";
COMMIT;
