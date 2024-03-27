---
title: Lesson 5 - Defining Path
sidebar_position: 5
---

In this lesson, we're defining storage and public paths for our collection. These paths specify where the collection will be stored in the account's storage and how it will be accessed publicly by other accounts.

### **Purpose and Usefulness:**

Defining paths for storage and public access provides clarity and organization for managing resources on the blockchain. This is useful because:

1. **Organization:** Paths help organize data within an account's storage, making it easier to locate and manage resources.

2. **Accessibility:** Public paths allow other accounts to access specific resources, facilitating interactions and collaborations within the blockchain ecosystem.

### **Implementation:**

```cadence
pub let StoragePath: StoragePath
pub let PublicPath: PublicPath
```

### **Explanation:**

- `StoragePath`: This variable defines the storage path where the collection will be saved within the account's storage. It specifies the location where the collection resource will reside persistently.
- `PublicPath`: This variable defines the public path that other accounts can use to access the collection. It specifies the path through which the collection can be accessed and interacted with by external entities.

### **Putting it to the Test:**
