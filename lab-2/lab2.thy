(*
  Autor: Zenyutkin Nikolay
  Variant: 2 (theorems 3 and 5)
*)

theory lab2
imports Main
begin

 primrec replace :: "'a \<Rightarrow> 'a \<Rightarrow> 'a list \<Rightarrow> 'a list" where
"replace x y [] = []"
| "replace x y (z # zs) = (if z = x then y else z) # (replace x y zs)"

primrec del1 :: "'a \<Rightarrow> 'a list \<Rightarrow> 'a list" where
"del1 x [] = []" |
"del1 x (y # ys) = (if (y = x) then ys else (y # (del1 x ys)))"

primrec delall :: "'a \<Rightarrow> 'a list \<Rightarrow> 'a list" where
"delall x [] = []" |
"delall x (y # ys) = (if (y=x) then (delall x ys) else (y # (delall x ys)))"

(*
  Theoreme 2
  
  delall x (delall x xs) = delall x xs
*)

(*
  Покажите на конкретных значениях, что функции replace, del1 и delall работают
*)

value "replace 1 2 [1, 2, 3, 4]"
value "del1 1 [1,2,3,4]"
value "delall 1 [1, 2, 3, 1, 4] = delall 1 [1, 2, 3, 1, 4]"

(*
  Сформулируйте теорему на естественном языке.

  Двойное удаление всех элементов x из списка xs, равно одинарному удалению всех элементов x из списка xs
*)

(*
  Выделите Базу и Переход, сформулируйте их на естественном языке.

  База: 
    delall x (delall x []) = delall x []"

  Двойное удаление всех элементов x из пустого списка, равно одинарному удалению всех элементов x из пустого списка


  Переход:
    \<And>a list. delall x (delall list) = delall x list \<Longrightarrow> delall x (delall x (a # list)) = delall x (a # list)

    а - элемент списка list. Пусть у нас есть список list длины k. Мы предполагаем, что теорема верна для данного списка list длины k, то
    есть delall x (delall x (a # list)) = delall x (a # list)
*)

(*
  Как База и Переход связаны с определением списка? 

  Тип данных list содержит конструктор — Nil, создающий пустой список. Пустой список используется в базе
  Тип данных list содержит конструктор — Cons, который добавляет новый элемент к уже существующему списку - (a # list)
*)

(*
  Как База и Переход связаны с определениями функций, задействованных в теореме?

  Функция delall используется в базе и переходе
*)


(*
  Если теорема верна, покажите это на конкретных значениях для Базы и Перехода.

  База:  
    delall x (delall x []) = delall  x []

  Переход: 
    \<And>a list. delall x (delall x list) = delall x list \<Longrightarrow> delall x (delall x (a # list)) = delall x (a # list)
*)

value "delall 2 (delall 2 []) = delall 2 []"
value "delall 4 (delall 4 (1 # [4, 3, 4, 6, 4])) = delall 4 (1 # [4, 3, 4, 6, 4])"  

theorem delall_delall [simp]: "delall x (delall x xs) = delall x xs"
apply (induct_tac xs)
apply auto
done

(*
  Theoreme 5

  del1 y (replace x y xs) = del1 x xs
*)

(*
  Покажите на конкретных значениях, что функции replace, del1 и delall работают
*)

value "replace 1 2 [1, 2, 3, 4]"
value "del1 1 [1,2,3,4]"
value "delall 1 [1, 2, 3, 1, 4]"
  
(*
  Сформулируйте теорему на естественном языке.

  Результат удаления первого вхождения элемента y в списке xs,в котором x подмененно y,
  равен результату удаления первого вхождения элемента x в списке xs
*)

 
(*
  Выделите Базу и Переход, сформулируйте их на естественном языке.

  База: 
    del1 y (replace x y []) = del1 x []"

  Результат удаления первого вхождения элемента y в пустом списке,в котором x подмененно y,
  равен результату удаления первого вхождения элемента x в пустом списке


  Переход:
    \<And>a list. del1 y (replace x y list) = del1 x list \<Longrightarrow> del1 y (replace x y (a # list)) = del1 x (a # list)

    а - элемент списка list. Пусть у нас есть список list длины k. Мы предполагаем, что теорема верна для данного списка list длины k, то
    есть del1 y (replace x y (a # list)) = del1 x (a # list)
*)
  

  
(*
  Как База и Переход связаны с определением списка? 

  Тип данных list содержит конструктор — Nil, создающий пустой список. Пустой список используется в базе
  Тип данных list содержит конструктор — Cons, который добавляет новый элемент к уже существующему списку - (a # list)
*)
  

(*
  Как База и Переход связаны с определениями функций, задействованных в теореме?

  Функции del1 и replace используются в базе и переходе
*)


(*
  Если теорема неверна, объясните почему, покажите на конкретных значениях контрпример.
  
  Теорема неверна, но не во всех случаях.

  Неверный случай
*)

value "del1 5 (replace 2 5 [1, 5, 3, 2, 4]) = del1 2 [1, 5, 3, 2, 4]"

(*
  Верный случай
*)

value "del1 5 (replace 2 5 [1, 2, 3, 4, 5]) = del1 2 [1, 2, 3, 4, 5]"

theorem "del1 y (replace x y xs) = del1 x xs"
quickcheck
oops

end
  

  