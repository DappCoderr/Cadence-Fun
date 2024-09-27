---
title: Lesson 6 - Organizing Your Knight's Data
sidebar_position: 6
---

Remember the `Country` resource from before? Imagine using it to represent a single country, but with all its details neatly organized. That's where structs come in!

In this lesson, we'll see how to effectively combine resources and structs to structure data within resources.

Let's revisit the `Country` resource and add a `Details` struct to store its details in a structured way:

```jsx
access(all) resource Country {

  access(all) var id: UInt64
  // Access modifier can be adjusted based on needs (e.g., public, private)
  access(all) var details: Details

  init(_name: String, _population: UFix64) {
    self.id = 0
    self.country = Country(_name: _name, _population: _population)
  }
}
```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Add the `KnightDetails` struct within the `Knight` resource.

### Solution !!

![Alt text](image-4.png)
