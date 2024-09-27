---
title: Lesson 9 - Function Declaration
sidebar_position: 9
---

A function is a block of code that performs a specific task. To declare a function, you need to specify:

- **Specify access control**: Decide if the function can be used by everyone or only within the contract.
- **Use the fun keyword**: This tells Cadence that you're creating a function.
- **Give it a name**: Choose a clear and descriptive name.
- **Define parameters (optional)**: If the function needs any information to work, list the parameters and their types.
- **Specify the return type (optional)**: If the function will give back a value, tell Cadence what type it will be.

Here's a basic example of a function declaration:

```jsx
// Define a function named createCity with a return type String
access(all) fun createCity(): String {
    // Function body
}
```

**Return Value**: This function takes a new name as input, updates the city name, and returns the new name.

```jsx
access(all) fun updateCityName(newName:String): String {
  let city = newName
  return city
}
```

**View Functions**: A "view" function is a function which reads data from the contract but doesn't change anything.

```jsx
access(all) view fun sayHello(): String {
  return "What's up Canada";
}
```

### Put it to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public function named `createKnight`.

### Solution !!

![Alt text](image-7.png)
