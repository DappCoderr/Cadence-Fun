---
title: That’s a wrap
sidebar_position: 15
---

That's a Wrap!

Congratulations on finishing Module 2! 🎉

Before moving on to Module 3, let's recap what we've learned. Review the code from this module to solidify your understanding. If you encounter any problems while coding, take some time to go through your code carefully and see if you can find any errors.

See you in Module 3!

```jsx
access(all) contract CryptoKnight{

  access(all) var totalSupply: UInt64
  access(all) let storedKnight: @{UInt64: KnightNFT}

  access(all) event KnightMinted(id:UInt64)

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
         self.id = CryptoKnight.totalSupply
         self.details = KnightDetails()
         CryptoKnight.totalSupply = CryptoKnight.totalSupply + 1
      }
  }

  access(all) fun createKnight(): @KnightNFT {
    var newNFT <- create KnightNFT()
    emit KnightMinted(id:self.totalSupply)
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
