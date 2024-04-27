---
title: Lesson 9 - Organize Your Path
sidebar_position: 9
---

Every great collection needs a map, and your Flow NFT collection is no exception! In this lesson, we'll explore defining storage and public paths, which act like a treasure map for your NFTs.

### Why Define Paths? It's About Organization and Accessibility!

Paths bring order and clarity to your NFT collection:

- **Organized Storage:** Imagine your account's storage like a vast library. Storage paths act like labels on shelves, helping you locate your NFT collection with ease.
- **Public Access:** Public paths are like the library's main entrance. They allow other accounts to interact with your collection through a designated point, fostering collaboration within the Flow ecosystem.

Charting Your Course: How Paths Work

Here's a breakdown of how storage and public paths work:

### **Implementation:**

```cadence
pub let StoragePath: StoragePath
pub let PublicPath: PublicPath
```

```cadence
self.StoragePath = /storage/NFTCollection
self.PublicPath = /public/NFTCollection

self.account.save(<- create Collection(), to: self.StoragePath)
self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)
```

### **Explanation:**

- These lines define two variables: StoragePath and PublicPath.
- StoragePath is like your collection's secret address within your account's storage (think of it as the location of the vault in the library's basement).
- PublicPath is the publicly accessible entrance point (like the library's main entrance). Other accounts can use this path to find and interact with your collection through specific interfaces.
- The code then assigns specific locations within your account's storage (/storage/NFTCollection) and a public access point (/public/NFTCollection) to these paths.

### **Putting it to the Test:**
