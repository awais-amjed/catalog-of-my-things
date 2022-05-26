CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    color VARCHAR(50),
    items TEXT []
);