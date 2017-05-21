module Maybe (spec) where

import Test.Hspec

spec :: Spec
spec =
  describe "" $
    it "" $ True `shouldBe` True
