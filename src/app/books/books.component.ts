import { Component, OnInit } from '@angular/core';
import { Book } from '../book';
import { BookService } from '../book.service';

@Component({
  selector: 'app-books',
  templateUrl: './books.component.html',
  styleUrls: ['./books.component.css']
})
export class BooksComponent implements OnInit {

  selectedBook: Book;

  books: Book[];

  constructor(private bookService: BookService) { }

  ngOnInit() {
    this.getbooks();
  }

  onSelect(book: Book) {
    this.selectedBook = book;
  }

  getbooks() {
    this.bookService.getBooks()
      .subscribe(books => this.books = books);
  }
}
