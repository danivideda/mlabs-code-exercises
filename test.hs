import Data.List (find)
myfunc x = case x of
    "true" -> customfun "something"
        where
            customfun str = str ++ "aaa"
    _ -> "idk"


search :: Eq a => a -> [(a,b)] -> Maybe b
search a = fmap snd . find ((== a) . fst)

data ByteCodes = ADD deriving (Show)

