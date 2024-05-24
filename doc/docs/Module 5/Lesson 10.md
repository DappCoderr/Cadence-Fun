---
title: Lesson 10 - Events
sidebar_position: 10
---

Our contract is almost finished! Now let’s add an event.

Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be ‘listening’ for certain events and take action when they happen.

Example:

```cadence
// declare the event
access(all) event IntegersAdded(x: UInt64, y: UInt64, result: UInt64);

access(all) fun add(x: UInt64, y: UInt64): UInt64 {
    let result: UInt64 = x + y
    // fire an event to let the app know the function was called:
    emit IntegersAdded(x: x, y: y, result: result)
    return result
}
```

### **Putting it to the Test:**
