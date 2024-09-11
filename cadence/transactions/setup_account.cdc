import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import CryptoKnight from "../contracts/CryptoKnight.cdc"

transaction(){
  prepare(signer: auth(BorrowValue, SaveValue, IssueStorageCapabilityController, PublishCapability) &Account){

    if signer.storage.borrow<&CryptoKnight.NFT>(from: CryptoKnight.CollectionStoragePath) != nil{
      return 
    }
    signer.storage.save(<- CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>()), to: CryptoKnight.CollectionStoragePath)
    let collectionCap = signer.capabilities.storage.issue<&CryptoKnight.Collection>(CryptoKnight.CollectionStoragePath)
    signer.capabilities.publish(collectionCap, at: CryptoKnight.CollectionPublicPath)
  }

  //   if signer.storage.borrow<&Knight.Collection>(from: Knight.StoragePath) == nil{
  //     signer.storage.save(<- Knight.createEmptyCollection(), to:Knight.StoragePath)
  //     signer.link<&{NonFungibleToken.CollectionPublic, Knight.KnightCollectionPublic}>(Knight.PublicPath, target: Knight.StoragePath)  
  //   }
  //   log("successfully created collection")
  // }
}