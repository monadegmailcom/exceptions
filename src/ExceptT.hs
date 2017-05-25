module ExceptT where

import Control.Monad.Except     (ExceptT(..), runExceptT)

import MonadError
import Either

exceptTHead :: Monad m => [a] -> ExceptT String m a
exceptTHead = errorHead

io :: IO (Either String Char)
io = runExceptT . ExceptT $ do
  yz <- getLine -- IO operations
  return . Either.head $ yz

