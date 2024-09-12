import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address): [UInt64] {
    let account = getAccount(addr)
    let collectionRef = account.capabilities.get<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)
    let borrowCapRef = collectionRef.borrow()!
    return borrowCapRef.getIDs()
}