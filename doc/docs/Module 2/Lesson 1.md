---
title: Lesson 1 - Overview
sidebar_position: 1
---

:::note
If you're already familiar with Cadence and Flow Playground, feel free to skip this section.
:::

Before diving into Module 2, it's assumed you have a basic understanding of blockchain concepts, smart contracts, transactions, etc. If not, please take a moment to review [these](https://developers.flow.com/build/basics/blocks) fundamentals.

In this module, we'll be using the Flow Playground to build the Knight game. If you're new to Flow, we recommend watching a [quick tutorial](https://youtu.be/pRz7EzrWchs?si=bodusfeIHzgHPrV6&t=158) to grasp the basics of the Flow Playground.

:::note
While the Flow Playground should work on any standard web browser, we recommend using Google Chrome for the best experience as it's been tested and optimized for this browser.
:::

Before we delve into Cadence basics and learn how to write smart contracts in Cadence, let's take a brief overview of what Cadence is.

### What is Cadence?

Cadence is a new programming language for smart contracts on the Flow Blockchain. It introduces features that enhance smart contract programming, ensuring code safety, security, clarity, and approachability.

Key features of Cadence include:

1. Type safety and a robust static type system.
2. Resource-oriented programming, which we'll explore in later lessons, is a method that combines linear types with object capabilities to establish a secure and clear model for digital ownership.
3. Built-in pre-conditions and post-conditions for functions and transactions.
4. Utilisation of capability-based security ensures that only the owner and those with a valid reference to the object have access control over the object.
5. Cadence’s syntax is inspired by popular modern general-purpose programming languages like [Swift](https://developer.apple.com/swift/), [Kotlin](https://kotlinlang.org/), and [Rust](https://www.rust-lang.org/). Its use of resource types maps well to that of [Move](https://medium.com/coinmonks/overview-of-move-programming-language-a860ffd8f55d), the programming language being developed by the Diem team.
