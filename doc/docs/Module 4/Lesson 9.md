---
title: Lesson 9 - New Empty Collection
sidebar_position: 9
---

In this lesson, we're adding a public function that allows users to create an empty collection. This function provides a convenient way to initialize a new collection without any existing non-fungible tokens (NFTs).

### **Purpose and Usefulness:**

The `createEmptyCollection` function serves to streamline the creation of new collections. This is useful because:

1. **Simplicity:** Users can create collections with a single function call, eliminating the need for manual initialization.

2. **Consistency:** The function ensures that all newly created collections start with an empty state, avoiding potential inconsistencies or errors.

### **Implementation:**

```cadence

    access(all) fun createEmptyCollection(): @Collection {
        return <- create Collection()
}
```

### **Explanation:**

The `createEmptyCollection` function creates a new `Collection` resource instance using the `create` keyword, which allocates memory for the resource on the blockchain. It returns a reference to the newly created collection, allowing users to start adding NFTs to it.

### **Putting it to the Test:**
