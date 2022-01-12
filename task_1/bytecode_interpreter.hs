import Data.List (find)

data ByteCodes
    = LOAD_VAL Int -- Insert value into the stack
    | WRITE_VAR String -- Assign stack value into variable
    | READ_VAR String -- Take value from stored variable
    | VAR Variable -- Store variable in a single 'stack'
    | RETURN -- Return value from stack
    | ADD -- Add two value from top of the stack
    | SUBSTRACT -- Substrac two value from top of the stack
    | DIVIDE -- Divide two value from top of the stack
    | MULTIPLY -- Multiply two value from top of the stack
    | COMPLETED -- Completed stack operation
    | Unknown
    deriving (Show, Eq, Ord)

type Variable = (String, Int)

-- PARSER from a instruction.txt into ByteCodes data types
stringToByteCodes :: String -> ByteCodes
stringToByteCodes str = case words str of
    ["LOAD_VAL", val] -> LOAD_VAL (read val :: Int)
    ["WRITE_VAR", var] -> WRITE_VAR (read var :: String)
    ["READ_VAR", var] -> READ_VAR (read var :: String)
    ["RETURN"] -> RETURN
    ["ADD"] -> ADD
    ["SUBSTRACT"] -> SUBSTRACT
    ["DIVIDE"] -> DIVIDE
    ["MULTIPLY"] -> MULTIPLY
    _ -> Unknown

storeVar :: [ByteCodes] -> ByteCodes
storeVar [WRITE_VAR var, LOAD_VAL val] = VAR (var, val)
storeVar _ = COMPLETED

-- findVal :: [ByteCodes] -> ByteCodes
-- findVal [] = COMPLETED
-- findVal (LOAD_VAL val : rest) = LOAD_VAL val
-- findVal _ = Unknown

findVal :: [ByteCodes] -> ByteCodes
findVal rest = maybeToVal $ find ((== "LOAD_VAL") . head . words . byteCodesToString) rest
  where
    maybeToVal :: Maybe ByteCodes -> ByteCodes
    maybeToVal (Just ans) = ans
    maybeToVal Nothing = Unknown
    byteCodesToString :: ByteCodes -> String
    byteCodesToString byteCode = show byteCode

readVal :: String -> [ByteCodes] -> ByteCodes
readVal str rest = maybeToVal (find ((== str) . maybeToStr) $ runByteCodes rest)
  where
    maybeToStr :: ByteCodes -> String
    maybeToStr (VAR val) = fst val
    maybeToStr _ = "WRONG_ARG"

    maybeToVal :: Maybe ByteCodes -> ByteCodes
    maybeToVal (Just (VAR (var, val))) = LOAD_VAL val
    maybeToVal _ = Unknown

instructions :: String -> [ByteCodes]
instructions x = map stringToByteCodes (cleanLines $ reverse $ lines x)
  where
    cleanLines :: [String] -> [String]
    cleanLines [] = []
    cleanLines (x : xs)
        | x == "" = cleanLines xs
        | otherwise = x : cleanLines xs

runByteCodes :: [ByteCodes] -> [ByteCodes]
runByteCodes [] = []
runByteCodes (op : rest) = case op of
    WRITE_VAR var -> storeVar [WRITE_VAR var, findVal rest] : runByteCodes rest
    READ_VAR var -> readVal var rest : runByteCodes rest
    -- ADD -> add rest : runByteCodes rest
    -- LOAD_VAL val -> LOAD_VAL val : runByteCodes rest
    -- TODO: case for other byte codes Operations
    _ -> runByteCodes rest

main :: IO ()
main = do
    x <- readFile "instructions.txt"
    print (instructions x)
    print (runByteCodes $ instructions x)