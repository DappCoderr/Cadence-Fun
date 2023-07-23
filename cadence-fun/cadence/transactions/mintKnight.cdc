import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight.cdc"

// this transaction use Knight Minter to mint a new Knight NFT

transaction(recipient: Address, name:String){
    let minterRef: &Knight.Minter
    let recipientCollectionRef: &{NonFungibleToken.CollectionPublic}

    prepare(signer:AuthAccount){

        // borrow a reference to the NFT Minter resource in storage
        self.minterRef = signer.borrow<&Knight.Minter>(from: Knight.MinterStoragePath) ?? panic("Could not borrow minter refrence")

        // borrow user public NFT collection reference
        self.recipientCollectionRef = getAccount(recipient)
            .getCapability(Knight.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not get receiver reference to the NFT Collection")
    }

    execute{
        // mint NFT and deposit in recipient collection
        var nft <- self.minterRef.mintKnight(name:name)
        self.recipientCollectionRef.deposit(token: <- nft)
    }
}
 