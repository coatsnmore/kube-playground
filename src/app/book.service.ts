import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class BookService {

  constructor() { }

  getBooks() {
    return [{
      title: 'Some Dumb Book',
      author: 'Chris Idiot',
      comments: ['Worst Book Ever..']
    },
    {
      title: 'Some Great Book',
      author: 'Matt Genius',
      comments: ['Best Book Ever..']
    }]
  }
}
