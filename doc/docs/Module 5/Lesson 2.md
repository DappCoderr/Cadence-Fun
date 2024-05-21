---
title: Lesson 2 - Unique Identifiers
sidebar_position: 2
---

Every resource in Cadence also has a built-in unique identifier that is unique to that resource only, and **will never be repeated again.** Even if the resource is destroyed.

This makes for a perfect `id` system. Let’s give our `Knight` an `id` using the built in `uuid` field to every resource:

```jsx
access(all) contract HellWorld {

	access(all) resource Country{
		access(all) var id: UInt64
		access(all) var name: String
		access(all) var capital: String
		access(all) var details: CountryDetails

		init(_name: String, _cap: String, _budget: UFix64, _value: UInt8){
			self.id = self.uuid
			self.name = _name
			self.capital = _cap
			self.details = HelloWorld.CountryDetails(budget: _budget, value: _value)
		}
	}
}

```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Change `knight` resource id with resource built-in unique identifier
