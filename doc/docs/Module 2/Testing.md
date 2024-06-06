---
title: Testing it out!!
sidebar_position: 15
---

In Cadence, you can't directly poke and prod your contracts. Instead, you use two tools: transactions and scripts.

### Transactions

- What they do: Permanently change data within a contract by calling its functions. Imagine them as giving instructions to your contract.
- Where they live: Separate files from the contract itself.
- Two stages:
  prepare: Access and potentially modify data in your account (covered later).
  execute: Call the contract's functions to make changes.

An empty transaction looks like this

```jsx
transaction() {
    prepare(signer: &Account) {

    }

    execute {

    }
}
```

You can write a transaction to create a new Knight by calling the contract's createKnight function.

```jsx
import KnightCreator from 0x05

transaction() {

    prepare(signer: AuthAccount) {}

    execute {
        let newKnight <- KnightCreator.createKnight()
        log(newKnight.id)
        destroy newKnight
    }
}

```

### Scripts:

- What they do: Peek at the data stored inside a contract, but don't change anything. Think of them as spying on your contract.
- Where they live: Separate files from the contract itself.
- Key point: Any changes made within a script are temporary and disappear when the script finishes.

An empty script looks like this

```jsx
access(all) fun main() {

}
```

A script could be used to read information about existing Knights without actually changing anything.

```jsx
import KnightCreator from 0x05

access(all) fun main(peopleIndex: Int): UInt64 {
    return KnightCreator.totalSupply
}
```
