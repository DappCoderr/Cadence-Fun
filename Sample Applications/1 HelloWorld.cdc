// Hey, Welcome to Cadence! These are the cadence Sample Application tutorial programs.


access(all) contract HelloWorld {

    // Declare a public field of type String.
    // All fields must be initialized in the init() function.
    access(all) let greet: String

    // The init() function is required if the contract contains any fields.
    init() {
        self.greet = "Hello, World!"
    }

    // Public function that returns our friendly greeting!
    access(all) fun hello(): String {
        return self.greet
    }
}
