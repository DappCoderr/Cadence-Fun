---
title: Testing it Out!!
sidebar_position: 10
---

```jsx
import KnightContract from 0xaddress

transaction(xp: UFix64, name: String, value: UInt8) {
    prepare(signer: AuthAccount) {
        let knight <- KnightContract.createKnight(xp: xp, name: name, value: value)
        signer.save(<-knight, to: /storage/MyKnightNFT)
        log("Knight Created and stored")
    }
}

```

```jsx
import KnightContract from 0xaddress

pub fun main(address: Address): KnightResult {
  let authAccount: AuthAccount = getAuthAccount(address)
  let myPokemonRef = authAccount.borrow<&KnightContract.KnightNFT>(from: /storage/MyKnightNFT)
                    ?? panic("A Knight does not live here.")

  return KnightResult(myPokemonRef.details, myPokemonRef.xp, myPokemonRef.id)
}

pub struct KnightResult {
  pub let id: UInt64
  pub let xp: UFix64
  pub let details: KnightContract.KnightDetails

  init(_ details: KnightContract.KnightDetails, _ xp: UFix64, _ id: UInt64) {
    self.id = id
    self.xp = xp
    self.details = details
  }
}

```
