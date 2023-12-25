import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight_update.cdc"

transaction(){
  prepare(signer:AuthAccount){
    if signer.borrow<&Knight.Collection>(from: Knight.CollectionStoragePath) == nil{
      signer.save(<- Knight.createEmptyCollection(), to:Knight.CollectionStoragePath)
      signer.link<&{NonFungibleToken.CollectionPublic, Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath, target: Knight.CollectionStoragePath)  
    }
    log("successfully created collection")
  }
}