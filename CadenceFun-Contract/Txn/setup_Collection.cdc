import NonFungibleToken from "../contract/NonFungibleToken.cdc"
import Knight from "../contract/Knight.cdc"

// this transaction configures a account to hold Kinght.

transaction(){
    prepare(signer:AuthAccount){
        // if the signer or account doesn't have collection then create a collection
        if signer.borrow<&Knight.Collection>(from: Knight.CollectionStoragePath) == nil {
            // create a new empty collection and save it to the account
            signer.save(<- Knight.createEmptyCollection(), to: Knight.CollectionStoragePath)
            // create a public link (capability) for the collection
            signer.link<&{Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath, target: Knight.CollectionStoragePath)
        }
    }
}