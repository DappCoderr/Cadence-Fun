---
title: Lesson 5 - Resource
sidebar_position: 5
---

Resources are special type can only exist in `one` location at a time and must be used `exactly once`. A resource are declared using the `resource` keyword.

```jsx
access(all) contract HelloWorld {

	// .....more code

	// Declare a resource named `Country`
	access(all) resource Country{

	  init(){}
	}

	// .....more code
}
```

You can define variables and functions inside a resource. Every time you create a resource, you need to add an initializer to set initial variable values.

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

- **`pub`** is an access modifier, allowing anyone to read the variable.
- **use`resource`** keyword for create a resource Country

### Put It to the Test

- Create a resource named `KnightNFT`
- Create two public variable of name `id` and `xp` of type unsigned integer inside resource and initialise their value in the init function with value Zero.
