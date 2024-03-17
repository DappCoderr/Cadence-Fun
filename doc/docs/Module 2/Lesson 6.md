---
title: Lesson 6 - Structs
sidebar_position: 6
---

A `struct`, which stands for structure, is like a container that holds different types of information under one label. Structs help organize related pieces of data together, making it easier to manage and work with complex information.

For instance, if you're managing a library and need to track details about each book like Title, Author, Subject, and Book ID, you can use a struct to group these attributes together.

```jsx

// Define a struct named `Book`
access(all) struct Book {

}

```

Inside a struct, you can define variables and functions. Every time you create a struct, you must include an initializer to set initial variable values. Let's take a look:

```jsx

// Define a struct named `Book`
access(all) struct Book {
    access(all) var title: String
    access(all) var author: String

    init(_title: String, _author: String){
        self.title = _title
        self.author = _author
    }
}

```

Explanation:

- In this example, we define a struct named Person.
- It has two variables: name of type String and age of type UInt8.
- We use the init function to initialize the Person struct with a name and age.
- access(all) ensures that both variables are accessible from anywhere in the code.

#### Put It to the Test:

1. Open Flow [Playground](https://play.flow.com/)
2. Create a struct named `KnightDetails`. And inside two variables: `name` and `createdDate`, of type `String` and `UFix64` respectively.
3. Initialize name and createdDate in the init function.
4. To get the current date, use getCurrentBlock().timestamp.
