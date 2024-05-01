---
title: Lesson 3 - Nested Resources
sidebar_position: 3
---

Remember those awesome collections you created in the last lesson? Get ready to take them to the next level! Today, we'll explore a powerful concept called resources owning resource. Imagine a collection like a box. Inside the box, you can put different things, like toys. The box (collection) doesn't own the toys (NFTs), it just holds them together and keeps them organized.

Just like you create folder in your desktop to organize different movies file as per category.

Let's take a peek at the code that makes nested resources possible. Don't worry, it's not as scary as it sounds!

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

- We added a variable called ownedNFTs to our Collection resource. Think of it as the backpack that will hold all the information about the NFTs in the collection.
- The init() function acts like packing an empty backpack when a new collection is created.
- The destroy() function helps us clean up the backpack when the collection is no longer needed.

### **Put it to the Test:**

Head back to Flow Playground (link in the previous lesson). Now that your collections have backpacks, try adding some NFTs to them and see how it works!

[Link to Flow Playground] (Insert link here)

Remember, this is just the beginning of your collection mastery journey! Stay tuned for more lessons on how to use your collections like a pro.
