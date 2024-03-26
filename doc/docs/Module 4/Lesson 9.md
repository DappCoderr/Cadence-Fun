---
title: Lesson 9 - Check Collection Length
sidebar_position: 9
---

In this lesson, we're adding a function to our collection to check the number of non-fungible tokens (NFTs) stored in it. This function provides users with information about the size of the collection, similar to counting the number of books in a library.

### **Purpose and Usefulness:**

The `getLength` function serves to provide transparency regarding the size of the collection. This is useful because:

1. **Inventory Management:** Users can assess the extent of their collection and make informed decisions about managing their assets.

2. **Efficiency:** Knowing the collection's length can help optimize operations and resource allocation when interacting with the collection.

### **Implementation:**

```jsx
access(all) resource Collection: NonFungibleToken.Collection {

    /// Gets the amount of NFTs stored in the collection
    access(all) view fun getLength(): Int {
        return self.ownedNFTs.keys.length
    }
}
```

### **Explanation:**

The `getLength` function retrieves the number of keys (NFT IDs) stored in the `ownedNFTs` dictionary, which represents the number of NFTs in the collection. It returns an integer representing the length of the collection.

### **Put it to the Test:**

In this section, learners can practice using the `getLength` function by:

- Calling the function to retrieve the length of the collection.
- Checking that the returned length corresponds to the actual number of NFTs stored in the collection.
- Testing scenarios with different collections to understand variations in length based on the number of stored NFTs.
  These exercises help learners understand how to use the `getLength` function to obtain information about the collection's size and make informed decisions based on that information.
