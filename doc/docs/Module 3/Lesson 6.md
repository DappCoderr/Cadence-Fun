---
title: Lesson 6 - Saving Knight to Storage
sidebar_position: 6
---

Now, let's store Knights in our contract using the storage we created earlier.

For that we will create a function and call the `storedCountries` and store the `Country` resource to it. Let’s create.

```jsx
access(all) contract HellWorld {

//.....above code
  access(all) fun storeCountry(country: @Country) {
      self.storedCountries[country.id] <-! country
  }

//...more code
}
```

### **Explanation:**

- Inside the `storeCounty` function, we use this operator: `<-!`. This is called the “force-move operator”. Cadence requires us to use this with dictionaries because it will abort the program if a Knight at the specific `id` already exists.
- This is protecting us from accidentally overwriting a Knight in the dictionary.

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a public function named `storeKnight` with one parameter as `knight` resource
