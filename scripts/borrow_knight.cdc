import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address, id:UInt64): ResultKnight{
    let acct = getAccount(addr)
    let capRef = acct.capabilities.get<&CryptoKnight.NFT>(CryptoKnight.CollectionPublicPath)
    let nft = capRef.borrow() ?? panic("Object not found")
    let a = ResultKnight(id: nft.id, name: nft.details.name, type: nft.details.type, date: nft.details.dateCreated, xp: nft.xp, win: nft.winCount)
    // ResultKnight(id: nft.id, name:  type: capRef.details.type, date: capRef.details.dateCreated, xp: capRef.xp, win: capRef.winCount)
    return a 
}

access(all) struct ResultKnight{
    access(all) let id: UInt64
    access(all) let name: String?
    access(all) let type: String?
    access(all) let date: UFix64?
    access(all) let xp: UInt64?
    access(all) let winCount: UInt64?

    init(id:UInt64, name:String?, type:String?, date:UFix64?, xp:UInt64?, win:UInt64?){
        self.id = id
        self.name = name
        self.type = type
        self.date = date
        self.xp = xp
        self.winCount = win
    }
}