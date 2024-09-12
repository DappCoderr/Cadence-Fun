import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address): Int {
    let account = getAccount(addr)
    let collectionRef = account.capabilities.get<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)
    let borrowCapRef = collectionRef.borrow()!
    return borrowCapRef.getLength()
}