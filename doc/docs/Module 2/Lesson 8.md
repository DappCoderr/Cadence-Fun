---
title: Lesson 8 - enum
sidebar_position: 8
---

Enumerations are sets of symbolic names bound to unique, constant values, which can be compared by identity. Means it provide you some pre define value which reduce bugs in your code.
For example, if we consider an application for a fresh juice shop, it would be possible to restrict the glass size to `small`, `medium`, and `large`. This would make sure that it would not allow any user to order any size other than small, medium, or large. It will restrict the user to use these 3 values.

Enums are declared using the `enum` keyword.

Enum cases are declared using the `case` keyword, followed by the name of the enum case.

```jsx
//....code

access(all) enum Direction: UInt8{

	access(all) case east
	access(all) case west
	access(all) case north
	access(all) case south
}

//....code
```

Let’s add the enum in our `CountryDetails` struct

```jsx
//....code

access(all) struct CountryDetails{

	access(all) let countryBudget: UFix64
	access(all) var touristAreAllowed: Bool

	// add enum in the struct
	access(all) var direction: Direction?

	init(budget:UFix64, value:UInt8){
		self.countryBudget = budget
		self.touristAreAllowed = false

		// Initialising enum
		self.direction = HelloWorld.Direction(value: value)
	}
}

//....code

```

### Put It to the Test

- Create a enum named `Types` of type `UInt8` and add different type case `fire`, `grass`, `sun`, `rock` .
- Create public variable named `types` of type enum
- Initialise value of `types`
