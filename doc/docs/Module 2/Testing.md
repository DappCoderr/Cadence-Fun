---
title: Testing it out!!
sidebar_position: 14
---

:::note
You don't need to understand the syntax of transactions right now. We'll take a closer look at it at the end of the course. For now, simply open the playground and run the transaction to test the contract.
:::

First, deploy the Contract and run the transaction.

```jsx
import KnightContract from 0x05

transaction(id:UInt64, xp:UFix64, name:String, value:UInt8) {
    prepare(signer: AuthAccount) {}

    execute {
        let newKnight <- KnightContract.createKnight(id:id, xp:xp, name:name, value:value)
        log(newKnight.details)
        destroy newKnight
    }
}
```

This transaction allows you to create and test a new Knight in the Knight game contract. Simply execute the transaction in the Flow Playground to see it in action!
