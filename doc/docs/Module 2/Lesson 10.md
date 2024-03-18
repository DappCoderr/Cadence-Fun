---
title: Lesson 10 - destory()
sidebar_position: 10
---

In Cadence, Resource may have a destructor function, which is executed when the resource is destroyed. Destructors have no parameters and no return value and are declared using the `destroy` keyword. A resource can have only one destructor.

```jsx
// Define a resource named `Country`
access(all) resource Country {
    access(all) var id: UInt64
    access(all) var name: String
    access(all) var details: CountryDetails

    init(_id: UInt64, _name: String, _budget: UFix64, _value: UInt8) {
        self.id = _id
        self.name = _name
        self.details = HelloWorld.CountryDetails(budget: _budget, value: _value)
    }

    // Define the destructor
    destroy() {}
}
```

In this example:- `destroy()`: This is the destructor function for the `Country` resource.

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a `destroy` function in the `KnightNFT` resource. This function will decrement `nextKnightId` and `totalSupply` by 1.
