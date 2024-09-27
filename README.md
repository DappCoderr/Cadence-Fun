## Cadence Fun

Welcome to Cadence Fun Developers! This platform is tailored to facilitate your journey in learning Cadence smart contracts by creating simple games on the Flow blockchain. Whether you are a novice or an experienced developer, Cadence Fun offers a comprehensive learning experience for all technical aspects related to Flow blockchains to deepen your understanding and proficiency. Enabling you to develop your own crypto games on the Flow network.

### Project Structure 📦

Before delving into the code, let's take a moment to understand the structure of the Cadence Fun repository:

- `/cadence`: This folder contains the primary contract for Cadence Fun.
- `/web`: Here, you will find the frontend components of the project.
- `flow.json`: This configuration file is essential for the project, akin to package.json in other frameworks.

Within the cadence folder, you will discover:

- `/contracts`: All contracts pertinent to the project are housed here.
- `/scripts`: This folder includes all the project scripts.
- `/transactions`: Here, you can locate all the project transactions.
- `/tests`: All Cadence tests are stored in this dedicated folder.

Additionally, inside the contracts folder, you will find:

- `/standards`: This directory encompasses all the core Flow contracts.

### Get Started:

To dive into the examples and experiment with Cadence code, leverage the Flow Playground available at https://play.flow.com/.

Feel free to explore the codebase, make modifications, and enjoy the learning process as you delve into the intricacies of Cadence and its practical applications on the Flow blockchain!

### Created By:

Cadence Fun is a Developer Grant project initiated by DC, a Flow Dev Ambassador, and a Cadence Smart Contract Developer hailing from India. Our team is dedicated to assisting developers, like yourself, in navigating the realm of blockchain development on the Flow network.

Let's embark on this coding adventure and infuse some excitement into Cadence! 🚀

flow scripts execute ./scripts/borrow_knight.cdc --network=testnet e209afd8e8d05fe8 252887674462360

flow scripts execute ./scripts/getId.cdc --network=testnet e209afd8e8d05fe8

[78065325651708, 202310139586625, 95657511692915, 252887674462360]

USERA - flow scripts execute ./scripts/borrow_knight.cdc --network=testnet e209afd8e8d05fe8 252887674462360 - XP: 50 > 61 > 58 > 78

USERB - flow scripts execute ./scripts/borrow_knight.cdc --network=testnet e209afd8e8d05fe8 78065325651708 - XP: 43 > 41 > 64 > 69

USERC - flow scripts execute ./scripts/borrow_knight.cdc --network=testnet e209afd8e8d05fe8 85761907048080 - XP: 30 > 29 > 28

flow transactions send ./transactions/battle_knight.cdc --network=testnet --signer testnet e209afd8e8d05fe8 252887674462360 e209afd8e8d05fe8 78065325651708
