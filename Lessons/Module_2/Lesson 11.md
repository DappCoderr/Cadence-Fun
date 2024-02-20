## **Lesson 11: destory()**

Resource may have a destructor, which is executed when the resource is destroyed. Destructors have no parameters and no return value and are declared using the `destroy` name. A resource may have only one destructor.

```jsx
//....code

	// Declare a resource named `Country`
	pub resource Country{
      pub var id: UInt64
		  pub var name: String
      pub var details: CountryDetails

			init(id_:UInt64, name_:String, budget_:UFix64, value:UInt8){
         self.id = id_
				 self.name = name_
         self.details = HelloWorld.CountryDetails(budget: budget_, value: value)
			}

		destroy(){
		}
	}

//....code

```

### Put It to the Test

- Create a destory function in resource `KnightNFT` and decrement `nextKnightId` and `totalSupply` by 1.

# Next Lesson →
