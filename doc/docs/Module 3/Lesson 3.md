---
title: Lesson 3 - Creating Storage
sidebar_position: 3
---

Now that you've learned how to create resources & dictionary. Let's use both the concept in our smart contract to store the Knight.

To do this, we'll create a dictionary in the contract that stores Knights resource as value and key as ID.

```jsx
access(all) contract HelloWorld {

    //...other code

    // Declare a dictionary to store countries by their ID
    access(all) let storedCountries: @{UInt64: Country}

    // Declare a resource Country
    access(all) resource Country{}

    // Initialize the dictionary in the contract's initializer
    init() {
        self.storedCountries <- {}
    }
}
```

The `storedCountries` dictionary isn't a resource itself, but it stores resources (countries). Therefore, we treat it like a resource by using `<-` to initialize it in the contract's initializer.

Remember, when defining a resource type, the `@` symbol must be added.

#### **Put It to the Test:**

Create a public dictionary named `storedKnight` of type resource and initialize its value in the `init` function.
