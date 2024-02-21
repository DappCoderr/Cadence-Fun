## **Testing it out!!**

Note:- Here you don’t need to understand the syntax of transaction right now, we will take at look at the end of the course. You just need to open the playground and run the transaction to test the contract.

First deploy the Contract and run the transaction.

```jsx
import KnightContract from 0x05

transaction(id:UInt64, xp:UFix64, name:String, value:UInt8) {
    prepare(signer: AuthAccount) {}

    execute {
        let newKnight <- KnightContract.createKnight(id:id, xp:xp, name:name, value:value)
        log(newKnight.details)
        destroy newKnight
    }
}
```

# Next Lesson →
