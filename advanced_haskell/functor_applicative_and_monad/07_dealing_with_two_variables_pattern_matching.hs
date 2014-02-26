import Safe (readMay)

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided invalid input"
    Just age -> putStrLn $ "In that year, you will be: " ++ show age

main = do
  putStrLn "Please enter your birth year"
  yearString <- getLine
  putStrLn "Please enter some year in the future"
  futureYearString <- getLine
  let maybeAge =
        case readMay yearString of
          Nothing -> Nothing
          Just birthYear ->
            case readMay futureYearString of
              Nothing -> Nothing
              Just futureYear -> Just (futureYear - birthYear)
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
