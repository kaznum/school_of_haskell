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
--  let filename1 = "readme.txt" :: String
--      filename2 = "report.pdf" :: String
--      filename3 = "music.wav" :: String
--  let filenames = ["readme.txt", "report.pdf", "music.wav"] :: [String]
  let filenames = [] :: [String]
  setTitle "File Processor"
  toWidget [whamlet|
<h2>Previously submitted files
$#<ul>
$#  <li>readme.txt
$#  <li>report.pdf
$#  <li>music.wav
$#  <li>#{filename1}
$#  <li>#{filename2}
$#  <li>#{filename3}
$#  $forall filename <- filenames
$#    <li>#{filename}
$if null filenames
  <p> No files have been uploaded yet.
$else
  <ul>
    $forall filename <- filenames
      <li>#{filename}
|]


main :: IO ()
main = warpEnv App

