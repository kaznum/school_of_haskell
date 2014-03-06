{-# LANGUAGE QuasiQuotes, TypeFamilies, GeneralizedNewtypeDeriving, TemplateHaskell,
    OverloadedStrings, GADTs, FlexibleContexts, ScopedTypeVariables #-}

import Database.Persist
import Database.Persist.Postgresql
import Database.Persist.TH
import Control.Monad.IO.Class (liftIO)
import Data.Time (UTCTime)
import Data.Text (Text)

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
  flip runSqlPersistMPool pool $ do
    printMigration migrateAll
    res :: [Entity Link] <- selectList [] [LimitTo 1]
    liftIO $ print res

