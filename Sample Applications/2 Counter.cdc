// Hey, Welcome to Cadence! These are the cadence basis tutorial programs.


// Simple contract to build counter dapp, increment & decrement the value of count.
access(all) contract Counter {

    access(all) let count: UInt64

    // The init() function is required if the contract contains any fields.
    init() {
        self.count = 0
    }

    // Public function that increment the count by 1
    access(all) fun incrementCount() {
        self.count + 1 as UInt64
    }

    // Public function that decrement the count by 1
    access(all) fun decrementCount() {
        self.count - 1 as UInt64
    }

    // Public function that returns the value of count
    access(all) fun getCount(): UInt64 {
        return self.count
    }
}