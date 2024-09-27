---
title: Lesson 12 - Saving Knight
sidebar_position: 12
---

Remember the dictionary you created in Lesson 8 to store your knights? Now, let's use it to save your newly created knight!

**Storing Knights with a Function**: We'll create a function to store the knight in the dictionary. This function will take the knight resource as an argument and store the knight in the contract storage.

```jsx
access(all) contract HellWorld {

//.....above code
  access(all) fun storeCountry(country: @Country) {
    self.storedCountries[country.id] <-! country
  }

//...more code
}
```

### Put It to the Test

1. Open Flow Playground
2. Create a public function named `storeKnight` with one parameter as knight resource.
3. Use the `storeKnight` dictionary to store the knight in the contract storage.

### Solution !!

![Alt text](image-8.png)
