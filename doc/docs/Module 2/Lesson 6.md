---
title: Lesson 6 - Structs
sidebar_position: 6
---

A `struct`, which stands for structure, is like a container that holds different types of information under one label. Structs help organize related pieces of data together, making it easier to manage and work with complex information.

For instance, if you're managing a library and need to track details about each book like Title, Author, Subject, and Book ID, you can use a struct to group these attributes together.

```jsx

// Define a struct named `Person`
access(all) struct Person {
    access(all) var name: String
    access(all) var age: UInt8

    init(_name: String, _age: UFix64){
        self.name = _name
        self.age = _age
    }
}

```

Explanation:

- In this example, we define a struct named Person.
- It has two variables: name of type String and age of type UInt8.
- We use the init function to initialize the Person struct with a name and age.
- access(all) ensures that both variables are accessible from anywhere in the code.

#### Put It to the Test:

- Create a struct named `KnightDetails`.
- The struct should have two variables: `name` and `createdDate`, of type `String` and `UFix64` respectively.
- Initialize name and createdDate in the init function.
- To get the current date, use getCurrentBlock().timestamp.
