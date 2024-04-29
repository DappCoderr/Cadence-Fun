---
title: Lesson 3 - State Variables
sidebar_position: 3
---

In cadence variables are like bits of information that stored on the blockchain, much like writing data to a database. In Cadence, we use two main keywords:

`var` for variables that can change.
`let` for constants that can not be change.

```jsx
access(all) contract HelloWorld {

	// Declare a variable named greetings
	access(all) var country: String

	// Declare a constant named num
	access(all) let population: UInt64

	init(){
		self.country = "India"
		self.population = 10
	}
}
```

### Breaking it Down:

- `access(all)` is an access modifier, allowing anyone to read the variable.
- `var` & `let` is for variable and constants respectively.
- `country` & `population` showcasing variable and constants country respectively.
- `String` & `UInt64` are types, holding text and unsigned integers (e.g. "India" and 10).
- In the `init` function, we set `self.country` to "India" and `self.population` to 10. This function runs when the contract is deployed, initializing values. This function is used to set up initial values.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public variables, `totalSupply` of type `UInt64`, initialized with 0.

### Solution !!

![Alt text](image-1.png)
