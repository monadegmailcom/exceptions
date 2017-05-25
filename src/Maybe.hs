{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}

module Maybe ( head
             ) where

import MonadError

import Prelude                    hiding (head)

-- partial functions are surprising for the caller and should be
-- avoided
partialHead :: [a] -> a
partialHead = \case
  []    -> error "no head"
  (x:_) -> x

-- the maybe monad is a simple way to handle exceptional situations
-- when you do no want to return additional information on failure
head :: [a] -> Maybe a
head = \case
  []    -> Nothing
  (x:_) -> Just x

-- do-notation is convenient for exception-style programming
twoHeads :: [a] -> [a] -> Maybe (a,a)
twoHeads xs ys = do
  x <- head xs
  y <- head ys
  return (x,y)

maybeHead :: [a] -> Maybe a
maybeHead = eitherToMaybe . errorHead

eitherToMaybe :: Either e a -> Maybe a
eitherToMaybe = \case
  Left _  -> Nothing
  Right x -> Just x
