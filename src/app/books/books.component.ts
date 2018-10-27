import { Component, OnInit } from '@angular/core';
import { Book } from '../book';
import { BookService } from '../book.service';
import {
  trigger,
  state,
  style,
  animate,
  transition
} from '@angular/animations';

@Component({
  selector: 'app-books',
  templateUrl: './books.component.html',
  styleUrls: ['./books.component.css'],
  animations: [
    trigger('loadingBooks', [
      state('loading', style({
        height: '100px',
        opacity: 0.5,
        backgroundColor: 'yellow'
      })),
      state('loaded', style({
        height: '100px',
        opacity: 1.0,
        backgroundColor: 'white'
      })),
      transition('loading => loaded', [
        animate('1s')
      ])
    ])]
})
export class BooksComponent implements OnInit {

  currentLoadState:string = 'loading';
  selectedBook: Book;

  books: Book[];

  constructor(private bookService: BookService) { }

  ngOnInit() {
    this.getbooks();
  }

  onSelect(book: Book) {
    this.selectedBook = book;
  }

  loadState(){
    return this.currentLoadState;
  }

  getbooks() {
    // this.currentLoadState = ''true'';
    this.bookService.getBooks()
      .subscribe(books => {
        this.books = books;
        this.currentLoadState = 'loaded';
      })
  }
}
