---
title: Lesson 8 - enum
sidebar_position: 8
---

Enumerations are sets of symbolic names bound to unique, constant values, which can be compared by identity. This means they provide you with some predefined values that reduce bugs in your code.

For example, imagine you're developing an application for a fresh juice shop. You want to limit the glass sizes to small, medium, and large to ensure orders are correctly processed. Enums can help enforce this restriction.

- Enums are declared using the enum keyword.
- Enum cases are declared using the case keyword, followed by the name of the enum case.

```jsx
// Declare an enum named `Size` to represent glass sizes
access(all) enum Size: UInt8 {
    access(all) case small
    access(all) case medium
    access(all) case large
}

```

In this example, Size is an enum with three cases: small, medium, and large.

#### Integration with Structs:

You can integrate enums into structs to represent specific attributes or options. For instance, let's add the Size enum to a Glass struct:

```jsx
// Define a struct named `Glass` to represent a glass of juice
access(all) struct Glass {
    access(all) let size: Size
    access(all) var isFilled: Bool

    // Initialize the struct with size and fill status
    init(size: Size, isFilled: Bool) {
        self.size = size
        self.isFilled = isFilled
    }
}

```

Here, the Glass struct includes a size property of type Size (enum), representing the size of the glass.

By utilizing enums within structs, you can maintain clarity and consistency in your code while reducing the likelihood of errors related to incorrect value assignments.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create an enum named `Types` of type `UInt8` and add different type case `fire`, `grass`, `sun`, `rock` .
3. Create public variable named `types` of type enum
4. Initialise value of `types`
