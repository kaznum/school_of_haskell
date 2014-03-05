{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Concurrent.STM
import Yesod

import Dispatch ()
import Foundation

main :: IO ()
main = do
  tstore <- atomically $ newTVar []
  tident <- atomically $ newTVar 0
  warpEnv $ App tident tstore
