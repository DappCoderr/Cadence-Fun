---
title: Lesson 2 - Refactoring NFT
sidebar_position: 2
---

Let's improve the structure and organization (refactor) of our Knight NFT to make it more dynamic and informative. We'll utilize unique identifiers and add new variables.

### Unique Identifiers:

Every resource in Cadence has a built-in unique identifier that's perfect for NFT IDs as it's guaranteed to be unique for each NFT.

Let’s take a look how we can use the built-in unique identifiers.

```jsx
access(all) contract HellWorld {
	access(all) resource Country{

		access(all) var id: UInt64

		init(){
			// defining unique identifiers
			self.id = self.uuid
		}
	}
}
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Change the knight resource ID to use the built-in unique identifier.
3. Add more variables to the KnightDetails struct, such as:

- `dateCreated` of type `UFix64`, indicating when the NFT was created.
- `type` variable of type `String`, defining how effective moves can be in battle (e.g., fire, water, rock, grass, electric, ice, flying, ghost, dark, steel, dragon, poison, fighting). We will discuss this variable in upcoming lessons.
- `winCount` of type `UInt64` to the NFT resource to track the knight's win count. Initialize it with a zero value. We will also discuss this variable in upcoming lessons.

:::note
To get the date, you can use block.timestamp, which is a global variable representing the current timestamp of the block being mined. The timestamp is measured in seconds. Use `getCurrentBlock()` timestamp to obtain it.
:::

### Solution !!

![Alt text](image-4.png)

---

![Alt text](image-5.png)
