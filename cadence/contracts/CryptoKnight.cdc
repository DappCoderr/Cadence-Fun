import NonFungibleToken from "./NonFungibleToken.cdc"
import MetadataViews from "./MetadataViews.cdc"

access(all) contract CryptoKnight: NonFungibleToken{
    // events
    access(all) event ContractInitialized()

    access(all)
	event Withdraw(id: UInt64, from: Address?)
	
	access(all)
	event Deposit(id: UInt64, to: Address?)

    access(all) 
    event KinigtMinted(id:UInt64, name:String, type:String)

    // Contract Path
    access(all) let CollectionStoragePath: StoragePath
    access(all) let CollectionPublicPath: PublicPath

    access(all) var totalSupply: UInt64

    access(all) struct KnightDetails{
        access(all) var name: String
        access(all) var dateCreated: UFix64
        access(all) var type: String

        init(name: String, dateCreated:UFix64, type:String){
            self.name = name
            self.dateCreated = dateCreated
            self.type = type
        }
    }

    // NFT Resource
    access(all) resource NFT: NonFungibleToken.NFT{
        access(all) let id: UInt64
        access(all) let details: CryptoKnight.KnightDetails
        access(all) var xp: UInt64
        access(all) var winCount: UInt64

        init(_name:String, _type:String){
            let currntTime:UFix64 = getCurrentBlock().timestamp
            self.id = self.uuid
            self.details = CryptoKnight.KnightDetails(
                name: _name,
                dateCreated: currntTime,
                type: _type
            )
            self.xp = CryptoKnight.getRandomKNightXP()
            self.winCount = 0

            CryptoKnight.totalSupply = CryptoKnight.totalSupply + 1
        }

        access(all)
		view fun getViews(): [Type]{ 
			return [Type<MetadataViews.Display>(), Type<MetadataViews.NFTCollectionData>(), Type<MetadataViews.NFTCollectionDisplay>(), Type<MetadataViews.ExternalURL>(), Type<MetadataViews.Traits>(), Type<MetadataViews.Edition>(), Type<MetadataViews.Royalties>(), Type<MetadataViews.Serial>()]
		}


		access(all)
		fun resolveView(_ view: Type): AnyStruct?{ 
			switch view{ 
				case Type<MetadataViews.ExternalURL>():
					return MetadataViews.ExternalURL("https://flow.com/")
				case Type<MetadataViews.NFTCollectionData>():
					return MetadataViews.NFTCollectionData(storagePath: CryptoKnight.CollectionStoragePath, publicPath: CryptoKnight.CollectionPublicPath, publicCollection: Type<&CryptoKnight.Collection>(), publicLinkedType: Type<&CryptoKnight.Collection>(), createEmptyCollectionFunction: fun (): @{NonFungibleToken.Collection}{ 
							return <-CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.Collection>())
						})
				case Type<MetadataViews.NFTCollectionDisplay>():
					let bannerMedia = MetadataViews.Media(file: MetadataViews.HTTPFile(url: "https://banner_2023.png"), mediaType: "image/png")
					let logoFull = MetadataViews.Media(file: MetadataViews.HTTPFile(url: "https://logo_full.png"), mediaType: "image/png")
					return MetadataViews.NFTCollectionDisplay(name: "CryptoKnight", description: "CryptoKnight is a fun game build on top of flow chain", externalURL: MetadataViews.ExternalURL("https://flow.io/"), squareImage: logoFull, bannerImage: bannerMedia, socials:{ "twitter": MetadataViews.ExternalURL("https://twitter.com/flunks_nft")})
			}
			return nil
		}

        access(all) fun winner(){
            self.winCount = self.winCount + 1
        }

        access(all) fun createEmptyCollection(): @{NonFungibleToken.Collection} {
            return <-CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>())
        }

        // destroy(){
        //     CryptoKnight.totalSupply = CryptoKnight.totalSupply - 1
        // }
    }

    access(all) resource interface CryptoKnightCollectinPublic{
        access(all) fun deposit(token: @{NonFungibleToken.NFT})
        access(all) fun getIDs(): [UInt64]
        access(all) fun borrowNFT(_ id: UInt64): &{NonFungibleToken.NFT}?
        // access(all) fun borrowKinght(id: UInt64): &CryptoKnight.NFT?{
        //     post {
        //         (result == nil) || (result?.id == id):
        //             "Cannot borrow CryptoKnight Asset reference: The Id of the returned reference is incorrect"
        //     }
        // }
    }

    access(all) resource Collection:CryptoKnightCollectinPublic, NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.Collection, NonFungibleToken.CollectionPublic{
        // access(all) var ownedNFTs: @{UInt64: NonFungibleToken.NFT}
        access(all) var ownedNFTs: @{UInt64: {NonFungibleToken.NFT}}

        init(){
            self.ownedNFTs <- {}
        }

        access(all) fun createEmptyCollection(): @{NonFungibleToken.Collection} {
            return <-CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>())
        }

        access(all)
		view fun getSupportedNFTTypes():{ Type: Bool}{ 
			panic("implement me")
		}
		
		access(all)
		view fun isSupportedNFTType(type: Type): Bool{ 
			panic("implement me")
		}

        // destroy (){
        //     destroy self.ownedNFTs
        // }

        access(NonFungibleToken.Withdraw) fun withdraw(withdrawID: UInt64): @{NonFungibleToken.NFT} {
            let token <- self.ownedNFTs.remove(key: withdrawID)
                ?? panic("Could not withdraw an NFT with the provided ID from the collection")
            emit Withdraw(id: token.id, from: self.owner?.address)
            return <- token
        }

        access(all) fun deposit(token: @{NonFungibleToken.NFT}) {
            let token <- token as! @CryptoKnight.NFT
            let id = token.id
            let oldToken <- self.ownedNFTs[id] <- token
            destroy oldToken
            emit Deposit(id: id, to: self.owner?.address)
        }

        // access(all) fun borrowKinght(id:UInt64): &CryptoKnight.NFT? {
        //     if self.ownedNFTs[id] != nil{
        //         let ref = (&self.ownedNFTs[id] as auth &NonFungibleToken.NFT?)!
        //         return ref as! &CryptoKnight.NFT
        //     } else{
        //         return nil
        //     }
        // }

        access(all) view fun borrowNFT(_ id: UInt64): &{NonFungibleToken.NFT}? {
            return (&self.ownedNFTs[id] as &{NonFungibleToken.NFT}?)!
        }

        access(all) view fun getIDs(): [UInt64] {
            return self.ownedNFTs.keys
        }

        /// Gets the amount of NFTs stored in the collection
        access(all) view fun getLength(): Int {
            return self.ownedNFTs.length
        }

    //     access(all) view fun getContractViews(resourceType: Type?): [Type] {
    //     return [
    //         Type<MetadataViews.NFTCollectionData>(),
    //         Type<MetadataViews.NFTCollectionDisplay>()
    //     ]
    // }

    // access(all) fun resolveContractView(resourceType: Type?, viewType: Type): AnyStruct? {
    //     switch viewType {
    //         case Type<MetadataViews.NFTCollectionData>():
    //             let collectionData = MetadataViews.NFTCollectionData(
    //                 storagePath: self.CollectionStoragePath,
    //                 publicPath: self.CollectionPublicPath,
    //                 publicCollection: Type<&CryptoKnight.Collection>(),
    //                 publicLinkedType: Type<&CryptoKnight.Collection>(),
    //                 createEmptyCollectionFunction: (fun(): @{NonFungibleToken.Collection} {
    //                     return <-CryptoKnight.createEmptyCollection(nftType: Type<@CryptoKnight.NFT>())
    //                 })
    //             )
    //             return collectionData
    //         case Type<MetadataViews.NFTCollectionDisplay>():
    //             let media = MetadataViews.Media(
    //                 file: MetadataViews.HTTPFile(
    //                     url: "Add your own SVG+XML link here"
    //                 ),
    //                 mediaType: "image/svg+xml"
    //             )
    //             return MetadataViews.NFTCollectionDisplay(
    //                 name: "The FooBar Example Collection",
    //                 description: "This collection is used as an example to help you develop your next Flow NFT.",
    //                 externalURL: MetadataViews.ExternalURL("Add your own link here"),
    //                 squareImage: media,
    //                 bannerImage: media,
    //                 socials: {
    //                     "twitter": MetadataViews.ExternalURL("Add a link to your project's twitter")
    //                 }
    //             )
    //     }
    //     return nil
    // }
}

    access(all) fun createEmptyCollection(nftType: Type): @{NonFungibleToken.Collection} {
        return <- create Collection()
    }

    // access(all) fun checkCollection(_addr: Address): Bool{
    //     return getAccount(_addr)
    //     .capabilities.get<&{CryptoKnight.KnightCollectionPublic}>(CryptoKnight.PublicPath)!
    //     .check()
    // }

    access(all) fun mintKnight(name:String, type:String): @NFT{
        pre{
            name.length > 0: "Name can not be empty"
            type.length > 0: "Type can not be empty" 
        }
        let nftId = CryptoKnight.totalSupply
        var newNFT <- create NFT(_name:name, _type:type)
        emit KinigtMinted(id:nftId, name:name, type:type)
            return <- newNFT
    }

    access(all) fun getRandomKNightXP(): UInt64 {
            let randomNumber: UInt64 = revertibleRandom<UInt64>(modulo: UInt64.max)
            return (randomNumber % 100) + 1
    }

    // access(all) fun battle(userA:Address, userAKnightId: UInt64, userB:Address, userBKnightId: UInt64){
    //     let acctA = getAccount(userA)
    //     let acctB = getAccount(userB)
    //     let userACapRef = acctA.getCapability<&{CryptoKnight.KnightCollectionPublic}>(CryptoKnight.PublicPath).borrow() ?? panic("Could not borrow")
    //     var knightA_XP = userACapRef.borrowKinght(id: userAKnightId)?.xp ?? panic("CryptoKnight B XP not found")

    //     let userBCapRef = acctB.getCapability<&{CryptoKnight.KnightCollectionPublic}>(CryptoKnight.PublicPath).borrow() ?? panic("Could not borrow")
    //     var knightB_XP = userBCapRef.borrowKinght(id: userBKnightId)?.xp ?? panic("CryptoKnight B XP not found")

    //     if(knightA_XP > knightB_XP){
    //         let winnerKnight = userACapRef.borrowKinght(id: userAKnightId)
    //         winnerKnight?.winner()
    //     } else {
    //         let winnerKnight = userBCapRef.borrowKinght(id: userBKnightId)
    //         winnerKnight?.winner()
    //     }  
    // }

    access(all) fun battle(userA:Address, userAKnight:UInt64, userB:Address, userBKnight:UInt64){
        let acctA = getAccount(userA)
        let accB = getAccount(userB)

        let capA = acctA.capabilities.get<&CryptoKnight.NFT>(CryptoKnight.CollectionPublicPath)
        let capA_Ref = capA.borrow() ?? panic("Object not found")

        let knightA_XP = capA_Ref.xp

        let capB = accB.capabilities.get<&CryptoKnight.NFT>(CryptoKnight.CollectionPublicPath)
        let cabB_Ref = capB.borrow() ?? panic("Object not found")

        let knightB_XP = cabB_Ref.xp

        if(knightA_XP > knightB_XP){
            capA_Ref.winner()
        }else{
            cabB_Ref.winner()
        }

    }

    access(all) view fun getContractViews(resourceType: Type?): [Type] {
		panic("implement me")
	}

	access(all) fun resolveContractView(resourceType: Type?, viewType: Type): AnyStruct? {
		return nil
	}

    init(){
        let identifier = "KnightCollection".concat(self.account.address.toString())
        self.CollectionPublicPath = PublicPath(identifier: identifier)!
        self.CollectionStoragePath = StoragePath(identifier: identifier)!

        self.totalSupply = 0

        // self.account.storage.save(<- create Collection(), to: self.StoragePath)
        // self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)

        emit ContractInitialized()
    }
}
 