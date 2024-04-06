---
title: Lesson 3 - Resources Owning Resources
sidebar_position: 3
---

In our adventure, we've learned about resources. Now, let's discover a cool feature: resources owning other resources! Imagine you're playing a video game where you collect monsters. Each monster is like a special box holding its details, like its name and level. But what if your monster needs to carry things like swords or potions? That's where resource ownership comes in!

### Purpose and Usefulness

- **Remembering Stuff:** Just like you need a backpack to remember the items you carry, collections need storage to remember what's inside them.
- **Staying Organized:** Putting things like game items in collections makes them easy to find and manage, just like keeping your stuff organized in a backpack.

### Implementation

```jsx
// Example of a collection with storage
access(all) resource Collection {

    access(all) var ownedNFTs: @{UInt64: NFT}

    init() {
        self.ownedNFTs <- {}
    }

    destroy () {
        destroy self.ownedNFTs
    }
}
```

### Explanation

In the `Collection` resource, `ownedNFTs` is like the backpack storing the NFTs (the game items). When a new collection is created, it starts empty. And whenever you use nested resource, you have to add `destroy()`.

### Try it Out

1. Go to the [Flow Playground](https://play.flow.com/).
2. Add some NFTs to the `ownedNFTs` backpack in the collection and see how it works!
