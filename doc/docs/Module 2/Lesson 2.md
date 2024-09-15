---
title: Lesson 2 - Contracts
sidebar_position: 2
---

Contracts are the fundamental units of Flow applications. All variables and functions belong to a contract, making it the starting point for your projects.

:::note
In Cadence, similar to Solidity, you cannot directly interact with contracts. You must use transactions to write data and scripts to read data.
:::

Let's create a simple contract called **_HelloWorld_**:

```jsx
access(all) contract HelloWorld {

	init(){

	}
}
```

- `access(all)`: Makes the contract public, meaning anyone can read it.
- `contract HelloWorld`: Defines a new contract named `HelloWorld`.
- `init()`: A special function that runs once when the contract is first deployed. Think this of like as a `constructor`.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a new contract named KnightCreator with access control public.

In the next lesson, we'll explore how to manage data within contracts.

### Solution !!

![Alt text](image.png)
