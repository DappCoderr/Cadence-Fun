import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

transaction(){
  prepare(signer: auth(Storage, Capabilities) &Account){

    if signer.storage.borrow<&CryptoKnight.NFT>(from: CryptoKnight.CollectionStoragePath) != nil{
      return 
    }
    signer.storage.save(<- CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>()), to: CryptoKnight.CollectionStoragePath)
    let collectionCap = signer.capabilities.storage.issue<&CryptoKnight.Collection>(CryptoKnight.CollectionStoragePath)
    signer.capabilities.publish(collectionCap, at: CryptoKnight.CollectionPublicPath)
  }
}