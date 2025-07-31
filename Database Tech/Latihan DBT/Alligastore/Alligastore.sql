CREATE TABLE authors (
    AuthorID CHAR(5) PRIMARY KEY CHECK (AuthorID REGEXP '^AU[0-9]{3}$'),
    AuthorName VARCHAR(100) NOT NULL,
    AuthorEmail VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    GenreID CHAR(5) PRIMARY KEY CHECK (GenreID REGEXP '^GE[0-9]{3}$'),
    GenreName VARCHAR(50) NOT NULL
);

CREATE TABLE publishers (
    PublisherID CHAR(5) PRIMARY KEY CHECK (PublisherID REGEXP '^PU[0-9]{3}$'),
    PublisherName VARCHAR(100) NOT NULL,
    PublisherAddress VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    BookID CHAR(5) PRIMARY KEY CHECK (BookID REGEXP '^BO[0-9]{3}$'),
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    PublisherID CHAR(5),
    PublicationYear INT,
    Price INT NOT NULL CHECK (Price >= 0),
    GenreID CHAR(5),
    FOREIGN KEY (GenreID) REFERENCES genres(GenreID),
    FOREIGN KEY (PublisherID) REFERENCES publishers(PublisherID)
);

CREATE TABLE authorsbooks (
    AuthorID CHAR(5),
    BookID CHAR(5),
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID),
    FOREIGN KEY (BookID) REFERENCES books(BookID)
);

CREATE TABLE customers (
    CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID REGEXP '^CU[0-9]{3}$'),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE CHECK (Email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'),
    Address VARCHAR(255) NOT NULL
);

INSERT INTO authors (AuthorID, AuthorName, AuthorEmail)
VALUES
    ('AU001', 'J.K. Rowling', 'jkrowling@example.com'),
    ('AU002', 'Stephen King', 'stephenking@example.com'),
    ('AU003', 'Agatha Christie', 'agathachristie@example.com');

INSERT INTO genres (GenreID, GenreName)
VALUES
    ('GE001', 'Fantasy'),
    ('GE002', 'Horror'),
    ('GE003', 'Mystery');

INSERT INTO books (BookID, Title, ISBN, PublicationYear, Price, GenreID)
VALUES
    ('BO001', 'Harry Potter and the Philosopher''s Stone', '9780747532743', 1997, 1999, 'GE001'),
    ('BO002', 'It', '9781501175466', 1986, 1799, 'GE002'),
    ('BO003', 'Murder on the Orient Express', '9780062073495', 1934, 1495, 'GE003');

INSERT INTO publishers (PublisherID, PublisherName, PublisherAddress)
VALUES
    ('PU001', 'Bloomsbury Publishing', 'London, UK'),
    ('PU002', 'Simon & Schuster', 'New York, USA');

INSERT INTO authorsbooks (AuthorID, BookID)
VALUES
    ('AU001', 'BO001'),
    ('AU002', 'BO002'),
    ('AU003', 'BO003');

INSERT INTO customers (CustomerID, FirstName, LastName, Email, Address)
VALUES
    ('CU001', 'Stephen', 'William', 'step_tang@gmail.com', 'RTB'),
    ('CU002', 'Ruth', 'Timorah', 'ruth_timorahaha@gmail.com', 'RTB'),
    ('CU003', 'Jacky', 'Setiawan', 'jackysetiawan6@gmail.com', 'RTB'),
    ('CU004', 'Ferren', 'Andrea', 'feragustinus@gmail.com', 'RTB'),
    ('CU005', 'Ichsan', 'Ilyasa', 'baller@gmail.com', 'RTB');