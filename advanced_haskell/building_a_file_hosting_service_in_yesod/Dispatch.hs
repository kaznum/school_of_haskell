{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Dispatch where

import Data.Default
import Yesod
import Yesod.Default.Util

import Foundation
import Handler.Home

mkYesodDispatch "App" resourcesApp

-- getHomeR :: Handler Html
-- getHomeR = do
--   let filenames = ["readme.txt", "report.pdf", "music.wav"] :: [String]
--   defaultLayout $ do
--     setTitle "File Processor"
--     $(widgetFileNoReload def "home")

