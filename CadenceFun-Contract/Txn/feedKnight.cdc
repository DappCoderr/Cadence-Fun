import NonFungibleToken from "../contract/NonFungibleToken.cdc"
import Knight from "../contract/Knight.cdc"
import Drink from "../contract/Drink.cdc"

transaction(id:UInt64, amount:UFix64){

    let vaultRef: &Drink.Vault
    let collectionRef: &Knight.Collection

    prepare(signer:AuthAccount){
        self.collectionRef = signer
        .borrow<&Knight.Collection>(from: Knight.CollectionStoragePath) 
        ?? panic("Could not borrow the collection")

        self.vaultRef = signer
        .borrow<&Drink.Vault>(from: Drink.VaultStoragePath)
        ?? panic("Could not borrow the vault")
    }

    execute{
        let drinkVault <- self.vaultRef!.withdraw(amount:amount) as! @Drink.Vault
        let knights = self.collectionRef.borrowKinght(id: id)
        knights!.feedEnergyDrink(drink: <- drinkVault)
    }

}