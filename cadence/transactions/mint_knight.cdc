import NonFungibleToken from 0x631e88ae7f1d7c20
import Knight from 0x42491d7c0e53eba9

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