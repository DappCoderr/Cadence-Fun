---
title: Lesson 7 - Adding struct into Resource
sidebar_position: 7
---

```jsx

// .....more code

access(all) resource Country{

	access(all) var id: UInt64
	access(all) var name: String

	// defining struct
	access(all) var details: CountryDetails

	init(id_:UInt64, name_:String, budget_:UFix64){
		self.id = id_
		self.name = name_

		// Initialising struct
		self.details = HelloWorld.CountryDetails(budget: budget_)
	}
}

// .....more code
```

Explanation:

### Put It to the Test

- Create a struct named `KnightDetails`
- In struct create two variable named as `name`, `createdDate` of type `string` and `UFix64` respectively.
- Initialise `name` value in init function.
- Initialise `createdDate` with value `getCurrentBlock().timestamp`
- Increment `nextKnightId` and `totalSupply` in init function
