---
title: Lesson 3 - Minting NFT
sidebar_position: 3
---

In this lesson, we're adding a function to our `Collection` resource that allows users to mint (create) a new non-fungible token (NFT). This function enables users to generate unique NFTs with specified attributes, such as name and type.

### **Purpose and Usefulness:**

The `mintKnight` function serves as a mechanism for creating new NFTs with customized properties. This is useful because:

1. **Customization:** Users can create NFTs with specific attributes, making them unique and tailored to their needs or preferences.

2. **Flexibility:** The function allows for dynamic minting of NFTs based on user inputs, enabling diverse use cases such as gaming, digital art, and collectibles.

### **Implementation:**

```cadence
access(all) resource Collection: NonFungibleToken.Collection {

    pub fun mintKnight(name: String, type: String): @NFT {
        pre {
            name.length > 0: "Name cannot be empty"
            type.length > 0: "Type cannot be empty"
        }
        let nftId = Knight.totalSupply
        var newNFT <- create NFT(_name: name, _type: type)
        emit KnightMinted(id: nftId, name: name, type: type)
        return <-newNFT
    }
}
```

### **Explanation:**

The `mintKnight` function takes two parameters, `name` and `type`, representing the name and type of the new Knight NFT to be minted. It checks the pre-conditions to ensure that both `name` and `type` are non-empty strings. Then, it generates a unique ID for the new NFT based on the total supply of Knights, creates a new NFT instance with the provided attributes, emits an event to signal the minting of the NFT, and returns the newly minted NFT.

### **Putting it to the Test:**
