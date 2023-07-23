// Hey, Welcome to Cadence! These are the cadence Sample Application tutorial programs.

pub contract WhiteListContract {

    pub var totalWhiteListedAddress: UInt64

    pub var whitelistAddress: {Address: Bool}

    pub fun whiteListAddress(add: Address) {
        self.whitelistAddress[add] = true;
        self.totalWhiteListedAddress = self.totalWhiteListedAddress + 1 as UInt64
    }

    pub fun checkWhiteListedAddress(add: Address): Bool {
        return self.whitelistAddress[add]!
    }

    pub fun getTotalCount(): UInt64 {
        return self.totalWhiteListedAddress
    }
  
    init(){
        self.totalWhiteListedAddress = 0
        self.whitelistAddress = {}
    }
}