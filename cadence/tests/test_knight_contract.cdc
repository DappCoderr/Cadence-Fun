import Test
import "Knight"

access(all) let account = Test.getAccount(0x0000000000000005)
access(all) let alice = Test.getAccount(0x0000000000000006)
access(all) let bob = Test.getAccount(0x0000000000000007)


// Deploying Contract 
access(all)
fun setup(){
    let contractCode = Test.readFile("../contracts/knight.cdc")
    let err = Test.deployContract(
        name: "Knight", 
        code: contractCode,
        account: account, 
        arguments: []
    )
    // beNil function returns a new matcher that checks 
    // if the given test value is nil.
    Test.expect(err, Test.beNil())
}


// Initialise Empty Collection
//
access(all)
fun testInitialiseEmptyCollection(){
    // Testing framework provides a convenient way to load programs 
    // from a local file with the help of readFile.
    let code = Test.readFile("../transactions/init_Collection.cdc")
    // import transaction with the help of test.Transaction
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: []
    )

    // execute tranasction
    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Collection already exist in storage")
}


// Initialise Empty Collection
//
access(all)
fun testInitialiseEmptyCollection(){
    let code = Test.readFile("../transactions/init_Collection.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [bob.address],
        signers: [bob],
        arguments: []
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Collection already exist in storage")
}


// Transaction to Mint Knight
//
access(all)
fun testMintKnight() {
    let code = Test.readFile("../transactions/Create_Knight.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: [],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot mint NFT with empty name and type")
}


// Transaction to Mint Knight for user A
//
access(all)
fun testMintKnight() {
    let code = Test.readFile("../transactions/Create_Knight.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: [ "Harry Potter","Gryffindor"],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot able to mint NFT ")
}


// Transaction to Mint Knight for user B
//
access(all)
fun testMintKnight() {
    let code = Test.readFile("../transactions/Create_Knight.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [bob.address],
        signers: [bob],
        arguments: [ "Thor","Marvel"],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot able to mint NFT ")
}


// Transaction to Battle between Knight
//
access(all)
fun testBattle() {
    let code = Test.readFile("../transactions/Battle.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: [alice.address, 1, bob.address, 2],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot create empty collection")
}


// Transaction to Destroy Knight
//
access(all)
fun testDestroyKnight() {
    let code = Test.readFile("../transactions/destroy_Knight.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: [1],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot create empty collection")
}


// Transaction to Destroy Collection
//
access(all)
fun testDestroyCollection() {
    let code = Test.readFile("../transactions/destroy_Coll.cdc")
    let tx = Test.Transaction(
        code: code,
        authorizers: [alice.address],
        signers: [alice],
        arguments: [],
    )

    let txResult = Test.executeTransaction(tx)

    Test.expect(txResult, Test.beSucceeded())
    Test.assertError(txResult, errorMessage: "Cannot create empty collection")
}


// Script to Check Collection
//
access(all) fun testCheckCollection() {
    let code = Test.readFile("../scripts/checkCollection.cdc")
    let args = []

    let scriptResult = Test.executeScript(code, args)

    // Assert that the script was successfully executed.
    Test.expect(scriptResult, Test.beSucceeded())
}


// Script to Get Id
//
access(all) fun testGetId() {
    let code = Test.readFile("../scripts/getId.cdc")
    let args = [alice.address]

    let scriptResult = Test.executeScript(code, args)

    // Assert that the script was successfully executed.
    Test.expect(scriptResult, Test.beSucceeded())
}


// Script to Get Knight
//
access(all) fun testGetKnight() {
    let code = Test.readFile("../scripts/getKnight.cdc")
    let args = [alice.address, 1]

    let scriptResult = Test.executeScript(code, args)

    // Assert that the script was successfully executed.
    Test.expect(scriptResult, Test.beSucceeded())
}


// Script to Get Total Knight
//
access(all) fun testGetTotalKnight() {
    let code = Test.readFile("../scripts/getTotal_Knight.cdc")
    let args = []

    let scriptResult = Test.executeScript(code, args)

    // Assert that the script was successfully executed.
    Test.expect(scriptResult, Test.beSucceeded())
}