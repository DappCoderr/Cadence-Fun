---
title: Lesson 6 - Withdraw Function
sidebar_position: 6
---

In this lesson, we're adding a `withdraw` function to our collection. This function allows users to remove a specific non-fungible token (NFT) from the collection and transfer it to themselves. It's like withdrawing money from a bank account - you're taking something out for yourself.

### **Purpose and Usefulness:**

The `withdraw` function serves two main purposes:

- **Flexibility:** It gives users the ability to take ownership of specific NFTs stored in the collection. This is useful for transferring NFTs between users or performing other actions that require individual token ownership.
- **Control:** By restricting access to the `withdraw` function, we can ensure that only authorized users can remove NFTs from the collection. This helps maintain security and prevent unauthorized access to valuable assets.

### **Implementation:**

```jsx
access(all) resource Collection: NonFungibleToken.Collection {

    /// withdraw removes an NFT from the collection and moves it to the caller
    access(NonFungibleToken.Withdraw | NonFungibleToken.Owner) fun withdraw(withdrawID: UInt64): @{NonFungibleToken.NFT} {

        let token <- self.ownedNFTs.remove(key: withdrawID)
            ?? panic("Could not withdraw an NFT with the provided ID from the collection")

        return <-token
    }
}
```

### **Explanation:**

The `withdraw` function takes a `withdrawID` parameter, which represents the unique identifier of the NFT to be withdrawn from the collection. Inside the function, we use the `remove` method to remove the NFT associated with the provided ID from the `ownedNFTs` dictionary. If the removal is successful, the function returns the withdrawn NFT to the caller.

### **Put it to the Test:**

In this section, learners can practice using the `withdraw` function by:

- Calling the function with different `withdrawID` values to remove NFTs from the collection.
- Checking that the withdrawn NFTs are transferred to the caller successfully.
- Testing scenarios where the provided `withdrawID` does not correspond to any NFT in the collection to understand error handling.
