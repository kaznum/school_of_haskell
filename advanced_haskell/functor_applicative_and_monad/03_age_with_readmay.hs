import Safe (readMay)
main = do
  putStrLn "Please enter your birth year"
  yearString <- getLine
  case readMay yearString of
    Nothing -> putStrLn "You provided an invalid year"
    Just year -> putStrLn $ "In 2020, you will be: " ++ show (2020 - year)

-- *Main> main
-- Loading package safe-0.3.3 ... linking ... done.
-- Please enter your birth year
-- 1976
-- In 2020, you will be: 44
-- *Main> main
-- Please enter your birth year
-- hello
-- You provided an invalid year
