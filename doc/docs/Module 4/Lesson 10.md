---
title: Lesson 10 - Organize Your Path
sidebar_position: 10
---

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

### Solution !!
