---
title: Lesson 4 - State Variables
sidebar_position: 4
---

In cadence variables are like bits of information that stored on the blockchain, much like writing data to a database. In Cadence, we use two main keywords:

`var` for variables that can change.
`let` for constants that can not be change.

```jsx
access(all) contract HelloWorld {

	// Declare a variable named greetings
	access(all) var name: String

	// Declare a constant named num
	access(all) let age: UInt64

	init(){
		self.name = "Roham"
		self.age = 21
	}
}
```

### Breaking it Down:

- `access(all)` is an access modifier, allowing anyone to read the variable.
- `let` is for constants that cannot be changed.
- `String` & `UInt64` are types, holding text and unsigned integers (e.g., "Roham" and 21).
- In the `init` function, we set `self.name` to "Roham" and `self.age` to 21. This function runs when the contract is deployed, initializing values. This function is used to set up initial values.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public variables, `totalSupply` of type `UInt64`, initialized with 0.
