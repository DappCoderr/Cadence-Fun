import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address): Int {
    let account = getAccount(addr)
    let capRef = account.capabilities.borrow<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)!
    return capRef.getLength()
}