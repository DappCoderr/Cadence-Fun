---
title: Lesson 12 - Saving Knight
sidebar_position: 12
---

Now, let's store Knights in our contract in the storage we created in lesson 8.

For that we will create a function and call the dictionary and store the KnightNFT resource to it. Let’s see the below code, how we are storing Country resource.

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

Open Flow Playground
Create a public function named storeKnight with one parameter as knight resource

### Solution !!

![Alt text](image-8.png)
