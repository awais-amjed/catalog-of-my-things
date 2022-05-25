CREATE TABLE music_album(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    on_spotify BOOL,
    archived BOOL,
    genre_id INT REFERENCES genre (id),
    source_id INT REFERENCES source (id),
    author_id INT REFERENCES author (id),
    label_id INT REFERENCES label (id),
)