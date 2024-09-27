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

  access(all) var totalKnight: UInt64
  access(all) let storedKnight: @{UInt64: Knight}

  access(all) event KnightMinted(id:UInt64)

  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var power: UFix64

      init() {
         self.name = "Night King"
         self.power = 50.0
      }
  }

  access(all) resource Knight {

      access(all) var id: UInt64
      access(all) var details: KnightDetails

      init() {
         self.id = CryptoKnight.totalKnight
         self.details = KnightDetails()
         CryptoKnight.totalKnight = CryptoKnight.totalKnight + 1
      }
  }

  access(all) fun createKnight(): @Knight {
    var newNFT <- create Knight()
    emit KnightMinted(id:self.totalKnight)
    return <- newNFT
  }

  access(all) fun storeKnight(knight: @Knight) {
      self.storedKnight[knight.id] <-! knight
  }

  init(){
    self.totalKnight = 0
    self.storedKnight <- {}
  }
}
```

This code wraps up everything we've learned in Module 2. It's organized to help you understand how to create and manage knights as NFTs in Cadence. If you're ready, let's move on to Module 3!
