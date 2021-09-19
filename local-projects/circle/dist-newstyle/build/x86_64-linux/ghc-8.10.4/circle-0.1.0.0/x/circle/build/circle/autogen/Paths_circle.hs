{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_circle (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/truff/.cache/cabal/bin"
libdir     = "/home/truff/.cache/cabal/lib/x86_64-linux-ghc-8.10.4/circle-0.1.0.0-inplace-circle"
dynlibdir  = "/home/truff/.cache/cabal/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/truff/.cache/cabal/share/x86_64-linux-ghc-8.10.4/circle-0.1.0.0"
libexecdir = "/home/truff/.cache/cabal/libexec/x86_64-linux-ghc-8.10.4/circle-0.1.0.0"
sysconfdir = "/home/truff/.cache/cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "circle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "circle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "circle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "circle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "circle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "circle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
