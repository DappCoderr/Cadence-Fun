---
title: Lesson 6 - Structs
sidebar_position: 6
---

Struct types are used to represent a record. Suppose you want to keep track of your books in a library. You might want to track the following attributes about each book − `Title` , `Author` , `Subject` , `Book ID` . A Structures are declared using the `struct` keyword.
You can define variable and function inside resource. Every time you create a struct you have add initialiser to initialise defined variables values.

```jsx
// .....more code

access(all) struct CountryDetails{
    access(all) let countryBudget: UFix64
    access(all) var touristAreAllowed: Bool

    init(budget:UFix64){
        self.countryBudget = budget
        self.touristAreAllowed = false
    }
}

// .....more code

```

Explanation:

### Put It to the Test

- Create a struct named `KnightDetails`
- Our struct will have two variable named as `name`, `createdDate` of type `string` and `UFix64` respectively.
- Initialise `name` and `createdDate`in init function.
- To get current date use `getCurrentBlock().timestamp`
