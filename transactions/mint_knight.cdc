import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

transaction(name:String, type:String){

  let collectionRef: &CryptoKnight.Collection

  prepare(signer: auth(Storage, Capabilities) &Account){

    self.collectionRef = signer.storage.borrow<&CryptoKnight.Collection>(from: CryptoKnight.CollectionStoragePath) 
                            ?? panic("Object not found")

    // if signer.storage.borrow<&CryptoKnight.NFT>(from: CryptoKnight.CollectionStoragePath) != nil{
    //   return 
    // }

    // signer.storage.save(<- CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>()), to: CryptoKnight.CollectionStoragePath)
    // let cap = signer.capabilities.storage.issue<&CryptoKnight.Collection>(CryptoKnight.CollectionStoragePath)
    // signer.capabilities.publish(cap, at: CryptoKnight.CollectionPublicPath)
  }

  execute{
    let nft <- CryptoKnight.mintKnight(name: name, type: type)
    self.collectionRef.deposit(token: <- nft)    
  }
}