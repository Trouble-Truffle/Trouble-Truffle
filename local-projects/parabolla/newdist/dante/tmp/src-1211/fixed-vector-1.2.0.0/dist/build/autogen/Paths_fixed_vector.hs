{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_fixed_vector (
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
version = Version [1,2,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/bin"
libdir     = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/lib"
dynlibdir  = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/lib"
datadir    = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/share"
libexecdir = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/libexec"
sysconfdir = "/home/truff/.cabal/store/ghc-8.10.4/fixed-vector-1.2.0.0-2f414660522797212d6b68f0548301af07ce353a7554a674bc6c184c5733aa9e/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fixed_vector_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fixed_vector_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fixed_vector_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fixed_vector_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fixed_vector_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fixed_vector_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
