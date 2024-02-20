pub contract KnightContract {

    pub var totalSupply: UInt64
    pub var nextKnightId: UInt64

    pub enum Types: UInt8 {
        pub case fire
        pub case grass
        pub case sun
        pub case rock
    }

    pub struct KnightDetails{
        pub var name: String
        pub var createdDate: UFix64
        pub var type: Types? 

        init(name:String, value:UInt8){
            self.name = name
            self.createdDate = getCurrentBlock().timestamp
            self.type = KnightContract.Types(value: value)
        }
    }

	pub resource KnightNFT{
        pub var id: UInt64
        pub var xp: UFix64
        pub var details: KnightContract.KnightDetails
				 
	    init(id:UInt64, xp:UFix64, name:String, value:UInt8){
            self.id = id
            self.xp = xp
            self.details = KnightContract.KnightDetails(name: name, value:value)

            KnightContract.nextKnightId = KnightContract.nextKnightId + 1
            KnightContract.totalSupply = KnightContract.totalSupply + 1 
		}

        destroy(){
            KnightContract.nextKnightId = KnightContract.nextKnightId - 1
            KnightContract.totalSupply = KnightContract.totalSupply - 1 
        }
	}

    pub fun createKnight(id: UInt64, xp:UFix64, name:String, value:UInt8): @KnightNFT{
        return <- create KnightNFT(id: id, xp:xp, name:name, value:value)
    }

	init(){
        self.totalSupply = 0
		self.nextKnightId = 0
	}
}