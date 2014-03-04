module Main where

import Yesod

import Dispatch ()
import Foundation

main :: IO ()
main = warpEnv App
