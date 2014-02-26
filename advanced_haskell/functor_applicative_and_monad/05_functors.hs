import Safe (readMay)

displayAge maybeAge =
  case maybeAge of
    Nothing -> putStrLn "You provided an invalid year"
    Just age -> putStrLn $ "In 2020, you will be: " ++ show age

yearToAge year = 2020 - year

main = do
  putStrLn "Please enter your birth year"
  yearString <- getLine
  let maybeAge = fmap yearToAge (readMay yearString)
  displayAge maybeAge


-- *Main> main
-- Please enter your birth year
-- 1976
-- In 2020, you will be: 44
-- *Main> main
-- Please enter your birth year
-- hello
-- You provided an invalid year

----
---- the behaviors of fmap with Maybe
----
-- *Main> fmap (2 +) (Just 5)
-- Just 7
-- *Main> fmap (2 +) Nothing
-- Nothing
