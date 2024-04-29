---
title: Lesson 8 - enum
sidebar_position: 8
---

We've learned how to organize data with structs, but what if a variable can only have specific values? Enums come to the rescue!

#### Enums like Checklists for Your Code

Imagine a coffee shop with three cup sizes: small, medium, and large. An enum acts like a checklist, ensuring your code only uses these valid options. This reduces errors and keeps things organized.

- We use the `enum` keyword to create enums.
- Each option within the enum is called a `case`

```jsx
access(all) enum CupSize: UInt8 {
    access(all) case small
    access(all) case medium
    access(all) case large
}
```

### Breaking it Down:

- `CupSize` is the name of the enum.
- `UInt8` specifies the underlying data type (unsigned 8-bit integer).
- `small`, `medium`, and `large` are the individual cases (options) within the enum.

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

### **Explanation:**

Here, the Glass struct includes a size property of type Size (enum), representing the size of the glass.

By utilizing enums within structs, you can maintain clarity and consistency in your code while reducing the likelihood of errors related to incorrect value assignments.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create an enum named `Types` of type `UInt8` and add different type case `fire`, `grass`, `sun`, `rock` .
3. Create public variable named `types` of type enum
4. Initialise value of `types`
