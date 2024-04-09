---
title: Lesson 2 - Collection
sidebar_position: 2
---

Imagine your digital collectibles scattered across a messy room – that's what having NFTs without collections can feel like. This lesson is your guide to organizing them into a shiny, personalized vault!

### **What's a Collection?**

Think of a collection as a box that holds all your unique digital treasures (NFTs) together. Just like folders on your computer that help you group and manage your movies or music files efficiently.

Now let's understand how we can create a collection.

```jsx
// contract code
access(all) contract HelloWorld: NonFungibleToken {

  // This is like a special room inside your contract,
  // but only for NFTs!
  access(all) resource Collection {
  }
}
```

### **Explanation:**

We're creating a new element called `Collection` of type resource. This will acts as a container that can hold multiple NFTs.

### **Put it to the Test:**

Head over to Flow Playground and try creating your own collection! It's a great way to get hands-on with organizing your digital treasures.
