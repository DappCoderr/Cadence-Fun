import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address, id:UInt64): &CryptoKnight.NFT  {
    let account = getAccount(addr)
    let cap = account.capabilities.borrow<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)!
    let nft: &CryptoKnight.NFT = cap.borrowCryptoknight(id: id)!
    return nft
    // return ResultKnight(id: nft.uuid, name: nft.details.name, type: nft.details., date: nft.details.dateCreated, xp: nft.xp, win: nft.winCount)
}

access(all) struct ResultKnight{
    access(all) let id: UInt64?
    access(all) let name: String?
    access(all) let type: UInt8?
    access(all) let date: UFix64?
    access(all) let xp: UInt64?
    access(all) let winCount: UInt64?

    init(id:UInt64?, name:String?, type:UInt8?, date:UFix64?, xp:UInt64?, win:UInt64?){
        self.id = id
        self.name = name
        self.type = type
        self.date = date
        self.xp = xp
        self.winCount = win
    }
}