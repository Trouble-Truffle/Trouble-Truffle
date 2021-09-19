{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_fingertree (
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
version = Version [0,1,4,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/bin"
libdir     = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/lib"
dynlibdir  = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/lib"
datadir    = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/share"
libexecdir = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/libexec"
sysconfdir = "/home/truff/.cabal/store/ghc-8.10.4/fingertree-0.1.4.2-da3cf68af0b4b60b840596aaee5859acf84a14bfd06ec89232641aaabd1be4bc/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fingertree_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fingertree_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fingertree_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fingertree_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fingertree_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fingertree_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
