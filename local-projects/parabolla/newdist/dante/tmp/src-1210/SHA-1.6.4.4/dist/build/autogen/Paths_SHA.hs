{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_SHA (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,6,4,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/bin"
libdir     = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/lib"
dynlibdir  = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/lib"
datadir    = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/share"
libexecdir = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/libexec"
sysconfdir = "/home/truff/.cabal/store/ghc-8.10.4/SHA-1.6.4.4-9da7ab0f8e77ce44848a0027cc62e4ab1d1b58788ae8f08c9dcc8d0208dce020/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "SHA_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "SHA_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "SHA_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "SHA_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "SHA_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "SHA_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
