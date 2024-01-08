import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight.cdc"

pub fun main(addr:Address): [UInt64]{
    let account = getAuthAccount(addr)
    let collectionRef = account.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow Collection")
    return collectionRef.getIDs()
}