---
title: Lesson 6 - Borrow Function
sidebar_position: 6
---

In this lesson, we're introducing a `borrowNFT` function to our collection. This function allows users to temporarily borrow a specific non-fungible token (NFT) from the collection without transferring ownership. It's like borrowing a book from a library - you can use it for a while, but you need to return it afterward.

### **Purpose and Usefulness:**

The `borrowNFT` function provides users with a way to access NFTs from the collection for temporary use or inspection. This is useful because:

1. **Accessibility:** Users can borrow NFTs without permanently transferring ownership, allowing for temporary interactions or read-only access.

2. **Convenience:** It provides a convenient way to access specific NFTs stored in the collection without modifying the collection's state.

### **Implementation:**

```jsx
access(all) resource Collection: NonFungibleToken.Collection {

    access(all) view fun borrowNFT(_ id: UInt64): &{NonFungibleToken.NFT}? {
        return (&self.ownedNFTs[id] as &{NonFungibleToken.NFT}?)
    }
}
```

### **Explanation:**

The `borrowNFT` function takes an `id` parameter representing the unique identifier of the NFT to be borrowed. Inside the function, we use the `ownedNFTs` dictionary to look up the NFT associated with the provided ID. We return a reference to the NFT, allowing users to borrow it temporarily. If the NFT with the provided ID doesn't exist in the collection, the function returns `nil`.

### **Put it to the Test:**

In this section, learners can practice using the `borrowNFT` function by:

- Calling the function with different NFT IDs to borrow specific NFTs from the collection.
- Checking that the borrowed NFTs are accessible and usable within their contracts.
- Testing scenarios where the provided NFT ID does not exist in the collection to understand error handling.
  These exercises help learners understand how to interact with the `borrowNFT` function and its impact on accessing NFTs from the collection.
