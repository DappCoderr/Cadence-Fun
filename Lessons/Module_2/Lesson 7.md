## **Lesson 7: Adding struct into Resource**

```jsx

	// .....more code

	pub resource Country{
      pub var id: UInt64
		  pub var name: String
			// defining struct
      pub var details: CountryDetails

			init(id_:UInt64, name_:String, budget_:UFix64){
         self.id = id_
				 self.name = name_
				 // Initialising struct
         self.details = HelloWorld.CountryDetails(budget: budget_)
			}
	}

	// .....more code
```

Explanation:

### Put It to the Test

- Create a struct named `KnightDetails`
- In struct create two variable named as `name`, `createdDate` of type `string` and `UFix64` respectively.
- Initialise `name` value in init function.
- Initialise `createdDate` with value `getCurrentBlock().timestamp`
- Increment `nextKnightId` and `totalSupply` in init function

# Next Lesson →
