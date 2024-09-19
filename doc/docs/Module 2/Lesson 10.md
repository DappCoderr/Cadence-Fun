---
title: Lesson 10 - Creating Knight
sidebar_position: 10
---

Bringing Your Knight to Life

Now, let's use the createKnight function we defined earlier to create your first knight.

Using `create` and `<-`
To create a new resource, we'll use the create keyword and the `<-` operator.

- create: This keyword initializes a new resource.
- `<-`: This operator moves the newly created resource into a variable.

Here's an example:

```jsx
access(all) contract HelloWorld {

    // Declare a resource that only includes one function.
    access(all) resource HelloAsset {}

    // We're going to use the built-in create function
    // to create a new instance of the HelloAsset resource
    access(all) fun createHelloAsset(): @HelloAsset {
        return <- create HelloAsset()
    }

    init() {
        // contract initializer function
    }
}
```

:::note
The @ symbol before HelloAsset in the function's return type indicates that the function is returning a resource.
:::

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Use create keyword and move operator to form your first Knight.

### Solution !!

![Alt text](image-11.png)
