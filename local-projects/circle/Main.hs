{-# LANGUAGE TypeOperators #-}

import System.Console.Terminal.Size
import Data.Maybe
import System.Sleep
import qualified Data.Array.Repa as ARR
-- ┌┐└┘─
--[Arg Array] -> Argument

parseArgs :: [String] -> String -> [(String,String)]
parseArgs argList argType = foldr ( (:) . (\x -> (take (length argType) x, drop (length argType) x)) )
                            [] $ (\x -> filter ((==argType).take 2) x) argList


termHeight :: Integral b => IO b
termHeight = size >>= \x -> return . height $ fromJust x

termWidth :: Integral b => IO b
termWidth = size >>= \x -> return . width $ fromJust x


screenArr :: IO(ARR.Array ARR.U ARR.DIM2 Int )
screenArr  = termHeight >>= \y -> termWidth >>= \x -> return
              $ ARR.fromListUnboxed ( ARR.Z ARR.:. (y::Int) ARR.:. (x::Int) ) [0..(x*y-1)]

screenFunc :: (t1 -> t2 -> Char) -> (Int -> t1) -> (Int -> t2 ) -> IO(ARR.Array ARR.U ARR.DIM2 Char)
screenFunc mainFunc funcX funcY = screenArr >>= \arr ->
                                  ARR.computeP $ ARR.traverse arr id
                                    (\_ (ARR.Z ARR.:. i ARR.:. j ) ->
                                        mainFunc (funcX j) (funcY i) ) :: IO(ARR.Array ARR.U ARR.DIM2 Char)


arr2Di :: IO(ARR.Array ARR.U (( ARR.Z ARR.:. Int ) ARR.:. Int ) Int ) -> Int -> Int -> IO Int
arr2Di arr i j = arr >>= \func -> return $ func ARR.! (ARR.Z ARR.:. i ARR.:. j)


-- mkBorder :: IO(ARR.Array ARR.U ARR.DIM2 Char)
-- mkBorder =  termWidth >>= \widthT -> termHeight >>= \heightT -> return $
--             screenFunc

main :: IO()
main = do
  putStrLn "----Press Any Key to Start----"
  putStrLn "-----Program has finished-----"
