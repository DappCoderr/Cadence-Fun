import Test
import "Knight"

access(all) let admin = Test.getAccount(0x0000000000000005)
access(all) let alice = Test.createAccount()
// access(all) let bob = Test.createAccount()

access(all)
fun setup() {
    var err = Test.deployContract(
        name: "Knight",
        path: "../contracts/Knight.cdc",
        arguments: []
    )
    Test.expect(err, Test.beNil())
}

access(all)
fun testContractInitializedEventEmitted() {
    let typ = Type<Knight.ContractInitialized>()
    Test.assertEqual(1, Test.eventsOfType(typ).length)
}

access(all)
fun testGetTotalSupply() {
    let scriptResult = Test.executeScript(
        "../scripts/get_totalSupply.cdc",
        []
    )
    Test.expect(scriptResult, Test.beSucceeded())

    let totalSupply = scriptResult.returnValue! as! UInt64
    Test.assertEqual(0 as UInt64, totalSupply)
}

access(all)
fun testSetupAccount() {
    let txResult = Test.Transaction(
        code: "../transactions/setup_account.cdc",
        authorizers: [admin.address],
        signers: [admin],
        arguments: [],
    )
    Test.expect(txResult, Test.beSucceeded())

    let scriptResult = Test.executeScript(
        "../scripts/get_collectionLength.cdc",
        [admin.address]
    )
    Test.expect(scriptResult, Test.beSucceeded())

    let collectionLength = scriptResult.returnValue! as! UInt64
    Test.assertEqual(0, collectionLength)
}

access(all)
fun testMintNFT() {

    var txResult = Test.Transaction(
        code: "../transactions/mint_knight.cdc",
        authorizers: [admin.address],
        signers: [admin],
        arguments: ["Knight Name",
                    "Knight Type"],
    )
    Test.expect(txResult, Test.beSucceeded())

    let typ = Type<Knight.Deposit>()
    let events = Test.eventsOfType(typ)
    Test.assertEqual(1, events.length)

    let depositEvent = events[0] as! Knight.Deposit
    Test.assertEqual(0 as UInt64, depositEvent.id)
    Test.assertEqual(alice.address, depositEvent.to!)

    let scriptResult = Test.executeScript(
        "../scripts/get_collection_ids.cdc",
        [
            recipient.address,
            Knight.PublicPath
        ]
    )
    Test.expect(scriptResult, Test.beSucceeded())

    let collectionIDs = scriptResult.returnValue! as! [UInt64]
    Test.assertEqual([0] as [UInt64], collectionIDs)
}

access(all)
fun testBorrowNFT() {
    let scriptResult = Test.executeScript(
        "../scripts/borrow_knight.cdc",
        [
            admin.address,
            0 as UInt64
        ]
    )
    Test.expect(scriptResult, Test.beSucceeded())
}

access(all)
fun testGetCollectionIDs() {
    let scriptResult = Test.executeScript(
        "../scripts/getId.cdc",
        [
            admin.address,
            Knight.PublicPath
        ]
    )
    Test.expect(scriptResult, Test.beSucceeded())

    let collectionIDs = scriptResult.returnValue! as! [UInt64]
    Test.assertEqual([0] as [UInt64], collectionIDs)
}

access(all)
fun testGetCollectionLength() {
    let scriptResult = Test.executeScript(
        "../scripts/get_collectionLength.cdc",
        [admin.address]
    )
    Test.expect(scriptResult, Test.beSucceeded())

    let collectionLength = scriptResult.returnValue! as! Int
    Test.assertEqual(1, collectionLength)
}