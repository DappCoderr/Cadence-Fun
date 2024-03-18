---
title: Lesson 7 - Reading from Storage / View function
sidebar_position: 7
---

If you have ethereum background, then you will be familiar with term `view` .
That ensure they won't modify the contract's state. These functions are used solely for reading data from the contract's state.

In flow, we also create similar functions, which have function declaration and a return type.

```jsx
access(all) contract HellWorld {

	// Declare a variable named greetings
	access(all) var greetings: String

	access(all) view fun getGreetings(): String{
		return self.greetings
	}

	init(){
		self.greetings = "Hello World"
	}
}

```

In this example:

- `getGreetings()`: This function returns an String.
- `view`: Indicate that they do not modify any external state or any account state.

### Put It to the Test

Let's read all the ID of the Knight in the contract storage. For that-

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public functions named `getIDs` marked it as `view`.
3. `getIDs` should return an array of IDs.
