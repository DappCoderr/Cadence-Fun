// pub contract KnightContract {

//     pub var totalSupply: UInt64
//     pub var nextKnightId: UInt64

//     pub enum Types: UInt8 {
//         pub case fire
//         pub case grass
//         pub case sun
//         pub case rock
//     }

//     pub struct KnightDetails{
//         pub var name: String
//         pub var createdDate: UFix64
//         pub var type: Types? 

//         init(name:String, value:UInt8){
//             self.name = name
//             self.createdDate = getCurrentBlock().timestamp
//             self.type = KnightContract.Types(value: value)
//         }
//     }

// 	pub resource KnightNFT{
//         pub var id: UInt64
//         pub var xp: UFix64
//         pub var details: KnightContract.KnightDetails
				 
// 	    init(id:UInt64, xp:UFix64, name:String, value:UInt8){
//             self.id = id
//             self.xp = xp
//             self.details = KnightContract.KnightDetails(name: name, value:value)

//             KnightContract.nextKnightId = KnightContract.nextKnightId + 1
//             KnightContract.totalSupply = KnightContract.totalSupply + 1 
// 		}

//         destroy(){
//             KnightContract.nextKnightId = KnightContract.nextKnightId - 1
//             KnightContract.totalSupply = KnightContract.totalSupply - 1 
//         }
// 	}

//     pub fun createKnight(id: UInt64, xp:UFix64, name:String, value:UInt8): @KnightNFT{
//         return <- create KnightNFT(id: id, xp:xp, name:name, value:value)
//     }

// 	init(){
//         self.totalSupply = 0
// 		self.nextKnightId = 0
// 	}
// }



// // pub contract KnightContract {

// // 	pub var totalSupply: UInt64
// //   pub var nextKnightId: UInt64

// //   // Store knight into the contract storage
// //   // pub let storedKnight: @{UInt64: Knight}

// //   // using enum to define constant
// //   //

// //   pub enum Types: UInt8 {
// //     pub case fire
// //     pub case water
// //     pub case ice
// //     pub case electric
// //     pub case flying
// //     pub case ghost
// //     pub case dark
// //     pub case rock
// //     pub case psychic
// //     pub case grass
// //     pub case poison
// //     pub case ground
// //     pub case fighting
// //   }

// //   pub struct KnightDetails{
// //       pub var name: String
// //       pub var createdDate: UFix64
// //       pub var isActive: Bool
// //       pub var type: Types?

// //       init(name_:String, rawValue:UInt8){
// //          self.name = name_
// //          self.createdDate = getCurrentBlock().timestamp
// //          self.isActive = true
// //          self.type = KnightContract.Types(rawValue: rawValue)
// //       }

// //       pub fun toggleKnightActiveButton():Bool  {
// //          return !self.isActive
// //       }
// //   }

// // 	pub resource KnightNFT{
// //       pub var id: UInt64
// //       pub var xp: UFix64
// //       pub var details: KnightContract.KnightDetails
// //       pub var winCount: UInt64

// // 			init(_xp:UFix64, name:String, rawValue:UInt8){
// //          self.id = KnightContract.nextKnightId
// //          // using unique resource identifier
// //          // self.id = self.uuid
// //          self.xp = _xp
// //          self.details = KnightContract.KnightDetails(name_: name, rawValue:rawValue)
// //          // Create a win count variable and keep track of win count in the resource
// //          self.winCount = 0
// //          // increment totalsupply and nextKnight id
// //          KnightContract.nextKnightId = KnightContract.nextKnightId + 1
// //          KnightContract.totalSupply = KnightContract.totalSupply + 1
// // 			}

// //       // create win count function
// //       pub fun winner(){
// //          self.winCount = self.winCount + 1
// //       }

// //       // destroy function to destory the Resource Knight NFT
// //       destroy(){
// //         KnightContract.nextKnightId = KnightContract.nextKnightId - 1
// //         KnightContract.totalSupply = KnightContract.totalSupply - 1
// //       }
// // 	}

// //   pub fun createKnight(xp:UFix64, name:String, rawValue:UInt8): @KnightNFT{
// //     return <- create KnightNFT(_xp:xp, name:name, rawValue:rawValue)
// //   }

// // 	init(){
// //         self.totalSupply = 0
// // 				self.nextKnightId = 0
// // 	}
// // }

