{-# LANGUAGE TypeOperators #-}

import qualified Data.Array.Repa as Repa
import System.Console.Terminal.Size
import System.Console.ANSI
import Data.Maybe
-- ┌┐└┘─
--[Arg Array] -> Argument

-- parseArgs :: [String] -> String -> [(String,String)]
-- parseArgs argList argType = foldr ( (:) . (\x -> (take (length argType) x, drop (length argType) x)) )
--                             [] $ (\x -> filter ((==argType).take 2) x) argList


termHeight :: Integral b => IO b
termHeight = size >>= \x -> return . height $ fromJust x

termWidth :: Integral b => IO b
termWidth = size >>= \x -> return . width $ fromJust x


screenArr :: IO(Repa.Array Repa.U Repa.DIM2 Int )
screenArr  = termHeight >>= \y -> termWidth >>= \x -> return
              $ Repa.fromListUnboxed ( Repa.Z Repa.:. (y::Int) Repa.:. (x::Int) ) [0..(x*y-1)]

screenFunc ::  ( Int -> Int -> Char ) -> IO(Repa.Array Repa.U Repa.DIM2 Char)
screenFunc mainFunc = screenArr >>= \arr ->
                        Repa.computeP $ Repa.traverse arr id
                          (\_ (Repa.Z Repa.:. i Repa.:. j ) ->
                              mainFunc i j ) :: IO(Repa.Array Repa.U Repa.DIM2 Char)

screenBorder :: IO (Repa.Array Repa.U Repa.DIM2 Char)
screenBorder =  termHeight >>= \height_ -> termWidth >>= \width_ ->
            screenFunc (\i -> \j ->
                if i == 0 || i == height_-1 || j == 0 || j == width_-1
                  then  '.' else ' ')

screenCircle :: Integer -> Integer -> IO(Repa.Array Repa.U Repa.DIM2 Char)
screenCircle circX circY = screenFunc(\i -> \j ->
                            if j == (fromInteger circX ) && i == (fromInteger circY )
                              then 'O' else ' ')

-- addArrs :: IO(Repa.Array Repa.U Repa.DIM2 Char) -> IO(Repa.Array Repa.U Repa.DIM2 Char) -> IO(Repa.Array Repa.U Repa.DIM2 Char)
-- addArrs arrB arrT = arrB >>= \arr1 -> arrT >>= \arr2 ->
--                 Repa.computeP $ Repa.traverse arr1 id (\_ (Repa.Z Repa.:. i Repa.:. j) ->
--                                     Repa.traverse arr2 id (\_ (Repa.Z Repa.:. k Repa.:. l) ->
--                                            if i == ' ' then k else
--                                            if j == ' ' then l else
--                                            if i == k   then k else
--                                            if j == l   then l else '@'
--                                            ) ::IO(Repa.Array Repa.U Repa.DIM2 Char)) :: IO(Repa.Array Repa.U Repa.DIM2 Char)

screen2Di :: IO(Repa.Array Repa.U (( Repa.Z Repa.:. Int ) Repa.:. Int ) Char ) -> Integer -> Integer -> IO Char
screen2Di arr i j = arr >>= \func -> return $ func Repa.! (Repa.Z Repa.:. (fromInteger i ) Repa.:. (fromInteger j) )

repeatFunc :: (Floating a, RealFrac a) => a -> IO()
repeatFunc i = do
   scrX <- termWidth
   scrY <- termHeight
   let curSinLoc = abs $ round $ (sin i) * (fromInteger scrX)
   let curCosLoc = abs $ round $ (cos i) * (fromInteger scrY)
   circle <- screenCircle curSinLoc curCosLoc
   print circle
   print curSinLoc
   print curCosLoc
   clearScreen
   repeatFunc (i+0.05)

main :: IO()
main = do
  repeatFunc 0
  putStrLn "-----Program has finished-----"
