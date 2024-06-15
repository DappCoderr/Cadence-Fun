---
title: Lesson 8 - Capabilities
sidebar_position: 8
---

Before learning about Capabilities I think you got an idea of how accounts, transactions, resources, and signers work with basic field types. We will learn how to interact with resources using capabilities

A capability is a value that represents the right to access an object and perform certain operations on it. A capability specifies what can be accessed, and how it can be accessed.

Capabilities can be storage capabilities or account capabilities:

- `Storage capabilities` grant access to objects in account storage, via paths
- `Account capabilities` grant access to accounts

act like personalized security keys, ensuring only the chosen few can access your precious NFTs:

- **Fort Knox Security:** Capabilities prevent unauthorized access to your collection, keeping your NFTs safe from prying eyes.
- **Granular Control:** You decide who gets to see your NFTs! Grant access with the precision of a jeweler, ensuring only those you trust can interact with your collection.

```cadence
// To store an empty HelloWorld resource in account storage you will need to access
// this current contract storage by calling self.account with save function.
// Save function will create a resource you want to store with the storage path.
self.account.save(<- create HelloWorld(), to: /storage/World)

// publish a public capability of the account storage by using self account by calling
// self.account following with link function which takes the public path and storage path
self.account.link<&{HelloWorldPublic}>(/public/World, target: /storage/World)
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Update the collection resource with interface.
3. Add borrowNFT function in the collection resource.

### Solution !!

![Alt text](image-5.png)
