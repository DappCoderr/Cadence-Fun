---
title: Lesson 4 - Resource
sidebar_position: 4
---

Resources are a special type that represents unique and valuable assets. Think of them like the Mona Lisa painting or a rare Viking sword. Here's what makes resources special:

1. `Single Location`: A resource can only exist in one place at a time.
2. `One-Time Use`: Once a resource is used, it's considered consumed and cannot be used again.
3. `Creation`: Resources are created using the `create` keyword.
4. `Movement or Destruction`: A function using resources must be either moved or destroyed at the end of the function.

Let's create a resource:
To create a resource we use the `resource` keyword to create them:

```jsx
access(all) contract HelloWorld {

	access(all) resource World {

	  init() {
		// Initialization code
	  }
	}
}

```

Inside a resource, you can define variables and functions. Every time you create a resource, you must include an initializer to set initial variable values. Here's an example:

```jsx

// Declare a resource named `World`
access(all) resource World{
	access(all) var name: String
	access(all) var capital: String

	init(_name: String, _cap: String){
		self.name = _name
		self.capital = _cap
	}
}
```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a resource named KnightNFT.
3. Inside the resource, create three public variables named **_id_** (of type UInt64), **_name_** (of type String), and **_power_** (of type UInt64). Initialize id with a value of 0.

Next, we’ll learn how to organize related data using structs.

### Solution !!

![Alt text](image-2.png)

---

## Lesson 4: Resources

**Creating Resources:**

We use the `resource` keyword to define resources in Cadence.

**Example Contract:**

```cadence
access(all) contract HelloWorld {

  // Define a resource named 'World'
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
}
```

**Breakdown:**

- `access(all) resource World { ... }`: Defines a resource named `World` with internal variables and functions.
- `init(_name: String, _cap: String)`: The initializer function sets the initial values for `name` and `capital` when a new `World` resource is created.

**Putting It to the Test:**

Open the Flow Playground and create a resource named `KnightNFT`. Inside the resource, define three public variables:

- `id` (type: `UInt64`) - To store a unique identifier for each knight NFT.
- `name` (type: `String`) - To store the knight's name.
- `power` (type: `UInt64`) - To store the knight's fighting power.

Initialize the `id` with a value of 0 in the initializer.

**Next Steps:**

In the next lesson, we'll explore structs, a way to organize related data within your contracts.
