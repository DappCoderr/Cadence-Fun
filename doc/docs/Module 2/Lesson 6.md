---
title: Lesson 6 - Resources with Structs
sidebar_position: 6
---

Remember the `Country` struct we created in Lesson 6?
It held details like a country's name, population, and coastline information. Now, let's see how to use this struct within a Flow resource!

### World Resource with Country Details

We will use our previously created `World` resource for a single country. This resource will leverage the Country struct to store the country's specific information in a structured format.

Here's how the `World` resource might look:

```cadence
access(all) resource World {

    access(all) var country: Country

    init(_name: String, _population: UFix64){
        self.book = Country(_name: _name, _population: _population)
    }
}
```

### Breaking it Down:

- The `World` resource contains a property `country` of type `Country`.
- In the `init` function of `World`, we initialize the `country` property with the provided name and population.

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Use `KnightDetails` inside a `KnightNFT` resource.
   This way, we keep knight data organized and easy to manage.

### Solution !!
