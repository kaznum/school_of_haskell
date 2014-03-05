{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Foundation where

import Control.Concurrent.STM
import Data.ByteString.Lazy (ByteString)
import Data.Default
import Data.Text (Text)
import qualified Data.Text as Text
import Text.Hamlet
import Yesod
import Yesod.Default.Util

data StoredFile = StoredFile !Text !ByteString
type Store = [(Int, StoredFile)]
data App = App (TVar Int) (TVar Store)

instance Yesod App where
  defaultLayout widget = do
    pc <- widgetToPageContent $ $(widgetFileNoReload def "default-layout")
    giveUrlRenderer $(hamletFile "templates/default-layout-wrapper.hamlet")

instance RenderMessage App FormMessage where
  renderMessage _ _ = defaultFormMessage

mkYesodData "App" $(parseRoutesFile "config/routes")

getNextId :: App -> STM Int
getNextId (App tnextId _) = do
  nextId <- readTVar tnextId
  writeTVar tnextId $ nextId + 1
  return nextId

getList :: Handler [(Int, StoredFile)]
getList = do
  App _ tstore <- getYesod
  liftIO $ readTVarIO tstore

addFile :: App -> StoredFile -> Handler ()
addFile app@(App _ tstore) file =
  liftIO . atomically $ do
    ident <- getNextId app
    modifyTVar tstore $ \ files -> (ident, file) : files



getById :: Int -> Handler StoredFile
getById ident = do
  App _ tstore <- getYesod
  operations <- liftIO $ readTVarIO tstore
  case lookup ident operations of
    Nothing -> notFound
    Just file -> return file
