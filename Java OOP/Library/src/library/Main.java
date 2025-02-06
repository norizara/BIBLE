package Library;
import java.util.*;

public class Main {

    public class Author{
        private String nama;
        private String autobio;
        
        public Author(String nama, String autobio){
            this.nama = nama;
            this.autobio = autobio;
        }
        
        public String getName(){
            return nama;
        }
        public String getAuto(){
            return autobio;
        }
    }
    
    public class Book{
        private String nama;
        private String ISBN;
        private Author author;
        
        public Book(String nama, String ISBN, Author author){
            this.nama = nama;
            this.ISBN = ISBN;
            this.author = author;
        }
        
        public String getName(){
            return nama;
        }
        public String getISBN(){
            return ISBN;
        }
        public Author getAuthor(){
            return author;
        }
    }
    
    public class Library{
        ArrayList<Book> books;
        public Library(){
        books = new ArrayList<>();        
    }
        
        public void addBook(Book book){
            books.add(book);
        }
    }
    
    public Main()
    {
        Author author1 = new Author("James Gosling", "Creator of the Java programming language.");
        Author author2 = new Author("Robert C. Martin", "Known for his works on software craftsmanship.");

        Book book1 = new Book("Java Programming", "123456789", author1);
        Book book2 = new Book("Clean Code", "987654321", author2);

        Library library = new Library();

        library.addBook(book1);
        library.addBook(book2);

        Borrower borrower = new Borrower("Alice");

        library.borrowBook(borrower, book1);
        library.borrowBook(borrower, book2);

        borrower.displayBorrowedBooks();

        library.returnBook(borrower, book1);
    
        borrower.displayBorrowedBooks();
        
        library.displayLibraryBooks();
}
    
    

    public static void main(String[] args) {
	new Main();
    }
}