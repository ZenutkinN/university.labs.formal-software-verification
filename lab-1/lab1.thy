(*
  Autor: Zenyutkin Nikolay
  Variant: 2 (110101)
*)

theory lab1
imports Main
begin

(* 
  Task: 1
  Объявить термы при
  помощи команды term,
  указать их тип, сопроводить
  ответ нужными
  комментариями
*)

(*переменная x типа nat*)
term "x::nat" (*Указываем, что 'x' натуральное число*)

(*2 + 2, где оба числа — nat*)
term "(2::nat) + (2::nat)" (*Указываем, что идет сложение двух натуральных чисел*)

(*
  Task: 2
  Проверить, являются ли
  данные выражения хорошо
  типизированными, если нет, логическое отрицание нуля;
  деление переменной x на
  ноль. логическое И нуля и
  единицы;
  декремент переменной x.
  7то почему? Имеют ли они
  смысл?
*)

(*логическое И нуля и единицы*)
term "true \<and> false::bool" (*В Isabelle мы не можем применять логические операторы к натуральным числам*)

(*декремент переменной x*)
term "(x::nat) - 1" (*тип переменной 'x' явно указанн*)


(*
  Task: 3
  Найти значения выражений 
  при помощи команды value. 
  Что служит результатом,
  почему?
   Каков тип
  результата? Можно ли
  продолжить вычисления?
*)

(*Разность 42 и 28*)
value "42 - 28" 
(*В качестве типа результата  выступает переменная 'a. В место нее можно подставить любой конкретный тип*)
(*Вычисления можно продолжить выполнив преобразованик к типу int*)

(*Тоже выражение, но теперь обе константы имеют тип nat.*)
value "(42::nat) - (28::nat)"
(*В качестве типа результата  выступает nat. *)
(*Вычисления можно продолжить выполнив преобразованик к типу int*)

(*
  Task: 4
  Представить выражения в
  виде дерева.
  Можно ли провести
  вычисления параллельно?
  Если да, раскрасьте
  поддеревья с независимыми
  подвыражениями в разные
  цвета. Как бы вы описали
  алгоритм выбора поддеревьев
  для параллель
*)

value "(17 - (p + 42))/(q - 28)" (*Смотреть README.md*)
value "g 20"(*Смотреть README.md*)

(*
  Task: 5
  Записать указанные числа
  через 0 и Suc, вычислить
  значения составленных из
  них выражений при помощи value
*)

value "(2::nat) + (3::nat)" (*Смотреть README.md*)
value "(2::nat) * (3::nat)" (*Смотреть README.md*)

(*
  Task: 6 
  Записать выражение
  g(y) = y + y
  в виде лямбда-функций, вычислить
  их значения для указанных
  аргументов при помощи
  value. Что служит
  результами, почему? Каков
  тип результатов?
*)

(*g(2), где 2 — nat *)
value "(\<lambda>y. y + y)2::nat" (*результат суммы натуральных чисел (двух двоек) равен 4 *)

(*g(p)*)
value "(\<lambda>y. y + y)p" (*сумма двух переменных неизвестного типа, в результате получам переменную в которую можно подставить любой тип*)

(*g(r + 1)*)
value "(\<lambda>y. y + y)(r+1)" (*переменная 'r' может принимать любой тип, поэтому и результат суммы - переменная любого типа*)

end