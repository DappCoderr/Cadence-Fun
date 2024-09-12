import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(addr:Address): Bool{
    let account = getAccount(addr)
    let capRef = account.capabilities.get<&CryptoKnight.Collection>(CryptoKnight.CollectionPublicPath)
    return capRef.check()
}