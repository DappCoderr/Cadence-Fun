---
title: Lesson 14 - Transaction & Script
sidebar_position: 14
---

We have finished our `CryptoKnight` contract, but we are not yet done. Remember, in Cadence you cannot interact with your contract directly. You need to use a transaction to call the functions in your contract and change its data.

### Transaction:

Transactions (and scripts) are separate from contracts and are written in different files, but they import contracts to interact with them. Transactions can import any number of deployed contracts, so you can combine many different actions (across contracts) into 1 transaction.

An empty transaction looks like this

```jsx
transaction() {
    prepare(signer: &Account) {

    }

    execute {

    }
}
```

Let’s say we have a contract named `Example` that has a public function name `add` that accepts two numbers.

We can execute this function by running a transaction like so:

```jsx
import "Example"

// we pass arguments to transaction here
transaction(x: UInt64, y: UInt64) {
    prepare(signer: &Account) {

    }

    execute {
        Example.add(x: x, y: y)
    }
}
```

Transactions have 2 stages:

- **prepare**: To access/manipulate data inside the signer’s account.
- **execute**: Calling contract functions.

### Scripts:

Scripts are written in separate files. Scripts are used to read data in a contract. Any actions you perform in a script will get reverted when it is over.

An empty script looks like this:

```jsx
access(all) fun main() {

}
```

Let’s say we have a contract named `Example` that has a public variable name `people` of type `[Person]`, where Person is a `struct` defined in that contract.

We can fetch a Person like so:

```jsx
import "Example"

access(all) fun main(index: Int): Example.Person {
    return Example.people[index]
}
```
