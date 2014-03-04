{-# LANGUAGE OverloadedStrings #-}

module Main where

import Yesod

import Dispatch ()
import Foundation

main :: IO ()
-- main = warpEnv App
main = warpEnv $ App ["readme.txt", "report.pdf", "music.wav"]

