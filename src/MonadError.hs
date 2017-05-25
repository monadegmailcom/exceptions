{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}

module MonadError (errorHead) where

import Control.Monad.Except      ( MonadError, throwError )

errorHead :: MonadError String m => [a] -> m a
errorHead = \case
  []    -> throwError "empty list"
  (x:_) -> return x

