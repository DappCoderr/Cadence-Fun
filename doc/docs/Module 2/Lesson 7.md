---
title: Lesson 7 - Using Structs in Resources
sidebar_position: 7
---

In this section, we will be using structs in resources which helps manage complex data structures more effectively. Imagine you have a struct called Book, which stores information about a book, including its title, author, and publication year.

```jsx
access(all) struct Book {
    access(all) var title: String
    access(all) var author: String
    access(all) var year: UInt16
}

```

Now, let's create a resource named Library to manage books. Instead of handling book details separately, we can use the Book struct within the Library resource.

```jsx
// .....more code

access(all) resource Library {

    access(all) var book: Book

    access(all) fun borrowBook() {
        // Implementation details for borrowing a book
    }

    access(all) fun returnBook() {
        // Implementation details for returning a book
    }
}

// .....more code
```

Explanation:

### Put It to the Test

- Create a struct named `KnightDetails`
- In struct create two variable named as `name`, `createdDate` of type `string` and `UFix64` respectively.
- Initialise `name` value in init function.
- Initialise `createdDate` with value `getCurrentBlock().timestamp`
- Increment `nextKnightId` and `totalSupply` in init function
