---
title: Lesson 7 - Unpredictable Power!
sidebar_position: 7
---

The strength of your Flow Knights is ever-evolving, but how do you determine how much their power grows? This lesson introduces Verifiable Random Functions (VRF) to ensure those power increases are awarded fairly and securely.

### **Why Use VRF for Power Boosts? It's All About Fairness and Security!**

VRF takes the guesswork out of randomness, making it perfect for games where a touch of uncertainty adds to the excitement:

- **Unbeatable Fairness:** VRF ensures no one can predict or tamper with the random number generation. This keeps your game honest and rewards truly deserving Knights on their quests for power!
- **Ironclad Security:** VRF utilizes cryptography to guarantee the randomness is secure and unbiased. No sneaky manipulation here!

### Coding Like a Game Master!

Here's a sneak peek at the code that generates random power with VRF:

```jsx
access(all) contract Dice {

    access(all) fun roll(): UInt64 {
        let rand: UInt64 = revertibleRandom()
        return (rand%X)+1 // Adjust X based on your desired power range
    }

    init() {
    }
}
```

### **Explanation:**

- The revertibleRandom function utilizes VRF to generate a random, unpredictable number. Think of it as rolling a super secure die!
- The expression (randomNumber % X) + 1 takes that random number and scales it down to a range suitable for power increases (replace X with the maximum power value you want for your Knights).

### **Putting it to the Test:**
