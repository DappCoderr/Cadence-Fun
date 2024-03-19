---
title: "Lesson 5 - Creating Knight"
sidebar_position: 5
---

In the Module 2 function declaration lesson, we have created a first function called `createKnight`. In this lesson, we will use that function to create our first knight.

- To create a resource, we will use the `create` keyword and the `move` operator `<-`.
- You use the `create` keyword to initialize a resource. Resources must be created before you can use them.
- The move operator `<-` is used to move a resource into a variable. You cannot use the assignment operator `=` with resources, so when you initialize a resource, you will need to use the move operator `<-`.

```jsx
access(all) contract HelloWorld {

    // Declare a resource that only includes one function.
    access(all) resource HelloAsset {}

    // We're going to use the built-in create function
    // to create a new instance of the HelloAsset resource
    access(all) fun createHelloAsset(): @HelloAsset {
        return <-create HelloAsset()
    }

    init() {
        // contract initializer function
    }
}
```

- Inside the `storeCounty` function, we use the force-move operator `<-!`. This is called the “force-move operator”. Cadence requires us to use this with dictionaries because it will abort the program if a Knight at the specific `id` already exists.
- This is protecting us from accidentally overwriting a Knight in the dictionary.

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Use create keyword and move operator to form your first Knight.
