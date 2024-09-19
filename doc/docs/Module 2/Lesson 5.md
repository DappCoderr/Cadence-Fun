---
title: Lesson 5 - Structs
sidebar_position: 5
---

A **_struct_** (short for structure) is like a container that holds different types of information under one label. Structs help organize related pieces of data together.

Let's say you want to track details about different countries. Here's how you could use a struct to organize relevant information:

```jsx

// Define a struct named `Country`
access(all) struct Country {

}

```

Inside a struct, you can define variables and functions. Every time you create a struct followed by the structure name, you must include an initializer to set initial variable values. Let's take a look:

```jsx
access(all) struct Country {
    access(all) let country_ID: UInt64
    access(all) var name: String

    init(_name: String, _population: UFix64){
        self.country_ID = 1
        self.name = _name
    }
}

```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a struct named `Knight`.
3. Inside add two variable `name` (of type String) and `power` (of type UInt64)
4. Initialize name and power in the init function.

### Solution !!

![Alt text](image-3.png)
