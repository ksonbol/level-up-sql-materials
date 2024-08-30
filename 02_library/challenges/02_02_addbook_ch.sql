-- Add books to the library database.

-- Title: Dracula
-- Author: Bram Stoker
-- Published: 1897
-- ID Number: 4819277482

-- Title: Gulliver’s Travels into Several Remote Nations of the World
-- Author: Jonathan Swift
-- Published: 1729
-- ID Number: 4899254401

INSERT INTO Books (Title, Author, Published, BarCode)
  VALUES 
    ('Dracula', 'Bram Stoker', 1897, 1897),
    ('Gulliver’s Travels into Several Remote Nations of the World',
     'Jonathan Swift', 1729, 4899254401);

SELECT * from Books
Order by BookId DESC
limit 5;

-- Note: if you want to include name with ' in it, you need to write a double '' to include it.