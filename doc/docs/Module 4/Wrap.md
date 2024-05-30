---
title: That’s a wrap
sidebar_position: 12
---

```jsx
import NonFungibleToken from 0x05

access(all) contract KnightCreator: NonFungibleToken {

  access(all) event ContractInitialized()
  access(all) event Withdraw(id: UInt64, from: Address?)
  access(all) event Deposit(id: UInt64, to: Address?)

  access(all) event KinigtMinted(id:UInt64)

  pub let StoragePath: StoragePath
  pub let PublicPath: PublicPath

  access(all) var totalSupply: UInt64

  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var power: UFix64

      init() {
         self.name = "Night King"
         self.power = 50.0
      }
  }

  access(all) resource NFT: NonFungibleToken.INFT {

      access(all) let id: UInt64
      access(all) var details: KnightDetails

      init() {
         self.id = KnightCreator.totalSupply
         self.details = KnightDetails()
         KnightCreator.totalSupply = KnightCreator.totalSupply + 1
      }
  }

  access(all) resource interface KnightCollectionPublic {
    access(all) fun deposit(token: @NonFungibleToken.NFT)  // Add an NFT
    access(all) fun getIDs(): [UInt64]    // Get all NFT IDs
    access(all) fun borrowNFT(id: UInt64): &NonFungibleToken.NFT
  }

  access(all) resource Collection: KnightCollectionPublic, NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {

    access(all) var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

    init() {self.ownedNFTs <- {}}

    access(all) fun withdraw(withdrawID: UInt64):  @NonFungibleToken.NFT {
      let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("Token not in collection")
      emit Withdraw(id: token.id, from: self.owner?.address)
      return <- token
    }

    access(all) fun deposit(token:  @NonFungibleToken.NFT) {
      let tokenID = token.id
      self.ownedNFTs[tokenID] <-! token
      emit Deposit(id: tokenID, to: self.owner?.address)
    }

    access(all) fun getIDs(): [UInt64] {
      return self.ownedNFTs.keys
    }

    // add borrowNFT function
    access(all) fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
        if self.ownedNFTs[id] != nil {
                return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
        }
        panic("NFT not found in collection.")
    }

    destroy (){ destroy self.ownedNFTs}
  }

  access(all) fun createEmptyCollection(): @Collection {
    return <- create Collection()
  }

  access(all) fun createKnight(): @NFT {
    var newNFT <- create NFT()
    emit KinigtMinted(id:self.totalSupply)
    return <- newNFT
  }

  init(){
    self.totalSupply = 0
    emit ContractInitialized()

    self.StoragePath = /storage/KnightCreatorCollection
    self.PublicPath = /public/KnightCreatorCollection

    self.account.save(<- create Collection(), to: self.StoragePath)
    self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)
  }
}











```
