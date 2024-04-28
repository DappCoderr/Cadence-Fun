---
title: Lesson 7 - Organizing Resource Data with Structs
sidebar_position: 7
---

This lesson shows how to use structs within resources! Structs act like containers to group related data. Imagine you have a struct called `Book`, which stores information about a book, such as its title and author.

```cadence
access(all) struct Book {
    access(all) var title: String
    access(all) var author: String

    init(_title: String, _author: String){
        self.title = _title
        self.author = _author
    }
}
```

Now, let's create a resource named `Library` to manage books. Instead of handling book details separately, we'll use the `Book` struct within the `Library` resource.

```cadence
access(all) resource Library {

    access(all) var book: Book

    init(title: String, author: String){
        self.book = Book(_title: title, _author: author)
    }
}
```

### Breaking it Down:

- We define a struct `Book` with properties for `title` and `author`.
- The `Library` resource contains a property `book` of type `Book`.
- In the `init` function of `Library`, we initialize the `book` property with the provided title and author.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Use `KnightDetails` inside a `KnightNFT` resource.
   This way, we keep knight data organized and easy to manage.

### Solution !!

![Alt text](image-2.png)
