## Using Cadence in Your Application

Understanding Cadence for newcomers can be challenging, but it offers a unique approach compared to other smart contract platforms. Cadence contracts resemble class definitions in object-oriented programming, with entry points mediated through Capabilities. Program flow traverses through Resource instances created by contracts, which adhere to the single-responsibility principle. These Resources specify domain-driven interfaces, handling critical functionality and data transparently on-chain.

### Scripts and Transactions

Scripts provide read-only access to on-chain objects, returning data structures from borrowed Resources. They can run against specific blocks or the latest sealed block. Transactions, with phases, ACID properties, and on-chain state mutation, orchestrate interactions between parties via contract-exposed functions.

### Important Transaction Note

Avoid coding critical business logic or fundamental program flow within transactions. Transactions reside off-chain, making it vulnerable to modification by others. This can lead to altered or skipped logic, posing a risk to the program's functioning and security. Smart contract engineering is inseparable from security engineering.

### Useful Resources

Explore the following resources for development, examples, best practices, and guidance:

- [Fungible Token standard](https://github.com/onflow/flow-ft)
- [Non Fungible Token standard](https://github.com/onflow/flow-nft)
- [Flow Core Contracts](https://github.com/onflow/flow-core-contracts)
- [Cadence Cookbook](https://cookbook.onflow.org/)
- [Security Best practices](https://developers.flow.com/cadence/security-best-practices)
- [Design patterns](https://developers.flow.com/cadence/design-patterns)
- [Anti-patterns](https://developers.flow.com/cadence/anti-patterns)
- [Guide for Solidity developers](https://developers.flow.com/cadence/solidity-to-cadence)
