module Data.BigNum where

import Prelude
import Data.Maybe
import Data.Function

-- | An arbitrary length number.
foreign import data BigNum :: *

instance showBigNum :: Show BigNum where
  show x = "BigNum: " ++ toString x

foreign import fromStringPrime :: Int -> String -> BigNum
foreign import fromInt :: Int -> BigNum
foreign import fromArray :: Array Int -> BigNum

fromString :: String -> BigNum
fromString = fromStringPrime 10

fromHexString :: String -> BigNum
fromHexString = fromStringPrime 16

fromBinaryString :: String -> BigNum
fromBinaryString = fromStringPrime 2

-- | FFI wrapper to convert a BigNum to a Number
foreign import toNumberPrime :: forall a.  Fn3 (a -> Maybe a)
                             (Maybe a) BigNum (Maybe Int)

toNumber :: BigNum -> Maybe Int
toNumber = runFn3 toNumberPrime Just Nothing

-- | Utils
foreign import toString :: BigNum -> String
foreign import toHexString :: BigNum -> String
foreign import toBinaryString :: BigNum -> String
foreign import toArray    :: BigNum -> Array Int

foreign import bnClone    :: BigNum -> BigNum
foreign import bitLength  :: BigNum -> Int
foreign import zeroBits   :: BigNum -> Int
foreign import byteLength :: BigNum -> Int
foreign import isNeg      :: BigNum -> Boolean
foreign import isEven     :: BigNum -> Boolean
foreign import isOdd      :: BigNum -> Boolean
foreign import isZero     :: BigNum -> Boolean
foreign import cmp        :: BigNum -> Int

-- | Arithmetics
foreign import neg   :: BigNum -> BigNum
foreign import abs   :: BigNum -> BigNum
foreign import sqr   :: BigNum -> BigNum
foreign import pow   :: BigNum -> Int -> BigNum
foreign import bnAdd :: BigNum -> BigNum -> BigNum
foreign import bnSub :: BigNum -> BigNum -> BigNum
foreign import bnMul :: BigNum -> BigNum -> BigNum
foreign import bnMod :: BigNum -> BigNum -> BigNum

-- | Division is unsafe!
foreign import bnDiv :: BigNum -> BigNum -> BigNum
foreign import bnDivRound :: BigNum -> BigNum -> BigNum

-- | Safe division
foreign import bnSafeDivPrime :: forall a. Fn4 (a -> Maybe a) (Maybe a)
                                 BigNum BigNum (Maybe BigNum)
bnSafeDiv :: BigNum -> BigNum -> Maybe BigNum
bnSafeDiv = runFn4 bnSafeDivPrime Just Nothing

-- | Bit Operations
foreign import bnOrPrime :: forall a.  Fn4 (a -> Maybe a) (Maybe a)
                            BigNum BigNum (Maybe BigNum)
foreign import bnAndPrime :: forall a.  Fn4 (a -> Maybe a) (Maybe a)
                            BigNum BigNum (Maybe BigNum)
foreign import bnXorPrime :: forall a.  Fn4 (a -> Maybe a) (Maybe a)
                            BigNum BigNum (Maybe BigNum)
bnOr :: BigNum -> BigNum -> Maybe BigNum
bnOr = runFn4 bnOrPrime Just Nothing

bnAnd :: BigNum -> BigNum -> Maybe BigNum
bnAnd = runFn4 bnAndPrime Just Nothing

bnXor :: BigNum -> BigNum -> Maybe BigNum
bnXor = runFn4 bnXorPrime Just Nothing

foreign import bnSetn :: BigNum -> BigNum -> BigNum
foreign import bnShln :: BigNum -> BigNum -> BigNum
foreign import bnShrn :: BigNum -> BigNum -> BigNum
foreign import bnTestn :: BigNum -> Int -> Boolean
foreign import bnMaskn :: BigNum -> Int -> BigNum
foreign import bnBincn :: BigNum -> Int -> BigNum
foreign import bnBnotn :: BigNum -> Int -> BigNum

-- | Reduction

foreign import bnGcd :: BigNum -> BigNum -> BigNum
foreign import bnEgcd :: BigNum -> BigNum -> BigNum
foreign import bnInvm :: BigNum -> BigNum -> BigNum

instance semiringBigNum :: Semiring BigNum where
  add  = bnAdd
  zero = fromInt 0
  mul  = bnMul
  one  = fromInt 1

instance moduloSemiringBigNum :: ModuloSemiring BigNum where
  div = bnDiv
  mod = bnMod
