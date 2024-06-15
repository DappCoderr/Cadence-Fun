---
title: Lesson 9 - Organize Your Path
sidebar_position: 9
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

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Update the collection resource with interface.
3. Add borrowNFT function in the collection resource.

### Solution !!

![Alt text](image-5.png)
