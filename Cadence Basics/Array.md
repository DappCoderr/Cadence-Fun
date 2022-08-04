### Hey, Welcome to Cadence! This is the cadence basis tutorial programs.



## Array

Array is a collection of similar types of data, starts with square bracket [ and end with square bracket ].

How to write array in cadence?
```
Defining array inside function

pub var numbers: [UInt64] = [] // Empty Array

```

```

Defining array inside resource, struct or globally, then you have to initialize it.

// Empty Array
pub var nftCount: [UInt64]

init(){
    self.nftCount = []
}



// Array with value
pub var nftCount: [UInt64]

init(){
    self.nftCount = [2,3,4,5,5]
}
```