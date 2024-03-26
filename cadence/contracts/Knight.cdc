import NonFungibleToken from "./standards/NonFungibleToken.cdc"

pub contract Knight: NonFungibleToken{
    // events
    pub event ContractInitialized()
    pub event Withdraw(id: UInt64, from: Address?)
    pub event Deposit(id: UInt64, to: Address?)
    pub event KinigtMinted(id:UInt64, name:String, type:String)

    // Contract Path
    pub let StoragePath: StoragePath
    pub let PublicPath: PublicPath

    pub var totalSupply: UInt64

    pub struct KnightDetails{
        pub var name: String
        pub var dateCreated: UFix64
        pub var type: String

        init(name: String, dateCreated:UFix64, type:String){
            self.name = name
            self.dateCreated = dateCreated
            self.type = type
        }
    }

    // NFT Resource
    pub resource NFT: NonFungibleToken.INFT{
        pub let id: UInt64
        pub let details: Knight.KnightDetails
        pub var xp: UInt64
        pub var winCount: UInt64

        init(_name:String, _type:String){
            let currntTime:UFix64 = getCurrentBlock().timestamp
            self.id = self.uuid
            self.details = Knight.KnightDetails(
                name: _name,
                dateCreated: currntTime,
                type: _type
            )
            self.xp = Knight.getRandomKNightXP()
            self.winCount = 0

            Knight.totalSupply = Knight.totalSupply + 1
        }

        pub fun winner(){
            self.winCount = self.winCount + 1
        }

        destroy(){
            Knight.totalSupply = Knight.totalSupply - 1
        }
    }

    pub resource interface KnightCollectionPublic{
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

        pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {
            let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("missing NFT")
            emit Withdraw(id: token.id, from: self.owner?.address)
            return <- token
        }

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
        .capabilities.get<&{Knight.KnightCollectionPublic}>(Knight.PublicPath)!
        .check()
    }

    pub fun mintKnight(name:String, type:String): @NFT{
        pre{
            name.length > 0: "Name can not be empty"
            type.length > 0: "Type can not be empty" 
        }
        let nftId = Knight.totalSupply
        var newNFT <- create NFT(_name:name, _type:type)
        emit KinigtMinted(id:nftId, name:name, type:type)
            return <- newNFT
    }

    pub fun getRandomKNightXP(): UInt64 {
            let randomNumber: UInt64 = revertibleRandom()
            return (randomNumber % 100) + 1
    }

    pub fun battle(userA:Address, userAKnightId: UInt64, userB:Address, userBKnightId: UInt64){
        let acctA = getAccount(userA)
        let acctB = getAccount(userB)
        let userACapRef = acctA.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
        var knightA_XP = userACapRef.borrowKinght(id: userAKnightId)?.xp ?? panic("Knight B XP not found")

        let userBCapRef = acctB.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
        var knightB_XP = userBCapRef.borrowKinght(id: userBKnightId)?.xp ?? panic("Knight B XP not found")

        if(knightA_XP > knightB_XP){
            let winnerKnight = userACapRef.borrowKinght(id: userAKnightId)
            winnerKnight?.winner()
        } else {
            let winnerKnight = userBCapRef.borrowKinght(id: userBKnightId)
            winnerKnight?.winner()
        }  
    }

    init(){
        let identifier = "KnightCollection".concat(self.account.address.toString())
        self.PublicPath = PublicPath(identifier: identifier)!
        self.StoragePath = StoragePath(identifier: identifier)!

        self.totalSupply = 0

        self.account.save(<- create Collection(), to: self.StoragePath)
        self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)

        emit ContractInitialized()
    }
}
 