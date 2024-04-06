---
title: That’s a wrap
sidebar_position: 11
---

```jsx
// Define a contract called KnightContract
access(all) contract KnightContract {

  access(all) var totalSupply: UInt64
  access(all) var nextKnightId: UInt64

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

  pub resource interface CollectionPublic {
        pub fun deposit(token: @KnightNFT)
        pub fun getIDs(): [UInt64]
  }

  access(all) resource Collection: CollectionPublic {

  access(all) var ownedNFTs: @{UInt64: KnightNFT}

    init() {
        self.ownedNFTs <- {}
    }

    pub fun withdraw(withdrawID: UInt64): @KnightNFT {
        let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("Token not in collection")
        return <- token
    }

    pub fun deposit(token: @KnightNFT) {
        let tokenID = token.id
        self.ownedNFTs[token.id] <-! token
    }

    pub fun getIDs(): [UInt64] {
        return self.ownedNFTs.keys
    }

    destroy () {
        destroy self.ownedNFTs
    }
}

// new code---------------------------------------------->
access(all) fun createEmptyCollection(): @Collection {
        return <- create Collection()
}

  access(all) fun createKnight(xp: UFix64, name: String, value: UInt8): @KnightNFT{
    return <- create KnightNFT(xp: xp, name: name, value: value)
  }

  init() {
    self.totalSupply = 0
    self.nextKnightId = 0
  }
}

```
