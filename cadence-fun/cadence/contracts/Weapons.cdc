import NonFungibleToken from "./standards/NonFungibleToken.cdc"

pub contract Weapons {

    pub enum WeaponsCategory: UInt8{
        pub case Arrow // 0
        pub case Hammer // 1
        pub case Swort // 2
        pub case Axe // 3
        pub case Javelin // 4
        pub case Dart // 5
        pub case Shield // 6
    }
    
    pub attachment WeaponCharacter for NonFungibleToken.NFT{
        pub let weapon: WeaponsCategory
        pub var power: UInt64

        init(weapon: WeaponsCategory, _power: UInt64){
            self.weapon = weapon
            self.power = _power
        }

        pub fun getId(): UInt64{
            return base.id
        }

        pub fun attachWeaponToNFT(_nft: @NonFungibleToken.NFT, _weapon:WeaponsCategory, _power:UInt64): @NonFungibleToken.NFT{
            return <- attach WeaponCharacter(weapon: _weapon, _power: _power) to <- _nft
        }
    }
}