main = do
     putStrLn "Please enter your birth year"
     year <- getLine
     putStrLn $ "In 2020, you will be: " ++ show (2020 - read year)

-- *Main> main
-- Please enter your birth year
-- 1976
-- In 2020, you will be: 44
-- *Main> main
-- Please enter your birth year
-- hello
-- In 2020, you will be: *** Exception: Prelude.read: no parse
