import NonFungibleToken from "./NonFungibleToken.cdc"
import MetadataView from "./MetadataView.cdc"

pub contract Knight{

    // events
    pub event ContractInitialized()
    pub event Withdraw(id: UInt64, from: Address)
    pub event Deposit(id: UInt64, to: Address)

    // Contract Path
    pub let CollectionStoragePath: StoragePath
    pub let CollectionPublicPath: PublicPath
    pub let MinterStoragePath: StoragePath

    pub var knightTotalSupply: UInt64


    // NFT Resource
    pub resource NFT: NonFungibleToken.INFT{
        pub id: UInt64
        pub maxEnergy: UFix64
        pub energy: UFix64

        init(id:UInt64){
            self.id = id
            self.maxEnergy = 100
            self.energy = self.maxEnergy
        }

        pub fun feedEnergyDrink(){}
        pub fun updateEnergy(){}
    }

    pub resource interface KnightCollectionPublic{

    }

    pub resource Collection: NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic, KnightCollectionPublic{
        pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

        init(){
            self.ownedNFTs <- {}
        }

        destroy (){
            destroy self.ownedNFTs
        }

         // withdraw removes an NFT from the collection and moves it to the caller
        pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {
            let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("missing NFT")
            
            emit Withdraw(id: token.id, from: self.owner?.address)
            return <- token
        }

        // deposit takes a NFT and adds it to the collections dictionary
        // and adds the ID to the id array
        pub fun deposit(token: @NonFungibleToken.NFT) {
            let id = token.id
            let old <- self.ownedNFTs[id] <-token
            destroy old

            emit Deposit(id: id, to: self.owner?.address)
        }
    }

    init(){
        self.knightTotalSupply = 0
        emit ContractInitialized()
    }
}
 