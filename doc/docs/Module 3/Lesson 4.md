---
title: Lesson 4 - View function
sidebar_position: 4
---

If you have ethereum background, then you will be familiar with term `view` .
View functions ensure that they will not mutate/change the state means they will used to read the state.

```jsx
access(all) contract HellWorld {

//.....more code
	// reading the state variable
	access(all) fun getGreeting():String{
		return self.greetings
	}

	// reading countries id, returning array
	access(all) fun getIDs(): [UInt64] {
		return self.storedCountries.keys
	}

//...more code
}

```

Here we have three function, which will provide a better view to

### Put It to the Test

Create two public function `getCountryDetails` and `getIDs`

`getIDs` will return array of Ids

`getCountryDetails` will return struct `CountryDetails`
