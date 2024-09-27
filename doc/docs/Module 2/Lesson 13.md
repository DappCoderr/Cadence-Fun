---
title: Lesson 13 - Events
sidebar_position: 13
---

Our contract is almost finished! Now let’s add an event.

Events are a way for your contract to communicate that something happened on the blockchain from your application frontend. It's a logging functionality which allows developers to store data on-chain that is more searchable and gas efficient than saving data to the account storage.

Events can only be declared within a contract body.

- To create an event you use - `event` keyword
- To emit an event you use `emit` keyword

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
2. Declare an event called `KnightMinted` in `createKnight` function.
3. Pass `id` of type UInt64 and a `name` of type String.

### Solution !!

![Alt text](image-9.png)

![Alt text](image-12.png)
