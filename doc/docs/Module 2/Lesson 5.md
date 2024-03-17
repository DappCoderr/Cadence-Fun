---
title: Lesson 5 - Resource
sidebar_position: 5
---

Resources play a crucial role in Cadence, representing valuable or unique assets on the Flow blockchain. They ensure secure ownership and control of assets, allowing them to exist uniquely and be managed safely. Let's understand how to create and work with resources:

```jsx
access(all) contract HelloWorld {

	access(all) resource Country{

	  init(){}
	}
}
```

Inside a resource, you can define variables and functions. Every time you create a resource, you must include an initializer to set initial variable values. Here's an example:

```jsx

// Declare a resource named `Country`
access(all) resource Country{
	access(all) var name: String
	access(all) var capital: String

	init(_name: String, _cap: String){
		self.name = _name
		self.capital = _cap
	}
}
```

Explanation:

- access(all): This access modifier allows anyone to read the variables.
- resource: This keyword signifies the creation of a resource, in this case, Country.
- init: This function initializes the resource, setting its initial state. Here, it takes parameters

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a resource named `KnightNFT`. Inside, create two public variable of name `id` and `xp` of type unsigned integer inside resource and initialise their value in the init function with value Zero.
