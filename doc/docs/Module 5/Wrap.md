---
title: That’s a wrap
sidebar_position: 13
---

Hey, congratulations on completing Module 3! 🥳 🎉

In the next module, we'll dive deeper into Advance Cadence's functionalities. But before we move on, let's review all the code we've learned so far. If you're facing any issues during development, take a moment to go through the code and see if you can spot any mistakes.

See you in Module 4!

```jsx
// Define a contract called KnightContract
access(all) contract KnightContract {

  access(all) var totalSupply: UInt64
  access(all) var nextKnightId: UInt64

  // new code---------------------------------------------->
  access(all) let storeKnight: @{UInt64: KnightNFT}

  access(all) enum Types: UInt8 {
    access(all) case fire
    access(all) case grass
    access(all) case sun
    access(all) case rock
  }

  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var createdDate: UFix64
      access(all) var type: Types?

      init(name: String, value: UInt8) {
         self.name = name
         self.createdDate = getCurrentBlock().timestamp
         self.type = KnightContract.Types(value: value)
      }
  }

  access(all) resource KnightNFT {
      access(all) var id: UInt64
      access(all) var xp: UFix64
      access(all) var details: KnightContract.KnightDetails

      init(xp: UFix64, name: String, value: UInt8) {
        // new code---------------------------------------------->
         self.id = self.uuid
         self.xp = xp
         self.details = KnightContract.KnightDetails(name: name, value: value)
         KnightContract.nextKnightId = KnightContract.nextKnightId + 1
         KnightContract.totalSupply = KnightContract.totalSupply + 1
      }

      destroy() {
        KnightContract.nextKnightId = KnightContract.nextKnightId - 1
        KnightContract.totalSupply = KnightContract.totalSupply - 1
      }
  }

  // new code---------------------------------------------->
  access(all) fun createKnight(xp: UFix64, name: String, value: UInt8): @KnightNFT{
    return <- create KnightNFT(xp: xp, name: name, value: value)
  }

  // new code---------------------------------------------->
  access(all) fun storeKnights(knight: @KnightNFT) {
    self.storeKnight[knight.id] <-! knight
  }

  // new code---------------------------------------------->
  access(all) fun getIDs(): [UInt64] {
    return self.storeKnight.keys
  }

  // new code---------------------------------------------->
  access(all) fun getknightDetails(id: UInt64): KnightDetails? {
    return self.storeKnight[id]?.details
  }

  init() {
    self.totalSupply = 0
    self.nextKnightId = 0

    // new code---------------------------------------------->
    self.storeKnight <- {}
  }
}

```
