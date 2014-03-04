{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Concurrent.STM
import Yesod

import Dispatch ()
import Foundation

main :: IO ()
main = do
  tfilenames <- atomically $ newTVar ["readme.txt", "report.pdf", "music.wav"]
  warpEnv $ App tfilenames


