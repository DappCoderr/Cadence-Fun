---
title: That’s a wrap
sidebar_position: 16
---

Hey, congratulations on completing Module 2! 🥳 🎉

In the next module, we'll dive deeper into Cadence's functionalities. But before we move on, let's review all the code we've learned so far. If you're facing any issues during development, take a moment to go through the code and see if you can spot any mistakes.

See you in Module 3!

```jsx
access(all) contract KnightCreator{

  access(all) var totalSupply: UInt64
  access(all) let storedKnight: @{UInt64: KnightNFT}

  access(all) event KinigtMinted(id:UInt64)

  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var power: UFix64

      init() {
         self.name = "Night King"
         self.power = 50.0
      }
  }

  access(all) resource KnightNFT {

      access(all) var id: UInt64
      access(all) var details: KnightDetails

      init() {
         self.id = KnightCreator.totalSupply
         self.details = KnightDetails()
         KnightCreator.totalSupply = KnightCreator.totalSupply + 1
      }
  }

  access(all) fun createKnight(): @KnightNFT {
    var newNFT <- create KnightNFT()
    emit KinigtMinted(id:self.totalSupply)
    return <- newNFT
  }

  access(all) fun storeKnight(knight: @KnightNFT) {
      self.storedKnight[knight.id] <-! knight
  }

  init(){
    self.totalSupply = 0
    self.storedKnight <- {}
  }
}
```

This code wraps up everything we've learned in Module 2. It's organized to help you understand how to create and manage knights and their NFTs in Cadence. If you're ready, let's move on to Module 3!
