---
title: Lesson 4 - Clash of the Knights
sidebar_position: 4
---

This lesson delves into the heart of your game – the battle logic! The function simulates a battle between two knights belonging to different users. The function determines the winner based on the knights' power and triggers a victory action for the winning knight.

Let's breakdown how we can make this epic clashes between your knights possible

- **The Function: Battle Royale!** :
  Create a function `battle`, which make this clashes happens between you knights.
  After that we need two parameters; userA and userB: These represent the addresses (locations on the Flow blockchain) of the two players participating in the battle.
  `userAKnightId` and `userBKnightId`: These are unique identifiers specifying the exact knights from each player's collection that will be dueling.

  ```jsx
  pub fun battle(userA: Address, userAKnightId: UInt64, userB: Address, userBKnightId: UInt64) {

  }
  ```

- **Gathering the Troops:** :
  The function retrieves information about the players involved (getAccount(userA) and getAccount(userB)).
  It then retrieves special access keys (capabilities) for each player's knight collection. These capabilities act like permission slips, allowing the function to access the specific knights for battle.

  ```cadence
  pub fun battle(userA: Address, userAKnightId: UInt64, userB: Address, userBKnightId: UInt64) {
    let acctA = getAccount(userA)
    let acctB = getAccount(userB)

    let userACapRef = acctA.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
    let userBCapRef = acctB.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
  }
  ```

- **Knight Stats and XP Check:**
  Once it has the capabilities, the function borrows references to the actual knights involved (borrowKnight) using their IDs.
  It then retrieves the crucial stat – experience points (XP) – for each knight (knightA_XP and knightB_XP).

  ```cadence
  pub fun battle(userA: Address, userAKnightId: UInt64, userB: Address, userBKnightId: UInt64) {
    // before code ....

    // borrows knight references of the knight using their IDs.

    let knightA_XP = userACapRef.borrowKnight(id: userAKnightId)?.xp ?? panic("Knight A XP not found")
    let knightB_XP = userBCapRef.borrowKnight(id: userBKnightId)?.xp ?? panic("Knight B XP not found")
  }
  ```

- **May the Best Knight Win**
  The function compares the XP of the two knights. The knight with the higher XP is declared the victor!
  For the winning knight, the function calls a special function named winner. This function likely performs actions associated with victory, such as updating knight stats or awarding rewards

  ```cadence
  pub fun battle(userA: Address, userAKnightId: UInt64, userB: Address, userBKnightId: UInt64) {

    // before code ....

    if (knightA_XP > knightB_XP) {
      let winnerKnight = userACapRef.borrowKnight(id: userAKnightId)
    } else {
      let winnerKnight = userBCapRef.borrowKnight(id: userBKnightId)
    }
  }
  ```

- **Edge Cases:**
  The code includes checks to handle potential errors. The panic statements indicate that something unexpected happened (like not finding a knight with the provided ID). In a real application, you'd likely handle these situations more gracefully.

### **Putting it to the Test:**

1. Open Flow [Playground](https://play.flow.com/)
2. Incorporating the battle function in your contract. If you can't able to do this. Read this lesson again.

### Solution !!

![Alt text](image-8.png)
