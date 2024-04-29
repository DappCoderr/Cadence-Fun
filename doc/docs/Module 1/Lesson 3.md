---
title: Lesson 3 - Understanding Cadence Operators
sidebar_position: 3
---

Before diving into building our contract further, let's explore Cadence operators, which are like specialized tools designed to solve various coding challenges.

#### [Optionals (?)](https://cadence-lang.org/docs/1.0/language/glossary#optional)

Let's start with optionals. These are super important in Cadence. Imagine you have a box, but sometimes it might be empty. That's exactly what an optional is—a box that might have something inside or might be empty.

```jsx
var name: String? = "country"
var name: String? = nil
```

#### [References (&)](https://cadence-lang.org/docs/1.0/language/references)

Next up, we have references. Think of them as a way to point to something. You can use a reference to access information or do things with whatever it's pointing to.

```jsx
let hello = "Hello"
let helloRef = &hello as &String
helloRef.length // tells us how many letters are in the word "hello"
```

#### [At Operator (@)](https://cadence-lang.org/docs/1.0/language/glossary#-at)

The `@` symbol is special because it tells us if something is really important, like a special resource. It's like putting a big red label on something to say, "Hey, this is special!"

```jsx
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

### Putting it to the Test

If you understand, then let's go and start building out remaining game logic.
