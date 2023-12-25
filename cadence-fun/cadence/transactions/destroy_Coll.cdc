import Knight from "../contracts/Knight_update.cdc"

transaction(){
    prepare(signer:AuthAccount){
        let collectionRef <- signer.load<@Knight.Collection>(from: Knight.CollectionStoragePath) ?? panic("Don't have Collection")
        destroy collectionRef
    }
}