import NonFungibleToken from "./NonFungibleToken.cdc"
import MetadataView from "./MetadataView.cdc"

pub contract Knight{

    // events
    pub event ContractInitialized()

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

    }

    init(){
        self.knightTotalSupply = 0
        emit ContractInitialized()
    }
}
