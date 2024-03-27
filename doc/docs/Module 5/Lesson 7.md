---
title: Lesson 7 - Using VRF
sidebar_position: 7
---

In this lesson, we're implementing a function to generate a random experience points (XP) value for a Knight NFT. We'll utilize a Verifiable Random Function (VRF) to generate a secure and unpredictable random number.

### **Purpose and Usefulness:**

Using a VRF for generating random numbers ensures fairness and security in applications where randomness is required. This is useful because:

1. **Fairness:** VRF ensures that no party can manipulate or predict the outcome of random number generation, ensuring fairness in applications like gaming and lotteries.

2. **Security:** VRF provides cryptographic security guarantees, making it resistant to manipulation or bias.

### **Implementation:**

```cadence
pub fun getRandomKnightXP(): UInt64 {
    let randomNumber: UInt64 = revertibleRandom()
    return (randomNumber % 100) + 1
}
```

### **Explanation:**

- `revertibleRandom()`: This function returns a random UInt64 value generated using a Verifiable Random Function (VRF). The generated random number is cryptographically secure and unpredictable.
- `(randomNumber % 100) + 1`: This expression ensures that the generated random number falls within the range of 1 to 100, making it suitable for representing experience points (XP) for a Knight NFT.

### **Putting it to the Test:**
