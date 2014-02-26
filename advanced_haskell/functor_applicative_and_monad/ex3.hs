import Safe (readMay)
import Control.Applicative((<*>))
import Control.Applicative((<$>))

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided invalid input"
    Just age -> putStrLn $ "In that year, you will be: " ++ show age

main = do
  putStrLn "Please enter your birth year"
  birthYearString <- getLine
  putStrLn "Please enter some year in the future"
  futureYearString <- getLine
  let maybeAge = do
        futureYear <- readMay futureYearString
        birthYear <- readMay birthYearString
        return $
          if futureYear < birthYear
          then birthYear - futureYear
          else futureYear - birthYear
  displayAge maybeAge

-- *Main> main
-- Please enter your birth year
-- 1976
-- Please enter some year in the future
-- 2014
-- In that year, you will be: 38
-- *Main> main
-- Please enter your birth year
-- 2014
-- Please enter some year in the future
-- 1976
-- In that year, you will be: 38
