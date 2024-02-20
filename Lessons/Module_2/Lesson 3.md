## **Lesson 3: Contract**

Starting with the absolute basics:

Cadence’s code is encapsulated in **contracts**. A `contract` is the fundamental building block of Flow applications — every variable and functions belong to a contract, making it the starting point of all your projects.

An elementary contract, named `HelloWorld`, starts off like this:

```jsx
pub contract HelloWorld {

	init(){

	}
}
```

Boom, we wrote our first contract. That… has nothing in it.
Here:

- The `pub` keyword is an access modifier, making the contract public for anyone to read.
- The `contract` keyword is the declaration of a contract.
- `[contract name]` is the name you assign to your contract.
- The `init()` function is a function that every single contract must have. It is run when the contract is initially deployed, which only ever happens 1 time. So we can initialize some stuff in it when we want to. We’ll see this later on.

### Put It to the Test

To initiate the creation of our Knight Soldier, let's fashion a foundational contract named `Knight`.

1. Open Flow Playground: https://play.flow.com/
2. Craft an empty contract labeled `KnightContract`. Ensure the access modifier is set to `public`.

# Next Lesson →
