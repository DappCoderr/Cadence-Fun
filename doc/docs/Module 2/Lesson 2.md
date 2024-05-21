---
title: Lesson 2 - Contract in Flow
sidebar_position: 2
---

Let's start from the very beginning:

Think of contracts as blueprints for your code. They hold the building blocks—variables and functions—that make your project work.

Let's create a simple contract called **_HelloWorld_**:

```jsx
access(all) contract HelloWorld {

	init(){

	}
}
```

- **_access(all)_**: Makes the contract public, meaning anyone can read it.
- **_contract_**: Defines a new contract.
- **_init()_**: A special function that runs once when the contract is first deployed.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. To start building our Knight Knight, create a contract named KnightCreator with a public access modifier.

In the next lesson, we'll delve deeper into how we manage data within these contracts.

### Solution !!

![Alt text](image.png)
