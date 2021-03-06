import Safe (readMay)

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided invalid input"
    Just age -> putStrLn $ "In that year, you will be: " ++ show age

yearDiff futureYear birthYear = futureYear - birthYear

main = do
  putStrLn "Please enter your birth year"
  birthYearString <- getLine
  putStrLn "Please enter some year in the future"
  futureYearString <- getLine
  let maybeAge = do
        yearToAge <- fmap yearDiff (readMay futureYearString)
        fmap yearToAge (readMay birthYearString)
  displayAge maybeAge


-- *Main> main
-- Please enter your birth year
-- 1976
-- Please enter some year in the future
-- 2014
-- In that year, you will be: 38
-- *Main> main
-- Please enter your birth year
-- hello
-- Please enter some year in the future
-- 2014
-- You provided invalid input
-- *Main> main
-- Please enter your birth year
-- 1976
-- Please enter some year in the future
-- hello
-- You provided invalid input
