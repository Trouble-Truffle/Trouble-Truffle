{-# LANGUAGE OverloadedStrings #-}
import Reanimate
import Graphics.SvgTree hiding (Text)
import Reanimate.Builtin.Documentation
import Reanimate.Scene
-- animation :: Animation
-- animation = env $ scene $ do



-- env :: Animation -> Animation
-- env = addStatic bg

-- bg :: SVG
-- bg = mkBackground "lightblue"

main :: IO ()
main = reanimate $ do
  playThenReverseA $ staticFrame 1 (scale 3 $ center $ latexAlign "E = mc^2")
