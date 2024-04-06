---
title: Lesson 8 - Generate Random XP
sidebar_position: 8
---

In this lesson, we're implementing a function to generate a random experience points (XP) value for a Knight. We'll utilize a Verifiable Random Function (VRF) by flow to generate a secure and unpredictable random number.

### **Purpose and Usefulness:**

Using a VRF for generating random numbers ensures fairness and security in applications where randomness is required. This is useful because:

1. **Fairness:** VRF ensures that no party can manipulate or predict the outcome of random number generation, ensuring fairness in applications like gaming and lotteries.

2. **Security:** VRF provides cryptographic security guarantees, making it resistant to manipulation or bias.

### **Implementation:**

```jsx
access(all) contract Dice {

    access(all) fun roll(): UInt64 {
        let rand: UInt64 = revertibleRandom()
        return (rand%6)+1
    }

    init() {
    }
}
```

### **Explanation:**

- `revertibleRandom()`: This function returns a random UInt64 value generated using a Verifiable Random Function (VRF). The generated random number is cryptographically secure and unpredictable.
- `(randomNumber % 100) + 1`: This expression ensures that the generated random number falls within the range of 1 to 100, making it suitable for representing experience points (XP) for a Knight NFT.

### **Putting it to the Test:**
