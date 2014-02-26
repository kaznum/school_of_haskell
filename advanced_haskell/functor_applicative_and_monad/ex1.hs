import Control.Applicative((<*>))

myFmap f functorValue = return f <*> functorValue

-- *Main>myFmap (+ 1) $ Just 8
-- Just 9
-- *Main> myFmap (+ 1) Nothing
-- Nothing




