import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight.cdc"

transaction(name:String, type:String){
let collectionRef: &{NonFungibleToken.CollectionPublic}
  prepare(signer:AuthAccount){
    if signer.borrow<&Knight.Collection>(from: Knight.StoragePath) == nil{
      signer.save(<- Knight.createEmptyCollection(), to:Knight.StoragePath)
      signer.link<&{NonFungibleToken.CollectionPublic, Knight.KnightCollectionPublic}>(Knight.PublicPath, target: Knight.StoragePath)  
    }
    self.collectionRef = signer.borrow<&{NonFungibleToken.CollectionPublic}>(from: Knight.StoragePath) 
                          ?? panic("Could not find Collection")
  }
  execute{
    var nft <- Knight.mintKnight(name: name, type: type)
    self.collectionRef.deposit(token: <- nft)
  }
}