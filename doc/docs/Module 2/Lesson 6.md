---
title: Lesson 6 - Dictionary & Array
sidebar_position: 6
---

Dictionary: A dictionary is a data structure that stores key-value pairs. Each key in the dictionary maps to a specific value, allowing efficient retrieval and manipulation of data.

Creating and Using Dictionaries in Cadence

```jsx
// Declare a dictionary to store countries by their ID
let countryDictionary: { UInt64: String }

// Initialize the dictionary with some values
init() {
    self.countryDictionary = [
        1: "USA",
        2: "Canada",
        3: "UK",
        // Add more key-value pairs as needed
    ]
}

// Accessing a value by its key
let name1 = countryDictionary[1]; // "USA"

// Modifying a value
countryDictionary[1] = "United States";

// Accessing a value by its key
let name2 = countryDictionary[1]; // "United States"
```

Array: An array is a collection of elements of the same type, stored in a contiguous memory location.

Creating and Using Arrays in Cadence

```jsx
let numbers: [Int8] = [1, 2, 3, 4, 5]

// Accessing an element by its index
let firstNumber = numbers[0] // 1

// Modifying an element
numbers[2] = 10

// Adding elements to an array
numbers.append(11)
//number is now `[1,2,3,4,5,11]`
numbers.insert(at:1, 6)
//number is now `[1,6,2,3,4,5,11]`

// Removing elements from an array
numbers.remove(at: 1)
//number is now `[1,2,3,4,5,11]`
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create an array named `storeKnight`.

### Solution !!

![Alt text](image-5.png)
