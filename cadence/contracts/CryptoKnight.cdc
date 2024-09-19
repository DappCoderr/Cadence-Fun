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
    event KinigtMinted(id:UInt64, name:String, type:UInt8)

    // Contract Path
    access(all) let CollectionStoragePath: StoragePath
    access(all) let CollectionPublicPath: PublicPath

    access(all) var totalSupply: UInt64

    access(all) enum OffencivePower: UInt8 {
        access(all) case Lightning
        access(all) case Fire
        access(all) case Earth
        access(all) case Ice
    }

    // access(all) enum DefensivePower: UInt8 {
    //     access(all) case Poison 
    //     access(all) case StoneWall
    //     access(all) case Whirlwind
    //     access(all) case Heal
    // }

    access(all) struct KnightDetails{
        access(all) var name: String
        access(all) var dateCreated: UFix64
        access(all) var type: OffencivePower?

        init(name: String, dateCreated:UFix64, value:UInt8){
            self.name = name
            self.dateCreated = dateCreated
            self.type = CryptoKnight.OffencivePower(rawValue: value)
        }
    }

    // NFT Resource
    access(all) resource NFT: NonFungibleToken.NFT{
        access(all) let id: UInt64
        access(all) let details: CryptoKnight.KnightDetails
        access(all) var xp: UInt64
        access(all) var winCount: UInt64

        init(_name:String, _value:UInt8){
            let currntTime:UFix64 = getCurrentBlock().timestamp
            self.id = self.uuid
            self.details = CryptoKnight.KnightDetails(
                name: _name,
                dateCreated: currntTime,
                value: _value
            )
            self.xp = CryptoKnight.getRandomKNightXP()
            self.winCount = 0

            CryptoKnight.totalSupply = CryptoKnight.totalSupply + 1
        }

        access(all)
		view fun getViews(): [Type]{ 
			return [Type<MetadataViews.Display>(), Type<MetadataViews.NFTCollectionData>(), Type<MetadataViews.NFTCollectionDisplay>(), Type<MetadataViews.ExternalURL>(), Type<MetadataViews.Traits>(), Type<MetadataViews.Edition>(), Type<MetadataViews.Royalties>(), Type<MetadataViews.Serial>()]
		}

        access(contract)
        fun updateXP(){
            let randomNumber: UInt64 = revertibleRandom<UInt64>(modulo: UInt64.max)
            let randXP = (randomNumber % self.xp) + 1
            self.xp = self.xp + randXP
        }

        access(contract) 
        fun deprecateXP(value:UInt64){
            self.xp = self.xp - value
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
    }

    access(all) resource interface CryptoKnightCollectinPublic{
        access(all) fun deposit(token: @{NonFungibleToken.NFT})
        access(all) fun getIDs(): [UInt64]
        access(all) fun borrowNFT(_ id: UInt64): &{NonFungibleToken.NFT}?

        access(all)
		fun borrowCryptoknight(id: UInt64): &CryptoKnight.NFT?{ 
			post{ 
				result == nil || result?.id == id:
					"Cannot borrow CryptoKnight reference: The ID of the returned reference is incorrect"
			}
		}
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

        access(all) view fun borrowNFT(_ id: UInt64): &{NonFungibleToken.NFT}? {
            return &self.ownedNFTs[id]
        }

        access(all)
		fun borrowCryptoknight(id: UInt64): &CryptoKnight.NFT?{ 
			if self.ownedNFTs[id] != nil{ 
				let ref = (&self.ownedNFTs[id] as &{NonFungibleToken.NFT}?)
				return ref as! &CryptoKnight.NFT
			} else{ 
				return nil
			}
		}

        access(all) view fun getIDs(): [UInt64] {
            return self.ownedNFTs.keys
        }

        /// Gets the amount of NFTs stored in the collection
        access(all) view fun getLength(): Int {
            return self.ownedNFTs.length
        }
}

    access(all) fun createEmptyCollection(nftType: Type): @{NonFungibleToken.Collection} {
        return <- create Collection()
    }

    access(all) fun mintKnight(name:String, type:UInt8): @NFT{
        pre{
            name.length > 0: "Name can not be empty"
        }
        let nftId = CryptoKnight.totalSupply
        var newNFT <- create NFT(_name:name, _value:type)
        emit KinigtMinted(id:nftId, name:name, type:type)
            return <- newNFT
    }

    access(all) fun getRandomKNightXP(): UInt64 {
            let randomNumber: UInt64 = revertibleRandom<UInt64>(modulo: UInt64.max)
            return (randomNumber % 100) + 1
    }

    access(all) fun battle(userA:Address, userAKnight:UInt64, userB:Address, userBKnight:UInt64){
        let accountA = getAccount(userA)
        let accountB = getAccount(userB)

        let borrowCap_A = accountA.capabilities.borrow<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)!
        let borrowKnight_A = borrowCap_A.borrowCryptoknight(id: userAKnight)!

        let knightA_XP = borrowKnight_A.xp

        let borrowCap_B = accountB.capabilities.borrow<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)!
        let borrowKnight_B = borrowCap_B.borrowCryptoknight(id: userBKnight)!

        let knightB_XP = borrowKnight_B.xp

        if(knightA_XP > knightB_XP){
            borrowKnight_A.winner()
            borrowKnight_A.updateXP()
            let deprecateXP = (borrowKnight_B.xp * 5) / 100
            borrowKnight_B.deprecateXP(value: deprecateXP)
        }else{
            borrowKnight_B.winner()
            borrowKnight_B.updateXP()
            let deprecateXP = (borrowKnight_A.xp * 5) / 100
            borrowKnight_A.deprecateXP(value: deprecateXP)
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

        emit ContractInitialized()
    }
}
 