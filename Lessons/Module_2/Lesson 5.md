## **Lesson 5: Resource**

Resources are special type can only exist in `one` location at a time and must be used `exactly once`. A resource are declared using the `resource` keyword.

```jsx
pub contract HelloWorld {

	// .....more code

	// Declare a resource named `Country`
	pub resource Country{

	    init(){}

	}

	// .....more code
}
```

You can define variable and function inside resourece.

Every time you create a resource you have add initialiser to initialise defined variables values.

```jsx

// .....more code

// Declare a resource named `Country`
pub resource Country{
    pub var name: String
    pub var capital: String

    init(name_:String, cap:String){
	self.name = name_
	self.capital = cap
    }
}
// .....more code
```

Explanation:

- **`pub`** is an access modifier, allowing anyone to read the variable.
- **use`resource`** keyword for create a resource Country

### Put It to the Test

- Create a resource named `KnightNFT`
- Create two public variable of name `id` and `xp` of type unsigned integer inside resource and initialise their value in the init function with value Zero.

# Next Lesson →
