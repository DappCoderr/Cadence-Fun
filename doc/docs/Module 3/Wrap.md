---
title: That’s a wrap
sidebar_position: 11
---

```jsx
access(all) contract KnightCreator{

  access(all) var totalSupply: UInt64

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
    return <- create KnightNFT()
  }

  access(all) resource interface CollectionPublic {
    access(all) fun deposit(token: @KnightNFT)
    access(all) fun getIDs(): [UInt64]
  }

  access(all) resource Collection: CollectionPublic {

    access(all) var ownedNFTs: @{UInt64: KnightNFT}

    init() {
        self.ownedNFTs <- {}
    }

    access(all) fun withdraw(withdrawID: UInt64): @KnightNFT {
      let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("Token not in collection")
      return <- token
    }

    access(all) fun deposit(token: @KnightNFT) {
      let tokenID = token.id
      self.ownedNFTs[tokenID] <-! token
    }

    access(all) fun getIDs(): [UInt64] {
      return self.ownedNFTs.keys
    }

    destroy (){
      destroy self.ownedNFTs
    }
  }

  access(all) fun createEmptyCollection(): @Collection {
    return <- create Collection()
  }

  init(){
    self.totalSupply = 0
  }
}

```
