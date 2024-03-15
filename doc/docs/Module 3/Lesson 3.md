---
title: Lesson 3 - Storage
sidebar_position: 3
---

Now we will store the knight at the create storage in last lesson.

For that we will create a function and call the `storedCountries` and store the `Country` resource to it. Let’s create.

```jsx
access(all) contract HellWorld {

//.....above code
  access(all) fun storeCountry(countries: @Country) {
      self.storedCountries[countries.id] <-! countries
  }

//...more code
}
```

- Inside the `storeCounty` function, we use this operator: `<-!`. This is called the “force-move operator”. Cadence requires us to use this with dictionaries because it will abort the program if a Knight at the specific `id` already exists.
  This is protecting us from accidentally overwriting a Knight in the dictionary.

### Put It to the Test

Create a public function `storeKnight` with one parameter as `knight` resource
