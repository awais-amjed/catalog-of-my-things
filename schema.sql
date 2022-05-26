create TABLE game(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    author_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(id)
);

create TABLE author(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);
