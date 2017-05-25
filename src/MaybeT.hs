module MaybeT where

import Control.Monad.Trans.Maybe ( MaybeT(..), runMaybeT )

import Maybe

-- you may use transformer stack to use other monads like IO
io :: IO (Maybe Char)
io = runMaybeT . MaybeT $ do
  yz <- getLine -- IO operation
  return . Maybe.head $ yz -- exceptional operation
