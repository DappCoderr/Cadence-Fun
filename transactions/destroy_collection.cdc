// import CryptoKnight from "../contracts/CryptoKnight.cdc"

// transaction(){
//     prepare(signer: auth(LoadValue) &Account){
//         let collectionRef <- signer.storage.load<@Knight.Collection>(from: Knight.StoragePath) ?? panic("Don't have Collection")
//         destroy collectionRef
//     }
// }