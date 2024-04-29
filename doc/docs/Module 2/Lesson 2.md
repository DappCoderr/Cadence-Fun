---
title: Lesson 2 - Contract in Flow
sidebar_position: 2
---

Let's start from the very beginning:

Think of contracts like a blueprints for your code. That hold the building blocks - variables and functions - that make your project work.

Let's create a simple contract called `HelloWorld` to get started:

```jsx
access(all) contract HelloWorld {

	init(){

	}
}
```

### Breaking it Down:

- `access(all)`: This keyword is called an access modifier. It sets the visibility of our contract. Here, access(all) makes the contract public, meaning anyone can read it.
- `contract`: This keyword tells Flow that we're defining a contract.
- `HelloWorld`: This is the name you choose for your contract, keeping it descriptive.
- `init()`: This function is a must-have in every contract. It runs only once when the contract is first deployed.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. To initiate the creation of our Knight Soldier, let's make a contract named `KnightCreator`.
3. Access modifier is set to public.

### Solution !!

![Alt text](image.png)
