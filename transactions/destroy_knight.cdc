// import CryptoKnight from "../contracts/CryptoKnight.cdc"

// transaction(id:UInt64){
//     let collectionRef: &Knight.Collection
//     prepare(signer:&Account){
//         self.collectionRef = signer.borrow<&Knight.Collection>(from: Knight.StoragePath) ?? panic("NFT is missing")
//     }
//     execute{
//         var nft <- self.collectionRef.withdraw(withdrawID: id)
//         destroy nft
//     }
//     post {
//         !self.collectionRef.getIDs().contains(id): "The NFT with the specified ID should have been deleted"
//     }
// }