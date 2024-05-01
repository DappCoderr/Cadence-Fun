---
title: Lesson 8 - Building Your Vault
sidebar_position: 8
---

In this lesson, We're going to learn something super cool that'll make your NFT experience even smoother.

Think about this scenario: You're in a library, and you've picked out around 15 to 20 books you want to take home. But here's the catch – you don't have a bag to carry them. What do you do now? It's a bit of a problem, right? Well, in the world of NFTs, encountering a similar problem can happen.

Let's say you stumble upon an NFT that catches your eye, but you don't have its collection in your account. Uh-oh! That's where our new function, called createEmptyCollection, swoops in to save the day!

So, what does this function do? It's pretty straightforward – it lets you create a brand new collection with just one simple function call. No need to worry about complex setup processes or scratching your head over technical details. Just imagine it like clicking a button and boom – your vault is ready to rock!

Now, let's dive a little deeper into how this function works and how it can make your NFT journey a whole lot easier. Ready? Let's get started!

### **Implementation:**

Let's explore the code behind the scenes to see how the createEmptyCollection function works

```jsx
// This function acts like a magic button to create a new empty treasure chest (collection)
access(all) fun createEmptyCollection(): @Collection {
  // Use the magic "create" keyword to build a brand new collection on the blockchain
  return <- create Collection()
}
}
```

### **Explanation:**

The createEmptyCollection function doesn't take any arguments – it simply creates something new.
Inside the function, we use a special keyword called create. Think of it like a magical tool that builds a brand new Collection resource on the blockchain.
Once the collection is built, the function returns a reference to it (like a key to your new treasure chest). Now you can start adding your NFTs (treasures) one by one!

### **Putting it to the Test:**
