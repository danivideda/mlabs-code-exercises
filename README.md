# ByteCode Interpreter using Haskell

Interpret a set of instructions to output a result.
It uses a stack machine, and not a register base machine.

## Instructions
| Bytecode                 | Description                              |
| ------------------------ | ---------------------------------------- |
| `LOAD_VAL` **`Int`**     | Insert value into the stack              |
| `WRITE_VAR` **`String`** | Assign stack value into variable         |
| `READ_VAR` **`String`**  | Take value from stored variable          |
| `VAR` _**`Variable`**_   | Store variable in a single 'stack'       |
| `RETURN`                 | Return value from stack                  |
| `ADD`                    | Add two value from top of the stack      |
| `SUBSTRACT`              | Substrac two value from top of the stack |
| `DIVIDE`                 | Divide two value from top of the stack   |
| `MULTIPLY`               | Multiply two value from top of the stack |
| `COMPLETED`              | Completed stack operation                |
| `Unknown`                | Unidentified instruction set             |

## Type
| Name           | Type cast       |
| -------------- | --------------- |
| **`Variable`** | `(String, Int)` |
