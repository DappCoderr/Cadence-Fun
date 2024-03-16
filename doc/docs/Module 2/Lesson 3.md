---
title: Lesson 3 - Contract
sidebar_position: 3
---

Let's start from the very beginning:

In Flow applications, we use contracts to organize our code. A contract is like a container holding variables and functions that are essential for our projects.

Here's a basic example of a contract called `HelloWorld`:

```jsx
access(all) contract HelloWorld {

	init(){

	}
}
```

Great, we've created our first contract, even though it doesn't do anything yet. Let's break down the parts:

- access(all): This keyword makes the contract public for anyone to read.
- contract: This keyword indicates that we're declaring a Contract.
- [contract name]: This is the name you give to your contract.
- init(): This function is mandatory for every contract. It's executed only once when the contract is first deployed. We can use it to set up initial values.

### Put It to the Test

To initiate the creation of our Knight Soldier, let's make a contract names `Knight`.

1. Open Flow [Playground](https://play.flow.com/)
2. Craft an empty contract labeled `KnightContract`. Ensure the access modifier is set to `public`.
