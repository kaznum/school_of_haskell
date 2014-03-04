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
  let filename1 = "readme.txt" :: String
      filename2 = "report.pdf" :: String
      filename3 = "music.wav" :: String
  setTitle "File Processor"
  toWidget [whamlet|
<h2>Previously submitted files
<ul>
$#  <li>readme.txt
$#  <li>report.pdf
$#  <li>music.wav
  <li>#{filename1}
  <li>#{filename2}
  <li>#{filename3}
|]


main :: IO ()
main = warpEnv App

