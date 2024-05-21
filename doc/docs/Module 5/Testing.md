---
title: Testing it Out!!
sidebar_position: 9
---

Before moving forward let’s test our contract by running transaction and script. Before that don’t forget to deploy the contract.

:::note
Just Copy & past transaction and script and run. Don’t worry we will discuss this in future how to create and use transaction and script.
:::

```jsx
import Knight from 0x01

transaction(xp:UFix64, name:String, val:UInt8) {
    prepare(signer: AuthAccount) {

    }

    execute {
        let newKnight <- Knight.createKnight(xp:xp, name:name, rawValue:val)
        log(newKnight.details)
        Knight.storeKnight(knight: <- newKnight)
    }
}

```

Script to read TotalSupply

```jsx
import Knight from 0x01

access(all) fun main(): Int {
    return Knight.totalSupply
}
```

Script to read total Knight IDs

```jsx
import Knight from 0x01

access(all) fun main(): [UInt64] {
    return Knight.getIDs()
}
```

Script to read Knight Details

```jsx
import Knight from 0x01

access(all) fun main(id: UInt64): Knight.KnightDetails? {
    return Knight.getKnightDetails(id: id)
}
```
