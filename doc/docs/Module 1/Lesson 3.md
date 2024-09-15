---
title: Lesson 3 - Understanding Cadence Operators
sidebar_position: 3
---

Alright, let's take a look at some of cadence operators. Don't worry if you don't understand everything right away. As we build our game, you'll see how these operators are used in real-world scenarios.

Think of operators as tools in your toolbox. They help you build your smart contracts.

#### [Optionals (?)](https://cadence-lang.org/docs/1.0/language/glossary#optional)

Optionals are like little boxes. They might have something inside, or they might be empty. This is handy when you're not sure if a value exists.

```jsx
var name: String? = "country"
var name: String? = nil
```

#### [References (&)](https://cadence-lang.org/docs/1.0/language/references)

References are like arrows pointing to something. You can use them to access or change the thing they're pointing to.

```jsx
// Method 1
let hello = "Hello"
// Create a reference to the `String` `hello`.
// Provide the reference type `&String` using a type assertion
let helloRef = &hello as &String

// Method 2
let alsoHelloRef: &String = &hello
// Invalid: Cannot create a reference without an explicit type
let unknownRef = &hello
```

#### [At Operator (@)](https://cadence-lang.org/docs/1.0/language/glossary#-at)

The `@`symbol before a type indicates that it's a [resource](https://cadence-lang.org/docs/language/resources). Resources are special types in Cadence that represent valuable assets or objects. It's like putting a big red label on something to say, "Hey, this is special!"

```jsx
// Declare a resource named `SomeResource`
access(all) resource SomeResource {}

// we use the '@' symbol to reference a resource type
let a: @SomeResource <- create SomeResource(value: 0)
```

#### [Force-assignment Operator `(<-!)`](https://cadence-lang.org/docs/1.0/language/operators#force-assignment-operator--)

This one is pretty straightforward. It's like saying, "If the variable is nil, the move succeeds. If it is not nil, the program aborts."

```jsx
access(all) resource R {}

var a: @R? <- nil
a <-! create R()

Note:- The force-assignment operator is only used for resource types.
```

#### [Swapping Operator `(<->)`](https://cadence-lang.org/docs/1.0/language/operators#swapping-operator--)

Imagine you have two things, like two toys. The swapping operator lets you swap them around, so one person can play with the other person's toy and vice versa.

```jsx
var a = 1
var b = 2
a <-> b
// Now `a` has 2 and `b` has 1
```

#### [Force Unwrap Operator (!)](https://cadence-lang.org/docs/1.0/language/operators#force-unwrap-operator-)

This one is like opening a present. If there's something inside, great! If not, well, you might be panic and abort the work.

```jsx
let a: Int? = nil
let b: Int = a! // If there's nothing inside `a`, the program aborts because `a` is nil.
```

#### [Nil-Coalescing Operator (??)](https://cadence-lang.org/docs/1.0/language/glossary#nil-coalescing-operator)

Think of this one as a backup plan. If the first plan doesn't work, we have something else to fall back on.

```jsx
let a: Int? = nil
let b: Int = a ?? 42 // If there's nothing in `a`, we'll use 42 instead
```

#### [Move Operator `(<-)`](https://cadence-lang.org/docs/1.0/language/resources#the-move-operator--)

Last but not least, the move operator is like moving a valuable object from one place to another. It's important to do it right, or you might lose something precious!

```jsx
resource R {}
let a <- create R() // Moving a valuable resource into `a`

NOTE:- It is used when the value is a resource.
```

That's a quick overview of common Cadence operators. Don't worry if you don't understand everything right now. We'll see these operators in action as we build our game.
