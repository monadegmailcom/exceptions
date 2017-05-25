module Either (head) where

import MonadError

import Prelude hiding (head)

head :: [a] -> Either String a
head = errorHead
