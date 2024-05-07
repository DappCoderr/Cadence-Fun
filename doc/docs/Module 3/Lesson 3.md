---
title: Lesson 3 - Nested Resources
sidebar_position: 3
---

Remember those collections from the last lesson? They might be empty now, but that's okay! Just like filling a box with toys, you can add NFTs to your collection for better organization. Today, we'll explore a concept called "nested resources" to help you do just that.

### Imagine Your Collection as a Box

Think of your collection as a box, and your NFTs as different types of toys (games, balls, colors, etc.). Nested resources allow you to organize these items within the box itself.

### Let's Peek at the Code!

This code snippet shows how nested resources make organization possible:

```jsx
// Our Collection with a built-in backpack!
access(all) resource Collection {

    // This is like the backpack that holds all the cool stuff (NFTs)
    access(all) var ownedNFTs: @{UInt64: NFT}

    // This function creates an empty backpack when a new Collection is made
    init() {
        // Assigning an empty dictionary to ownedNFTs
        self.ownedNFTs <- {}
    }

    // This function cleans up the backpack when the Collection is no longer needed
    destroy () {
        destroy self.ownedNFTs
    }
}
```

### **Explanation:**

- Remember Module 2 L8 how we have created resource dictionary. Similarly create `ownedKnight`.
- The `destroy()` function helps us clean up the backpack when the collection is no longer needed.

### **Put it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Remember Module 2 L8 how we have created resource dictionary.
   Similarly create `ownedKnight` and store it to an previously created resource collection.

### Solution !!
