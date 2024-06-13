---
title: Lesson 9 - Creating Contract Storage
sidebar_position: 9
---

Capabilities act like personalized security keys, ensuring only the chosen few can access your precious NFTs:

- **Fort Knox Security:** Capabilities prevent unauthorized access to your collection, keeping your NFTs safe from prying eyes.
- **Granular Control:** You decide who gets to see your NFTs! Grant access with the precision of a jeweler, ensuring only those you trust can interact with your collection.

```cadence
self.account.save(<- create Collection(), to: /storage/NFTCollection)
self.account.link<&{KnightCollectionPublic}>(/public/NFTCollection, target: /storage/NFTCollection)
```

### Put It to the Test

### Solution !!
