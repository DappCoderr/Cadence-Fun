---
title: Lesson 7 - Deposit Function
sidebar_position: 7
---

In this lesson, we're introducing a `deposit` function to our collection. This function allows users to add a new non-fungible token (NFT) to the collection. It's like depositing money into a bank account - you're adding something valuable to your collection.

### **Purpose and Usefulness:**

The `deposit` function serves to expand the collection by adding new NFTs. This is useful because:

1. **Expansion:** It allows users to contribute new assets to the collection, increasing its value and diversity over time.

2. **Flexibility:** Users can deposit NFTs from their own inventory or receive them from other users, enabling trading and collaboration within the ecosystem.

### **Implementation:**

```jsx
access(all) resource Collection: NonFungibleToken.Collection {

    access(all) fun deposit(token: @{NonFungibleToken.NFT}) {
        let token <- token as! @ExampleNFT.NFT

        // Add the new token to the dictionary and remove the old one
        let oldToken <- self.ownedNFTs[token.id] <- token

        destroy oldToken
    }
}
```

### **Explanation:**

The `deposit` function takes a `token` parameter, which is an instance of the `NonFungibleToken.NFT` resource. Inside the function, we cast the `token` to the specific type of NFT (`ExampleNFT.NFT` in this case) to ensure type safety. Then, we add the new token to the `ownedNFTs` dictionary, replacing any existing token with the same ID. Finally, we destroy the old token to prevent duplication and ensure efficient use of storage.

### **Put it to the Test:**

In this section, learners can practice using the `deposit` function by:

- Calling the function with different NFTs to deposit them into the collection.
- Checking that the deposited NFTs are added to the collection successfully.
- Testing scenarios where the deposited NFTs replace existing ones in the collection to understand storage management.
  These exercises help learners understand how to interact with the `deposit` function and its impact on the collection's state.
