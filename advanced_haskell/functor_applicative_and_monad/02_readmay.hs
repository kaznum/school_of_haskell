-- to use Safe module, exec 'cabal install safe'
import Safe (readMay)

main = do
     print (readMay "1980" :: Maybe Integer)
     print (readMay "hello" :: Maybe Integer)
     print (readMay "2000" :: Maybe Integer)
     print (readMay "two-thousand" :: Maybe Integer)

-- Just 1980
-- Nothing
-- Just 2000
-- Nothing
