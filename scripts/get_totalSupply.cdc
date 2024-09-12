import CryptoKnight from "../cadence/contracts/CryptoKnight.cdc"

access(all) fun main(): UInt64{
    return CryptoKnight.totalSupply
}