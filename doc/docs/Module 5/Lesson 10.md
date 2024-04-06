---
title: Lesson 10 - Refactoring Resource
sidebar_position: 10
---

In this lesson, we're adding functionality to update the non-fungible token (NFT) resource. Specifically, we're introducing a function called `winner` that increments the win count of the NFT. This allows tracking of certain attributes or behaviors associated with individual NFTs.

### **Purpose and Usefulness:**

The `winner` function serves to update the state of an NFT, specifically increasing its win count. This is useful because:

1. **Tracking:** It allows keeping track of certain events or actions related to the NFT, such as wins in a game or achievements in a digital ecosystem.

2. **Dynamic Behavior:** The ability to update NFT attributes enables dynamic behavior and interactivity, enhancing the utility and value of NFTs in various applications.

### **Implementation:**

```cadence
pub fun winner() {
    self.winCount = self.winCount + 1
}
```

### **Explanation:**

The `winner` function increments the `winCount` attribute of the NFT by 1. This attribute presumably tracks the number of wins associated with the NFT. By calling this function, the win count of the NFT is updated, reflecting its latest status or achievement.

### **Putting it to the Test:**
