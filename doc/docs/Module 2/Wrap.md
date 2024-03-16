---
title: That’s a wrap
sidebar_position: 13
---

Hey, congratulations on completing Module 2! 🥳 🎉

In the next module, we'll dive deeper into Cadence's functionalities. But before we move on, let's review all the code we've learned so far. If you're facing any issues during development, take a moment to go through the code and see if you can spot any mistakes.

See you in Module 3!

```jsx
// Define a contract called KnightContract
access(all) contract KnightContract {

  // Declare variables to keep track of total supply and next knight ID
  access(all) var totalSupply: UInt64
  access(all) var nextKnightId: UInt64

  // Define an enum to represent different types
  access(all) enum Types: UInt8 {
    access(all) case fire
    access(all) case grass
    access(all) case sun
    access(all) case rock
  }

  // Define a struct to store details about each knight
  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var createdDate: UFix64
      access(all) var type: Types?

      // Initialize knight details
      init(name: String, value: UInt8) {
         self.name = name
         self.createdDate = getCurrentBlock().timestamp
         self.type = KnightContract.Types(value: value)
      }
  }

  // Define a resource for knight non-fungible tokens (NFTs)
  access(all) resource KnightNFT {
      access(all) var id: UInt64
      access(all) var xp: UFix64
      access(all) var details: KnightContract.KnightDetails

      // Initialize knight NFT
      init(id: UInt64, xp: UFix64, name: String, value: UInt8) {
         self.id = id
         self.xp = xp
         self.details = KnightContract.KnightDetails(name: name, value: value)
         KnightContract.nextKnightId = KnightContract.nextKnightId + 1
         KnightContract.totalSupply = KnightContract.totalSupply + 1
      }

      // Define a function to clean up when a knight NFT is destroyed
      destroy() {
        KnightContract.nextKnightId = KnightContract.nextKnightId - 1
        KnightContract.totalSupply = KnightContract.totalSupply - 1
      }
  }

  // Define a function to create a new knight NFT
  access(all) fun createKnight(xp: UFix64, name: String, value: UInt8): @KnightNFT {
    return <- create KnightNFT(xp: xp, name: name, value: value)
  }

  // Initialize total supply and next knight ID
  init() {
    self.totalSupply = 0
    self.nextKnightId = 0
  }
}
```

This code wraps up everything we've learned in Module 2. It's organized to help you understand how to create and manage knights and their NFTs in Cadence. If you're ready, let's move on to Module 3!
