import Knight from "../contracts/Knight.cdc"

pub fun main(addr:Address): Bool{
    let account = getAuthAccount(addr)
    return account.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).check()
}