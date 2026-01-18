<?php
require_once __DIR__ . '/../src/Repositories/BookRepository.php';
require_once __DIR__ . '/../src/Repositories/AuthorRepository.php';
require_once __DIR__ . '/../src/Repositories/CategoryRepository.php';
require_once __DIR__ . '/../src/Repositories/LibraryBranchRepository.php';
require_once __DIR__ . '/../src/Repositories/BookCopyRepository.php';



$bookRepo = new BookRepository();
$authorRepo = new AuthorRepository();
$catRepo = new CategoryRepository();
$branchRepo = new LibraryBranchRepository();
$copyRepo = new BookCopyRepository();


//*****************    test add book    *********************** :
// $book = new Book(1001, 'before the coffee gets cold', 2008, 'available');
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
// $availability = $bookRepo->getAvailabilityByBranch(2);
// print_r($availability);




//--------------------------------------------------------------------------------------------------
// => AUTHOR:
//test ajout
// $author = new Author(1,'Haruki Murakami','Japanese novelist','Japanese','1949-01-12',null,'Literature');
// echo $authorRepo->addAuthor($author) ? "Author added\n" : "Insert failed\n";


//find by id test:
// $found = $authorRepo->findById(1);
// echo $found ? $found->getName() . "\n" : "Not found\n";


//find by author name 
// $list = $authorRepo->searchByName('Haruki Murakami');
// foreach ($list as $a) {
//     echo $a->getId() . "\n";
//     echo $a->getName() . "\n";
//     echo $a->getNationality() . "\n";
//     echo $a->getBirthDate() . "\n\n\n";

// }


//get books by author:
// $books = $authorRepo->getBooksByAuthor(1);
// print_r($books);




//-------------------------------------------------------------------------------------------------
// => catg
// add
// $cat = new Category(1, 'Literature');
// echo $catRepo->addCategory($cat) ? "Category added\n" : "Insert failed\n";


//get all :
// $cats = $catRepo->getAll();
// foreach ($cats as $c) {
//     echo $c->getName() . "\n";
// }


// find by name :
// $found = $catRepo->findByName('Literature');
// echo $found ? $found->getName() . "\t" .  $found->getID(): "Not found\n";



//---------------------------------------------------------------------------------
//=> library branches
// list :
// $branches = $branchRepo->getAll();
// foreach ($branches as $b) {
//     echo $b->getName() . " - " . $b->getLocation() . "\n";
// }

// find by id :
// $found = $branchRepo->findById(1);
// echo $found ? $found->getName() : "Not found";




//--------------------------------------------------------------------------------------------------
// =>book copy:
// add :
// $copy = new BookCopy(1, 1001, 5, 65);
// echo $copyRepo->addBookCopy($copy) ? "Book copy added\n" : "Insert failed\n";


// check the copies :
// $copies = $copyRepo->getByBook(1001);
// foreach ($copies as $c) {
//     echo "Branch: {$c->getBiblioId()} | Copies: {$c->getAvailableCopies()}\n";
// }


// update the availbale copies :
// echo $copyRepo->updateAvailableCopies(6, 40)
//     ? "Copies updated\n"
//     : "Update failed\n";


























