{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

import Data.Default
import Yesod
import Yesod.Default.Util

data App = App

instance Yesod App

-- mkYesod "App" [parseRoutes|
--               / HomeR GET
-- |]

mkYesod "App" $(parseRoutesFile "config/routes")

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  let filenames = ["readme.txt", "report.pdf", "music.wav"] :: [String]
  setTitle "File Processor"
--   toWidget [whamlet|
-- <h2>Previously submitted files
-- $if null filenames
--   <p> No files have been uploaded yet.
-- $else
--   <ul>
--     $forall filename <- filenames
--       <li>#{filename}
-- |]
  $(widgetFileNoReload def "home")


main :: IO ()
main = warpEnv App

