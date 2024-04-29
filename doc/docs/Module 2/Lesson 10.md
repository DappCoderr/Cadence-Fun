---
title: Lesson 10 - enum with Structs
sidebar_position: 10
---

We can integrate enums into structs to represent specific choices. Let's add CupSize to an Order struct:

#### Enums like Checklists for Your Code

Imagine a coffee shop with three cup sizes: small, medium, and large. An enum acts like a checklist, ensuring your code only uses these valid options. This reduces errors and keeps things organized.

- We use the `enum` keyword to create enums.
- Each option within the enum is called a `case`

```jsx
access(all) struct Order {
  let size: CupSize  // Property of type CupSize (enum)
  var cream: Bool

  init(size: CupSize, cream: Bool) {
    self.size = size
    self.cream = cream
  }
}
```

Now, when creating an order, you can only choose valid sizes from the CupSize enum. This helps prevent errors and keeps your code clean.

### Breaking it Down:

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create an enum named `Types` of type `UInt8` and add different type case `fire`, `grass`, `sun`, `rock` .
3. Create public variable named `types` of type enum
4. Initialise value of `types`
