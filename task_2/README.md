# Design Choice

I'm using list in Haskell to process the instruction.
The idea is to evaluate each element from the left, and walk through from the very last bytecode.

Unfortunately I can't get it done in time, or to be more precise, I still have a design flaw. That is:
1. It can't re-assign variable
2. The operand bytecode still can't execute properly, I'm still getting my head around it.
3. The end result still in form of `[ByteCodes]` type

I tried with my best ability while still learning Haskell, as this is my first functional programming language that I've ever learned. And I gotta say that it's really fun, still have a lot to learn more.

Misc:

Me tweeting my excitement with Haskell [(link)](https://twitter.com/danivideda/status/1481098863142662144?s=20)