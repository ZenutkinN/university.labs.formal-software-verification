{-# LANGUAGE EmptyDataDecls, RankNTypes, ScopedTypeVariables #-}

module Lab3(List(..), del1, delall, replace) where {

import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),
  (>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Eq,
  error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,
  zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,
  String, Bool(True, False), Maybe(Nothing, Just));
import qualified Prelude;

data List a = Nil | Cons a (List a);

replace :: forall a. (Eq a) => a -> a -> List a -> List a;
replace x y Nil = Nil;
replace x y (Cons z zs) = Cons (if z == x then y else z) (replace x y zs);

del1 :: forall a. (Eq a) => a -> List a -> List a;
del1 x Nil = Nil;
del1 x (Cons y ys) = (if y == x then ys else Cons y (del1 x ys));

delall :: forall a. (Eq a) => a -> List a -> List a;
delall x Nil = Nil;
delall x (Cons y ys) = (if y == x then (delall x ys) else Cons y (delall x ys));
}
