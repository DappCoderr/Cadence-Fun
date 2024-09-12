import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address): [UInt64] {
    let account = getAccount(addr)
    let cap = account.capabilities.borrow<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)!
    return cap.getIDs()
}