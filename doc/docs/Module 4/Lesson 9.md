---
title: Lesson 9 - Creating Contract Storage
sidebar_position: 9
---

### Introducing Capabilities

Capabilities act like personalized security keys, ensuring only the chosen few can access your precious NFTs:

- **Fort Knox Security:** Capabilities prevent unauthorized access to your collection, keeping your NFTs safe from prying eyes.
- **Granular Control:** You decide who gets to see your NFTs! Grant access with the precision of a jeweler, ensuring only those you trust can interact with your collection.

```cadence
self.account.save(<- create Collection(), to: /storage/NFTCollection)
self.account.link<&{KnightCollectionPublic}>(/public/NFTCollection, target: /storage/NFTCollection)
```

### **Explanation:**

- This line creates a brand new NFT collection and stores it securely within your account's vault (represented by self.StoragePath).
- Imagine this vault has multiple locks. This line creates a special key (the capability) that unlocks access to a specific interface (KnightCollectionPublic) within the vault.
- This key is then placed at a designated public access point (self.PublicPath), allowing authorized users who possess the matching key to access the collection through that specific interface.

### **Putting it to the Test:**

### Solution !!
