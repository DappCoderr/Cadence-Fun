---
title: Lesson 5 - Tracking Victories
sidebar_position: 5
---

We had run our battle function, but it doesn't have anything yet which can track the wins. Hmmmm!!.
You remember we created `winCount` variable in lesson 2. Now we will use that variable in this lesson.

But how do we call and increment that variable?
Let's create a function called `winner` which increments the `winCount` variable every time it's been called in the NFT resource. Every time your knight wins the battle winner function is called.

```cadence
access(all) contract HelloWorld{

    access(all) var counter: UInt64

    pub fun winner() {
        self.counter = self.counter + 1
    }

    init(){
        self.counter = 0
    }
}
```

### Put It to the Test

1. Open Flow [Playground](https://play.flow.com/)
2. Create a function named `winner()` in NFT resource and increment the winCount variable.
3. Remove the log in battle function we created in last lesson and update it with by calling the `winner()`.

### Solution !!

![Alt text](image-9.png)

---

![Alt text](image-10.png)
