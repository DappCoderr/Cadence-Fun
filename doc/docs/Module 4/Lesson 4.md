---
title: Lesson 4 - Withdraw Function
sidebar_position: 4
---

In this lesson, we're adding a `withdraw` function to our collection. This function allows users to remove a specific non-fungible token (NFT) from the collection and transfer it to themselves. It's like withdrawing money from a bank account - you're taking something out for yourself.

### **Purpose and Usefulness:**

The `withdraw` function serves two main purposes:

- **Flexibility:** It gives users the ability to take ownership of specific NFTs stored in the collection. This is useful for transferring NFTs between users or performing other actions that require individual token ownership.
- **Control:** By restricting access to the `withdraw` function, we can ensure that only authorized users can remove NFTs from the collection. This helps maintain security and prevent unauthorized access to valuable assets.

### **Implementation:**

```jsx
pub resource Collection {

    pub fun withdraw(withdrawID: UInt64): @NFT {
        let token <- self.ownedNFTs.remove(key: withdrawID) ?? panic("Token not in collection")
        return <- token
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
