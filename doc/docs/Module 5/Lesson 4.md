---
title: Lesson 4 - Account Storage
sidebar_position: 4
---

In this lesson, we're introducing account storage for our collection. We'll save the collection to the account's storage and link it to a public path. This allows the collection to be accessed and interacted with by other accounts on the blockchain.

### **Purpose and Usefulness:**

Account storage enables persistent storage of data associated with an account. This is useful because:

1. **Data Persistence:** Storing the collection in the account's storage ensures that it persists between transactions and can be accessed later.

2. **Accessibility:** Linking the collection to a public path makes it accessible to other accounts, allowing them to interact with it.

### **Implementation:**

```cadence
self.account.save(<- create Collection(), to: self.StoragePath)
self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)
```

### **Explanation:**

- `self.account.save(<- create Collection(), to: self.StoragePath)`: This line creates a new instance of the `Collection` resource and saves it to the account's storage at the specified storage path (`self.StoragePath`).
- `self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)`: This line links the `KnightCollectionPublic` interface to a public path (`self.PublicPath`), pointing to the storage path where the collection is stored (`self.StoragePath`). This allows other accounts to access and interact with the collection using the specified interface.

### **Putting it to the Test:**
