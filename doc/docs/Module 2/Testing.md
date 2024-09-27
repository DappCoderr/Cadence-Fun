---
title: Testing
sidebar_position: 14
---

### Transaction:

Now let's create a transaction to create a knight.

```jsx
import "CryptoKnight"

transaction() {
    prepare(signer: &Account) {

    }

    execute {
        lets nft <- CryptoKnight.createKnight()
        CryptoKnight.storeKnight(knight: <- nft)
    }
}
```

### Scripts:

Let's create the script to get the totalKnight.

```jsx
import "CryptoKnight"

access(all) fun main(): UInt64 {
    CryptoKnight.totalKnight
}
```

Let's create the script to get the storedKnight.

```jsx
import "CryptoKnight"

access(all) fun main(id:UInt64): KnightData {
    let nft <- CryptoKnight.storedKnight[id]
    KnightData(name: nft.name, power: nft.power)
    destroy nft
}

access(all) struct KnightData{
    access(all) name: String
    access(all) power: UFix64

    init(name:String, power:UFix64){
        self.name = name
        self.power = power
    }
}
```
