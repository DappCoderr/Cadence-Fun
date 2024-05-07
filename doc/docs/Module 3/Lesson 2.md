---
title: Lesson 2 - Collection
sidebar_position: 2
---

Very first we are introducing you with the new concept called **`Collection`**.
Imagine your digital photos, music flies, movies, cards scattered across a messy desktop – that's what having NFTs without collections can feel like.

This lesson is your guide to organizing them into a shiny, personalized space!

### **What's a Collection?**

Think of a collection as a folder that holds all your unique digital treasures (NFTs) together. Just like folders on your computer that help you group and manage your movies or music files efficiently.

![Alt text](image-3.png)

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

1. Open Flow [Playground](https://play.flow.com/)
2. Create a resource name Collection.

### Solution !!
