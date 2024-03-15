---
title: That’s a wrapp
sidebar_position: 13
---

Putting it all together. Here is the final code for the KnightContract

```jsx
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

      init(name:String, value:UInt8){
         self.name = name
         self.createdDate = getCurrentBlock().timestamp
         self.type = KnightContract.Types(value: value)
      }
  }

  access(all) resource KnightNFT{
      access(all) var id: UInt64
      access(all) var xp: UFix64
      access(all) var details: KnightContract.KnightDetails

      init(id:UInt64, xp:UFix64, name:String, value:UInt8){
         self.id = id
         self.xp = xp
         self.details = KnightContract.KnightDetails(name: name, value:value)
         KnightContract.nextKnightId = KnightContract.nextKnightId + 1
         KnightContract.totalSupply = KnightContract.totalSupply + 1
      }

      destroy(){
        KnightContract.nextKnightId = KnightContract.nextKnightId - 1
        KnightContract.totalSupply = KnightContract.totalSupply - 1
      }
  }

  access(all) fun createKnight(xp:UFix64, name:String, value:UInt8): @KnightNFT{
    return <- create KnightNFT(xp:xp, name:name, value:value)
  }

  init(){
    self.totalSupply = 0
    self.nextKnightId = 0
  }
}
```
