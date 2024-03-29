import Knight from "../contracts/Knight.cdc"

transaction(){
    prepare(signer:AuthAccount){
        let collectionRef <- signer.load<@Knight.Collection>(from: Knight.StoragePath) ?? panic("Don't have Collection")
        destroy collectionRef
    }
}