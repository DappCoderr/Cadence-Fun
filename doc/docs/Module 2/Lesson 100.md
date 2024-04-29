<!-- ---
title: Lesson 10 - function declaration
sidebar_position: 13
---

In Cadence, declaring a function involves specifying its visibility, `fun` keyword, function name, parameters, return type (if any).

Let's break down the structure of a function declaration:

```jsx
// Define a function named setNewValue
access(all) fun setNewValue(newVal: UInt64) {
    // Function body
}
```

### Breaking it Down:

- `access(all)`: This specifies the visibility of the function, allowing it to be accessed from anywhere.
- `fun`: This keyword indicates that we're declaring a function.
- `setNewValue`: This is the name of the function.
- `(newVal: UInt64)`: These are the parameters the function takes. Here, `newVal` is of type `UInt64`.
- `{}`: This is the function body, where you write the code that the function will execute.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public function named `createKnight`.

### Solution !!

![Alt text](image-4.png) -->
