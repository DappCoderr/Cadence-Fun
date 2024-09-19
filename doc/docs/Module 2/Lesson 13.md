---
title: Lesson 13 - Events
sidebar_position: 13
---

Our contract is almost finished! Now let’s add an event.

Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be ‘listening’ for certain events and take action when they happen.

```jsx
// declare the event
access(all) event AssetCreated(id:UInt64);

access(all) fun createHelloAsset(): @HelloAsset {
    emit AssetCreated(id:self.totalSupply)
    return <- create HelloAsset()
}
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Declare an event called KnightMinted. It should pass id (a UInt64), name (a String).

### Solution !!

![Alt text](image-9.png)

![Alt text](image-12.png)
