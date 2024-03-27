---
title: Lesson 6 - Capability
sidebar_position: 6
---

In this lesson, we're utilizing capabilities to manage access to our collection. Capabilities provide secure, fine-grained control over who can access and interact with resources stored in an account's storage.

### **Purpose and Usefulness:**

Capabilities ensure that only authorized parties can access and interact with resources stored in an account's storage. This is useful because:

1. **Security:** Capabilities prevent unauthorized access to sensitive data and resources, enhancing the security of the system.

2. **Control:** By controlling access to resources via capabilities, developers can enforce access policies and ensure compliance with security requirements.

### **Implementation:**

```cadence
self.account.save(<- create Collection(), to: self.StoragePath)
self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)
```

### **Explanation:**

- `self.account.save(<- create Collection(), to: self.StoragePath)`: This line creates a new instance of the `Collection` resource and saves it to the account's storage at the specified storage path (`self.StoragePath`).
- `self.account.link<&{KnightCollectionPublic}>(self.PublicPath, target: self.StoragePath)`: This line creates a capability that grants access to the `KnightCollectionPublic` interface and links it to a public path (`self.PublicPath`). The capability points to the storage path where the collection is stored (`self.StoragePath`).

### **Putting it to the Test:**
