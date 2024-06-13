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

### Put It to the Test

### Solution !!
