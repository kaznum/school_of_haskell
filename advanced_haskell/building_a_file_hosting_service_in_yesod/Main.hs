{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

import Yesod
import Data.String

data App = App

instance Yesod App

mkYesod "App" [parseRoutes|
               / HomeR GET
|]

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  setTitle "File Processor"
  toWidget [whamlet|
<h2>Previously submitted files
<ul>
  <li>readme.txt
  <li>report.pdf
  <li>music.wav
|]


main :: IO ()
main = warpEnv App

