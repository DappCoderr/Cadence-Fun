import Knight from "../contracts/Knight_update.cdc"

pub fun main(addr:Address): Bool{
    let account = getAuthAccount(addr)
    return account.getCapability<&{Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath).check()
}