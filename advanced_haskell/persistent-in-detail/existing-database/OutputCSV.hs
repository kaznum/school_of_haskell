{-# LANGUAGE QuasiQuotes, TypeFamilies, GeneralizedNewtypeDeriving, TemplateHaskell,
    OverloadedStrings, GADTs, FlexibleContexts, ScopedTypeVariables, RecordWildCards #-}

import qualified Data.Conduit.List as CL
import Data.Conduit
import Data.Conduit.Binary
import Data.CSV.Conduit
import Database.Persist
import Database.Persist.Postgresql
import Database.Persist.TH
import Control.Monad.IO.Class (liftIO)
import Data.Time (UTCTime)
import Data.Text (Text,pack)
import Data.Map (fromList)
import System.IO (stdout)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Link sql=hotlist
  count Int default=0 sqltype=int
  added UTCTime default=now()
  followed UTCTime Maybe
  checked UTCTime Maybe
  description Text
  url Text
  URL url
  deriving Show
|]


connStr = "dbname=tutorial host=localhost user=kaz port=5432"

main :: IO ()
main = withPostgresqlPool connStr 10 $ \pool ->
  flip runSqlPersistMPool pool $
    selectSource [] [] $$
      CL.map toRow =$
      (writeHeaders defCSVSettings >> fromCSV defCSVSettings) =$
      sinkHandle stdout
    where
      toRow (Entity _ Link {..}) = fromList
        [("count" :: Text, pack $ show linkCount),
         ("added", pack $ show linkAdded),
         ("followed", pack $ show linkFollowed),
         ("checked", pack $ show linkChecked),
         ("description", linkDescription),
         ("url", linkUrl)]

