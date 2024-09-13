import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

transaction(name:String, power:UInt8){

  let collectionRef: &CryptoKnight.Collection

  prepare(signer: auth(Storage, Capabilities) &Account){

    pre {
      power <= 3: "Wrong inputValue"
    }

    self.collectionRef = signer.storage.borrow<&CryptoKnight.Collection>(from: CryptoKnight.CollectionStoragePath) 
                            ?? panic("Object not found")
  }

  execute{
    let nft <- CryptoKnight.mintKnight(name: name, type: power)
    self.collectionRef.deposit(token: <- nft)    
  }
}