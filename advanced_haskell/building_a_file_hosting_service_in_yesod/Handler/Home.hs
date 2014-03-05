{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Home where

import Data.Conduit
import Data.Conduit.Binary
import Data.Default
import Yesod
import Yesod.Default.Util

import Foundation

getHomeR :: Handler Html
getHomeR = do
  (formWidget, formEncType) <- generateFormPost uploadForm
  filenames <- getList
  defaultLayout $ do
    setTitle "File Processor"
    $(widgetFileNoReload def "home")

postHomeR :: Handler Html
postHomeR = do
  ((result, _), _) <- runFormPost uploadForm
  case result of
    FormSuccess fi -> do
      app <- getYesod
      fileBytes <- runResourceT $ fileSource fi $$ sinkLbs
      addFile app (fileName fi, fileBytes)
    _ -> return ()
  redirect HomeR

uploadForm = renderDivs $ fileAFormReq "file"