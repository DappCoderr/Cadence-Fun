---
title: That’s a wrap
sidebar_position: 10
---

Hey, congratulations on completing Module 5! 🥳 🎉

```jsx
import NonFungibleToken from "./standards/NonFungibleToken.cdc"

import NonFungibleToken from 0x05

access(all) contract KnightCreator: NonFungibleToken {

  access(all) event ContractInitialized()
  access(all) event Withdraw(id: UInt64, from: Address?)
  access(all) event Deposit(id: UInt64, to: Address?)

  access(all) event KinigtMinted(id:UInt64)

  access(all) let StoragePath: StoragePath
  access(all) let PublicPath: PublicPath

  access(all) var totalSupply: UInt64

  access(all) enum Types: UInt8 {
        access(all) case fire
        access(all) case grass
        access(all) case sun
        access(all) case rock
    }

  access(all) struct KnightDetails{
      access(all) var name: String
      access(all) var dateCreated: UFix64
      access(all) var type: Types?

      init(name: String, dateCreated:UFix64, value:UInt8) {
         self.name = name
         self.dateCreated = dateCreated
         self.type = KnightCreator.Types(value: value)
      }
  }

  access(all) resource NFT: NonFungibleToken.INFT {

      access(all) let id: UInt64
      access(all) var details: KnightDetails
      access(all) var winCount: UInt64
      access(all) var power: UInt64

      init(name: String, dateCreated:UFix64, value:UInt8) {
        let currntTime:UFix64 = getCurrentBlock().timestamp
        self.id = KnightCreator.totalSupply
        self.details = KnightDetails(name: name, dateCreated:currntTime, value:value)
        self.winCount = 0
        self.power = KnightCreator.getRandomKnightPower()

        KnightCreator.totalSupply = KnightCreator.totalSupply + 1
      }

      // Add winner function
      access(all) fun winner(){
          self.winCount = self.winCount + 1
      }
  }

  access(all) resource interface KnightCollectionPublic {
    access(all) fun deposit(token: @NonFungibleToken.NFT)  // Add an NFT
    access(all) fun getIDs(): [UInt64]    // Get all NFT IDs
    access(all) fun borrowNFT(id: UInt64): &NonFungibleToken.NFT
    pub fun borrowKinght(id: UInt64): &KnightCreator.NFT?{
            post {
                (result == nil) || (result?.id == id):
                    "Cannot borrow Knight Asset reference: The Id of the returned reference is incorrect"
            }
        }
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
    access(all) fun borrowNFT(id: UInt64): &NonFungibleToken.NFT? {
        if self.ownedNFTs[id] != nil {
                return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
        }
        panic("NFT not found in collection.")
    }

    pub fun borrowKinght(id:UInt64): &KnightCreator.NFT? {
            if self.ownedNFTs[id] != nil{
                let ref = (&self.ownedNFTs[id] as auth &NonFungibleToken.NFT?)!
                return ref as! &KnightCreator.NFT
            } else{
                return nil
            }
        }

    destroy (){ destroy self.ownedNFTs}
  }

  access(all) fun createEmptyCollection(): @Collection {
    return <- create Collection()
  }

  access(all) fun createKnight(name: String, date:UFix64, value:UInt8): @NFT {
    var newNFT <- create NFT(name: name, dateCreated:date, value:value)
    emit KinigtMinted(id:self.totalSupply)
    return <- newNFT
  }

  access(all) fun getRandomKnightPower(): UInt64 {
        let rand: UInt64 = revertibleRandom()
        return (rand%100)+1
  }

  pub fun battle(userA:Address, userAKnightId: UInt64, userB:Address, userBKnightId: UInt64){
        let acctA = getAccount(userA)
        let acctB = getAccount(userB)
        let userACapRef = acctA.getCapability<&{KnightCreator.KnightCollectionPublic}>(KnightCreator.PublicPath).borrow() ?? panic("Could not borrow")
        var knightA_XP = userACapRef.borrowKinght(id: userAKnightId)?.power ?? panic("Knight B XP not found")

        let userBCapRef = acctB.getCapability<&{KnightCreator.KnightCollectionPublic}>(KnightCreator.PublicPath).borrow() ?? panic("Could not borrow")
        var knightB_XP = userBCapRef.borrowKinght(id: userBKnightId)?.power ?? panic("Knight B XP not found")

        if(knightA_XP > knightB_XP){
            let winnerKnight = userACapRef.borrowKinght(id: userAKnightId)
            // If user A wins, update with win count
            winnerKnight?.winner()
        } else {
            let winnerKnight = userBCapRef.borrowKinght(id: userBKnightId)
            // If user B wins, update with win count
            winnerKnight?.winner()
        }
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
