{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_a03_calculator (
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

bindir     = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\bin"
libdir     = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\lib\\x86_64-windows-ghc-8.2.2\\a03-calculator-0.1.0.0-HaSFE1sZgR19STnz4T1Uoe"
dynlibdir  = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\share\\x86_64-windows-ghc-8.2.2\\a03-calculator-0.1.0.0"
libexecdir = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\libexec\\x86_64-windows-ghc-8.2.2\\a03-calculator-0.1.0.0"
sysconfdir = "C:\\Users\\Jeremy\\Desktop\\a03-calculator\\.stack-work\\install\\ccbce92a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "a03_calculator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "a03_calculator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "a03_calculator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "a03_calculator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "a03_calculator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "a03_calculator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
