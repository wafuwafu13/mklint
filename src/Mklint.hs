{-# LANGUAGE OverloadedStrings #-}
module Mklint where

import TOML.Decode (DecodeTOML, tomlDecoder, getField, decodeFile)

data MyConfig = MyConfig
  { field1 :: Int
  , field2 :: Bool
  } deriving (Show)

instance DecodeTOML MyConfig where
  tomlDecoder =
    MyConfig
      <$> getField "field1"
      <*> getField "field2"

main :: IO ()
main = do
  result <- decodeFile "/Users/wafuwafu13/Desktop/mklint/example/foo.toml"
  case result of
    Right cfg -> print (cfg :: MyConfig)
    Left e -> print e
