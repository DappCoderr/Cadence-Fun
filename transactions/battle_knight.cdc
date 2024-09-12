import NonFungibleToken from "../cadence/contracts/NonFungibleToken.cdc"
import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

transaction(userA:Address, userAKnightId: UInt64, userB:Address, userBKnightId: UInt64){
    prepare(signer:&Account){
        // CryptoKnight.battle(userA: userA, userAKnight: userAKnightId, userB: userB, userBKnight: userBKnightId)
    }
    execute{
        CryptoKnight.battle(userA: userA, userAKnight: userAKnightId, userB: userB, userBKnight: userBKnightId)
    }
}