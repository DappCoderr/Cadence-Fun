import NonFungibleToken from "../contract/interface/NonFungibleToken.cdc"
import Knight from "../contract/Knight.cdc"
import Weapons from "../contract/Weapons.cdc"

pub fun main(_address:Address): Test?{
    let collectionRef = getAccount(_address).capabilities.get<&{Knight.KnightCollectionPublic}>(Knight.CollectionPublicPath) 
        ?? panic("No Collection")

    let nft = collectionRef.borrow()
}