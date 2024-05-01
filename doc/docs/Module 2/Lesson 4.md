---
title: Lesson 4 - Resource
sidebar_position: 4
---

Flow lets you create special items called resources. Imagine Mono lisa painting or unique vikings sword. These are unique and valuable, just like resources in programming. They represent valuable and unique things on the blockchain, ensuring secure ownership and control.

We'll use the resource keyword to create them and explore how to manage them within your contracts.

```jsx
access(all) contract HelloWorld {

	access(all) resource World{

	  init(){}
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

### Breaking it Down:

- `access(all)`: This access modifier allows anyone to read the variables.
- `resource`: This keyword signifies the creation of a resource, in this case, World.
- Defining two variables `name` and `capital` of type `String`

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a resource named `KnightNFT`.
3. Inside resource, create three public variables named `id` (of type UInt64), `name` (of type String), `power` (of type UInt64) initialize id with 0 value.

### Solution !!

![Alt text](image-2.png)
