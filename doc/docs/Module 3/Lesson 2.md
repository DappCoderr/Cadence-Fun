---
title: Lesson 2 - Creating Storage
sidebar_position: 2
---

Now you have learned how to create a resource, and in Test it Out, you have created your first Knight. Now we will add some extra data to our smart contract to spice things up.

For that let’s make a dictionary in the contract that stores `Knight` by their `id`.

```jsx
access(all) contract HellWorld {

//.....above code

access(all) let storedCountries: @{UInt64: Country}

//...more code
	init(){
		self.storedCountries <- {}
	}
}
```

- `storedCountries` isn’t a resource, it is a dictionary that stores resources and thus must be treated like one. That is why we must use `<-` on this line: `self.storedPokemon <- {}`
- When we define something of resource type, then `@` symbol must be added.

### Put It to the Test

Create a public dictionary `storedCountries` of type resource. And initialise value in init function.
