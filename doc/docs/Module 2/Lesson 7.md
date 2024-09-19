---
title: Lesson 7 - Contract Storage
sidebar_position: 7
---

Now, let's put together our Knight struct and knights array into action by adding the Knight to the smart contract storage. To do this, we'll use our array of the contract which will keep track of the store knights struct.

```jsx
access(all) contract HelloWorld {
    access(all) let countries: [Country]

    access(all) struct Country {
        access(all) let country_ID: UInt64
        access(all) var name: String

        init(name:String){
            self.country_ID = 1
            self.name = name
        }
    }

    // create new country
    let newCountry = Country(name:"Canada")
    // Add the new country to the countries array
    countries.append(newCountry)

    // Initialize the dictionary in the contract's initializer
    init() {
        self.countries = []
    }
}
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a new knight and store that `knight` to the `knights` array.

Next, we’ll learn how to declare and use functions in Cadence.

### Solution !!

![Alt text](image-6.png)
