---
title: Lesson 4 - State Variables
sidebar_position: 4
---

Now that we've learned how to write a contract, let's dive into how Cadence deals with variables.

In Cadence, variables are declared using **`var`**, and constants are declared using **`let`**. Let's look at an example:

```jsx
access(all) contract HelloWorld {

	// Declare a variable named greetings
	access(all) var greetings: String

	// Declare a constant named num
	access(all) let num: UInt64

	init(){
		self.greetings = "Hello World"
		self.num = 64
	}
}
```

Explanation:

- `access(all)` is an access modifier, allowing anyone to read the variable.
- `let` is for constants that cannot be changed.
- `String` & `UInt64` are types, holding text and unsigned integers (e.g., "Hello World" and 64).

In the `init` function, we set `self.greeting = "Hello, World!"` and `self.num = 64`. This function runs when the contract is deployed, initializing values.

### Put It to the Test

Create two public variables, `totalSupply` and `nextKnightId`, both initialized to 0. Both variables should be of type `UInt64`.