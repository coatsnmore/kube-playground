const express = require('express')
const app = express()
const cors = require('cors');
const port = 3000;

app.use(cors());

// respond with "hello world" when a GET request is made to the homepage
app.get('/books', function (req, res) {

    setTimeout(function (){
        let books = [{
            title: 'Some Dumb Book',
            author: 'Chris Idiot',
            comments: ['Worst Book Ever..']
        },
        {
            title: 'Some Great Book',
            author: 'Matt Genius',
            comments: ['Best Book Ever..']
        }];
        res.send(books)
    }, 2000);
})

app.listen(port, () => console.log(`Example app listening on port: ${port}!`))