---
title: Lesson 9 - update resource
sidebar_position: 9
---

I know you are getting error!!

But don’t worry. You just have to add `value` parameter where struct is initialised.

```jsx
//....code

// Declare a resource named `Country`
access(all) resource Country{
	access(all) var id: UInt64
	access(all) var name: String
	access(all) var details: CountryDetails

	init(id_:UInt64, name_:String, budget_:UFix64, value:UInt8){
		self.id = id_
		self.name = name_
		self.details = HelloWorld.CountryDetails(budget: budget_, value: value)
	}
}

//....code

```

### Put It to the Test

- Check and update `self.details`
