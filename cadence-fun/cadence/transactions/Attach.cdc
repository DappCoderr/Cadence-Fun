import NonFungibleToken from "../contracts/standards/NonFungibleToken.cdc"
import Knight from "../contracts/Knight.cdc"
import Weapons from "../contracts/Weapons.cdc"

transaction(recipient:Address, _n:String, _weapon:UInt8, _power:UInt64){

    let collectionRef: &Knight.Collection
    let minterRef: &Knight.Minter

    prepare(signer:AuthAccount){
        self.minterRef = signer.borrow<&Knight.Minter>(from: Knight.MinterStoragePath)!
        self.collectionRef = signer.borrow<&Knight.Collection>(from: Knight.CollectionStoragePath)!
    }
    execute{
        var nft <- self.minterRef.mintKnight(name:_n)
        var attachNFT <- Weapons.attachWeaponToNFT(_nft: <-nft, _weapon: Weapons.WeaponsCategory(rawValue:_weapon)!, _power:_power)
        self.collectionRef.deposit(token: <- attachNFT)
    }
}
