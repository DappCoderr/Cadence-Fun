---
title: Lesson 4 - Resource
sidebar_position: 4
---

Resources are a special type that represents unique and valuable assets. Think of them like the Mona Lisa painting or a rare Viking sword. Here's what makes resources special:

1. `Single Location`: A resource can only exist in one place at a time.
2. `One-Time Use`: Once a resource is used, it's considered consumed and cannot be used again.
3. `Creation`: Resources are created using the `create` keyword.
4. `Movement or Destruction`: A function using resources must be either moved or destroyed at the end of the function.

Let's create a `World `resource: To create a resource we use the `resource` keyword to create them:

```jsx
access(all) contract HelloWorld {

    // Define a resource named 'World'
	access(all) resource World {
            // Initializer
	    init() {}
	}
}

```

Inside a resource, you can define variables and functions. Every time you create a resource, you must include an initializer to set initial variable values. Here's an example:

```jsx
  access(all) resource World {

    // Variables and functions can be defined within a resource
    access(all) var name: String
    access(all) var capital: String

    // Every resource needs an initializer to set initial values
    init(_name: String, _cap: String) {
      self.name = _name
      self.capital = _cap
    }
}
```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a resource named `Knight`.
3. Inside the resource, create three variables

- `id` (of type UInt64)
- `name`(of type String)
- `power`(of type UInt64).
- Initialize `id` with a value of 0.

### Solution !!

![Alt text](image-2.png)
