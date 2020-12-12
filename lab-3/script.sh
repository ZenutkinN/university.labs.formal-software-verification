#!/bin/bash
# author: Nikolay Zenyutkin
echo "
:load driver.hs
\"################ START ##################\"
\"the original lists are:\"
l0
l1
l2
l3
l4
\"Deleting a list item\"
\"del1 1 l0\"
del1 1 l0
\"del1 1 l2\"
del1 1 l2
\"Replacing a list item\"
\"replace 1 2 l4\"
replace 1 2 l4
\"--------------------------------------------------------------------\"
\"Variant 2, theorems 2 and 5\"
\"--------------------------------------------------------------------\"
\"=====================================================================\"
\" Mathematical PROOF BY INDUCTION for the following theorem: \"
\" delall x (delall x xs) = delall x xs \"
\" Isabelle automatically generates 2 subgoals which are \"
\"--------------------------------------------------------------------\"
\" # BASE ... \"
\" First goal is a BASE of the induction:\"
\" 1.  delall x (delall x []) = delall x [] \"
\" we can check whether is it a case with haskell by: \"
\"  delall 1 (delall 1 Nil) = delall 1 (delall 1 Nil) \"
\" which is: \"
delall 1 (delall 1 Nil) == delall 1 Nil
\"--------------------------------------------------------------------\"
\" # ... and INDUCTIVE STEP \"
\" Second goal is an INDUCTIVE STEP:\"
\" 2. !! a list. delall x (delall list) = delall x list ==> delall x (delall x (a # list)) = delall x (a # list) \"
\" first part of the second goal is an INDUCTIVE HYPOTHESIS: \"
\" !! a list. delall x (delall list) = delall x list\"
\" we expand it with fixed-length list l2\"
\" delall 2 (delall 2 l4) = delall 2 l4\"
\" the result is: \"
delall 2 (delall 2 l4) == delall 2 l4
\" futher, we demonstrate that INDUCTUVE STEP ITSELF is true: \"
\" delall x (delall x (a # list)) = delall x (a # list) \"
\" with list produced from l2 by adding single element\"
\" delall 2 (delall 2 (2 # l4)) = delall 2 (2 # l4) \"
\" we can see that it is indeed true: \"
delall 2 (delall 2 (Cons 2 l4)) == delall 2 (Cons 2 l4)
\"####\"
\"=====================================================================\"
\" Mathematical PROOF BY INDUCTION for the following theorem: \"
\"del1 y (replace x y xs) = del1 x x\"
\" Isabelle automatically generates 2 subgoals which are \"
\"--------------------------------------------------------------------\"
\" # BASE ... \"
\" First goal is a BASE of the induction:\"
\" 1. del1 y (replace x y []) = del1 x [] \"
\" we can check whether is it a case with haskell by: \"
\" del1 2 (replace 1 2 Nil) == del1 1 Nil\"
\" which is: \"
del1 2 (replace 1 2 Nil) == del1 1 Nil
\"--------------------------------------------------------------------\"
\" # ... and INDUCTIVE STEP \"
\" Second goal is an INDUCTIVE STEP:\"
\" 2. !! a list. del1 y (replace x y list) = del1 x list ==> del1 y (replace x y (a # list)) = del1 x (a # list) \"
\" first part of the second goal is an INDUCTIVE HYPOTHESIS: \"
\" !! a list.  del1 y (replace x y list) = del1 x list\"
\" we expand it with fixed-length list l1\"
\"del1 1 (replace 1 2 l1) == del1 2 l1\"
\" the result is: \"
del1 1 (replace 1 2 l1) == del1 2 l1
\" futher, we demonstrate that INDUCTUVE STEP ITSELF is false: \"
\" del1 y (replace x y (a # list)) = del1 x (a # list) \"
\" with list produced from l1 by adding single element\"
\" del1 1 (replace 1 2 (Cons 6 l1)) == del1 2 (Cons 6 l1) \"
\" we can see that it is indeed false: \"
del1 1 (replace 1 2 (Cons 6 l1)) == del1 2 (Cons 6 l1)
\"####\"
\"################ END ##################\"
:quit
" | ghci