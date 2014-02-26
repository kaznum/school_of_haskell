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
        birthYear <- readMay birthYearString
        return $ yearToAge birthYear
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


---- the behavior of fmap
-- *Main> :t yearDiff
-- yearDiff :: Num a => a -> a -> a

-- *Main> :t fmap yearDiff
-- fmap yearDiff :: (Functor f, Num a) => f a -> f (a -> a)

-- *Main> :t fmap yearDiff (readMay "1976")
-- fmap yearDiff (readMay "1976") :: (Num a, Read a) => Maybe (a -> a)
