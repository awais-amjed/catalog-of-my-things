CREATE TABLE book (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(4),
    publish_date DATE,
    archived BOOLEAN,
    label_id SERIAL NOT NULL,
    CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Label(id)
);