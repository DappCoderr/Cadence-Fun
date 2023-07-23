import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight.cdc"

transaction(id:UInt64, recipient:Address){

    let collectionRef: &Knight.Collection

    prepare(signer:AuthAccount){
        
        if signer.borrow<&{Knight.KnightCollectionPublic}>(from: Knight.CollectionStoragePath) == nil {
            signer.save(<- Knight.createEmptyCollection(), to: Knight.CollectionStoragePath)
            signer.link<&{Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath, target: Knight.CollectionStoragePath)
        } 

        self.collectionRef = signer.borrow<&Knight.Collection>(from: Knight.CollectionStoragePath)
                            ?? panic("Could not borrow the collection")

        let recipient = getAccount(recipient)
        let depositRef = recipient.getCapability(Knight.CollectionPublicPath)!.borrow<&{NonFungibleToken.CollectionPublic}>()!

        let knightNFT <- self.collectionRef.withdraw(withdrawID: id)
        depositRef.deposit(token: <- knightNFT)
        
    }

}