---
title: Lesson 9 - Clash of the Knights
sidebar_position: 9
---

This lesson delves into the heart of your game – the battle logic! The function simulates a battle between two knights belonging to different users. The function determines the winner based on the knights' experience points (XP) and triggers a victory action for the winning knight.

Here's a breakdown of the code that orchestrates epic clashes between your knights:

- **The Function: Battle Royale!**

The code defines a function named battle. This function takes on the responsibility of simulating a thrilling battle between two knights. Here's a step by step explanation of what it does:

- **Knight Selection: The function takes four arguments**

userA and userB: These represent the addresses (locations on the Flow blockchain) of the two players participating in the battle.
userAKnightId and userBKnightId: These are unique identifiers specifying the exact knights from each player's collection that will be dueling.

- **Gathering the Troops:**

The function retrieves information about the players involved (getAccount(userA) and getAccount(userB)).
It then retrieves special access keys (capabilities) for each player's knight collection. These capabilities act like permission slips, allowing the function to access the specific knights for battle.

- **Knight Stats and XP Check:**

Once it has the capabilities, the function borrows references to the actual knights involved (borrowKnight) using their IDs.
It then retrieves the crucial stat – experience points (XP) – for each knight (knightA_XP and knightB_XP).

- **May the Best Knight Win**

The function compares the XP of the two knights. The knight with the higher XP is declared the victor!
For the winning knight, the function calls a special function named winner. This function likely performs actions associated with victory, such as updating knight stats or awarding rewards.

- **Edge Cases:**

The code includes checks to handle potential errors. The panic statements indicate that something unexpected happened (like not finding a knight with the provided ID). In a real application, you'd likely handle these situations more gracefully.

```cadence
pub fun battle(userA: Address, userAKnightId: UInt64, userB: Address, userBKnightId: UInt64) {
    let acctA = getAccount(userA)
    let acctB = getAccount(userB)

    let userACapRef = acctA.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
    let knightA_XP = userACapRef.borrowKnight(id: userAKnightId)?.xp ?? panic("Knight A XP not found")

    let userBCapRef = acctB.getCapability<&{Knight.KnightCollectionPublic}>(Knight.PublicPath).borrow() ?? panic("Could not borrow")
    let knightB_XP = userBCapRef.borrowKnight(id: userBKnightId)?.xp ?? panic("Knight B XP not found")

    if (knightA_XP > knightB_XP) {
        let winnerKnight = userACapRef.borrowKnight(id: userAKnightId)
        winnerKnight?.winner()
    } else {
        let winnerKnight = userBCapRef.borrowKnight(id: userBKnightId)
        winnerKnight?.winner()
    }
}
```

### **Explanation:**

- The function takes the addresses of the two users (`userA` and `userB`) and the IDs of their respective knights (`userAKnightId` and `userBKnightId`).
- It retrieves the capabilities of the users' knight collections and borrows references to the knights specified by the provided IDs.
- The function compares the XP of the two knights and determines the winner based on their XP values.
- If knight A has more XP than knight B, knight A is declared the winner and the `winner` function is called for knight A. Otherwise, knight B is declared the winner and the `winner` function is called for knight B.

### **Putting it to the Test:**
