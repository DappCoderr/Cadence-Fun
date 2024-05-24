---
title: Lesson 6 - View Function
sidebar_position: 6
---

If you have Ethereum background, then you will be familiar with the term view. That ensures they won't modify the contract's state. These functions are used solely for reading data from the contract's state.

In Flow, we also create similar functions, which have a function declaration and a return type.

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

### **Explanation:**

- `getGreetings()`: This function returns a String.
- `view`: Indicates that it does not modify any external state or any account state

### Put It to the Test

Let's read all the ID of the Knight in the contract storage. For that-

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public functions named `getIDs` marked as `view`.
3. `getIDs` should return an array of IDs.

### Solution !!
