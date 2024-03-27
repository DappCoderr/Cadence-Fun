---
title: Lesson 9 - Battle logic
sidebar_position: 9
---

In this lesson, we're implementing a battle logic function that simulates a battle between two knights belonging to different users. The function determines the winner based on the knights' experience points (XP) and triggers a victory action for the winning knight.

### **Purpose and Usefulness:**

The `battle` function allows users to engage in battles between their knights, adding a gameplay element to the application. This is useful because:

1. **Engagement:** Users can participate in interactive activities within the application, enhancing user engagement and retention.

2. **Competition:** Battles create a competitive environment where users can strive to improve their knights and compete against others.

### **Implementation:**

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
