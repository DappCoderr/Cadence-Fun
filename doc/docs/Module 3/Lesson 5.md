---
title: Lesson 5 - Reading from Storage / View Function
sidebar_position: 5
---

If you have ethereum background, then you will be familiar with term `view` .
That ensure they won't modify the contract's state. These functions are used solely for reading data from the contract's state.

In flow, we also create similar functions, which have function declaration and a return type.

```jsx
access(all) contract HellWorld {

	// reading countries id, returning array
	access(all) fun getIDs(): [UInt64] {
		return self.storedCountries.keys
	}

}

```

In this example:

- `getIDs()`: This function returns an array of IDs of stored countries by accessing the keys of the `storedCountries` dictionary.

These functions provide a convenient way to peek into the contract's state without making any changes to it.

**Put It to the Test:**
Create two public functions `getKnightDetails` and `getIDs`.

- `getIDs` should return an array of IDs.
- `getKnightDetails` should return the details of countries using the `KnightDetails` struct.
