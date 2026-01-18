<?php
require_once __DIR__ . '/../src/Repositories/BookRepository.php';


// test add book :
$bookRepo = new BookRepository();
$book = new Book(1001, 'before the coffee gets cold', 2008, 'available');

// $result = $bookRepo->addBook($book);
// echo $result ? "Book inserted\n" : "Insert failed\n";

// ************      test find book by ID    **************
// $foundBook = $bookRepo->findByIsbn(1001);
// if ($foundBook) {
//     echo $foundBook->getTitle() . "\n";
// } else {
//     echo "Book not found\n";
// }

//***************   test search by title    ************** : 
// $books = $bookRepo->searchByTitle('before the coffee gets cold');
// foreach ($books as $b) {
//     echo "we found the book :";
//     echo $b->getTitle() . "\n";
// }

//****************** test avaibality in library branchs *****************
$availability = $bookRepo->getAvailabilityByBranch(2);
print_r($availability);
