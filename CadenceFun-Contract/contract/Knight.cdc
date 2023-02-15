import NonFungibleToken from "./NonFungibleToken.cdc"
// import MetadataView from "./MetadataView.cdc"

pub contract Knight: NonFungibleToken{

    // events
    pub event ContractInitialized()
    pub event Withdraw(id: UInt64, from: Address?)
    pub event Deposit(id: UInt64, to: Address?)

    // Contract Path
    pub let CollectionStoragePath: StoragePath
    pub let CollectionPublicPath: PublicPath
    pub let MinterStoragePath: StoragePath

    pub var totalSupply: UInt64


    // NFT Resource
    pub resource NFT: NonFungibleToken.INFT{
        pub let id: UInt64
        pub var maxEnergy: UFix64
        pub var energy: UFix64

        init(id:UInt64){
            self.id = id
            self.maxEnergy = 100.0
            self.energy = 50.0
        }

        pub fun feedEnergyDrink(){}
        pub fun updateEnergy(){}
    }

    pub resource interface KnightCollectionPublic{
        // pub fun checkKinght(id: UInt64)
        pub fun deposit(token: @NonFungibleToken.NFT)
        pub fun getIDs(): [UInt64]
        pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT
        pub fun borrowKinght(id: UInt64): &Knight.NFT?{
            post {
                (result == nil) || (result?.id == id):
                    "Cannot borrow Knight Asset reference: The Id of the returned reference is incorrect"
            }
        }
    }

    pub resource Collection: KnightCollectionPublic, NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic{
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
            let oldToken <- self.ownedNFTs[id] <-token
            destroy oldToken
            emit Deposit(id: id, to: self.owner?.address)
        }

        pub fun borrowKinght(id:UInt64): &Knight.NFT? {
            if self.ownedNFTs[id] != nil{
                let ref = (&self.ownedNFTs[id] as auth &NonFungibleToken.NFT?)!
                return ref as! &Knight.NFT
            } else{
                return nil
            }
        }

        pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
            if self.ownedNFTs[id] != nil {
                return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
            }
            panic("NFT not found in collection.")
        }

        pub fun getIDs(): [UInt64]{
            return self.ownedNFTs.keys
        }
    }

    pub fun createEmptyCollection(): @Collection{
        return <- create Collection()
    }

    pub fun checkCollection(_addr: Address): Bool{
        return getAccount(_addr)
        .getCapability<&{Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath)
        .check()
    }

    pub resource Minter{
        pub fun mintKnight():  @Knight.NFT{
            Knight.totalSupply = Knight.totalSupply + 1 
            let nftId = Knight.totalSupply
            var newNFT <- create NFT(id:nftId)
            return <- newNFT
        }
    }


    init(){
        self.CollectionPublicPath = /public/KnightCollection
        self.CollectionStoragePath = /storage/KnightCollection
        self.MinterStoragePath = /storage/KnightMinter

        self.totalSupply = 0

        self.account.save(<- create Minter(), to: self.MinterStoragePath)
        self.account.save(<- create Collection(), to: self.CollectionStoragePath)
        self.account.link<&{KnightCollectionPublic}>(self.CollectionPublicPath, target: self.CollectionStoragePath)

        emit ContractInitialized()
    }
}
 