import Lab3 (List(..), del1, delall, replace)

instance (Show a) => Show (List a) where
  show Nil = "[]"
  show (Cons x xs) = show x ++ "#" ++ (show xs)

instance (Eq a) => Eq (List a) where
  Nil == Nil = True
  (Cons x xs) == Nil = False
  Nil == (Cons y ys) = False
  (Cons x xs) == (Cons y ys) = (x == y) && (xs == ys)

l0 = Nil
l1 = Cons 1 Nil
l2 = Cons 2 l1
l3 = Cons 3 l2
l4 = Cons 4 l3