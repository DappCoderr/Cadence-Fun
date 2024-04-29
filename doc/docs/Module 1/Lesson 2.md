---
title: Lesson 2 - Cadence Overview
sidebar_position: 2
---

Welcome! Before we dive into Cadence and the Flow Playground, let's make sure you are familiar with blockchain basics like blocks, smart contracts, and transactions, etc. If you're new to these, take a moment to brush up on [these](https://developers.flow.com/build/basics/blocks) fundamentals for a smoother ride.

In this module, we're off on a fun adventure building the Knight game using the Flow Playground. If you're new to Flow, no worries! Watch a quick tutorial to get comfy with the [playground](<(https://youtu.be/pRz7EzrWchs?si=bodusfeIHzgHPrV6&t=158)>).

:::tip
For the best experience, we suggest using Google Chrome. It's been tested and polished for this playground.
:::

Before getting into development, let's understand what Cadence is all about.

### What is Cadence?

Cadence is a programming language for writing smart contracts on the Flow Blockchain. It brings a bunch of cool features to the table, making smart contract coding safe, secure, and easy to understand.

### Why should you care about Cadence?

1. **Type Safety and Strong Types:**
   Cadence ensure that your code is safe from bugs related to data types by enforcing a strong type system. For example, if you're building a decentralized finance (DeFi) application and you want to perform arithmetic operations on token balances, Cadence's type system ensures that you can't accidentally add a token balance to a string, preventing potential errors that could compromise the security of your application.

2. **Resource-Oriented Programming:**
   Cadence's resource-oriented programming allows you to securely manage digital assets within smart contracts. Think of it like managing digital property rights. For instance, in a digital art marketplace built on Flow, each piece of digital art could be represented as a unique digital resource. Cadence's resource-oriented approach ensures that ownership and access to these digital assets are managed securely, preventing unauthorized duplication or transfer of ownership.

3. **Pre- and Post-Conditions:**
   Cadence includes built-in checks called pre- and post-conditions to ensure that your smart contracts behave as expected. Imagine you're developing a decentralized voting system. Cadence's pre-conditions could verify that only eligible voters are allowed to cast their votes, while post-conditions could ensure that the total number of votes cast doesn't exceed the total number of eligible voters, maintaining the integrity of the voting process.

4. **Capability-Based Security:**
   Capability-based security is like granting specific permissions to certain individuals in real life. For instance, in a decentralized social media platform, users could have different capabilities based on their roles. Regular users may have permission to create and view posts, while moderators may have additional capabilities like deleting posts or banning users, ensuring that the platform remains secure and well-moderated.

5. **Familiar Syntax:**
   Cadence's syntax is designed to be familiar to developers who have experience with mainstream programming languages like Swift, Kotlin, and Rust. This makes it easier for developers to transition to blockchain development without having to learn a completely new language syntax.

In summary, Cadence streamlines smart contract coding on the Flow Blockchain. Its user-friendly features and intuitive style make it perfect for anyone interested in diving into blockchain development. Let's roll up our sleeves and explore Cadence in the upcoming lessons!
