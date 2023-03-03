import Knight from "./Knight.cdc"
import Drink from "./Drink.cdc"

pub contract Fight{

  pub var totalBattle: UInt64

  pub fun attack(knightID:UInt64, _targetID:UInt64){
    
  }

  init(){
    self.totalBattle = 0
  }
}