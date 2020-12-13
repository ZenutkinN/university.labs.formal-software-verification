theory lab4
imports Main
begin

lemma lemma1: "\<lbrakk>A; B\<rbrakk> \<Longrightarrow> A \<and> B" 
proof -
  assume A: "A"
  assume B: "B"
  from A B show "A \<and> B" by (rule conjI)
qed

lemma lemma2: "A \<Longrightarrow> A \<or> B" 
proof -
  assume A: "A"
  from A show  "A \<or> B" by (rule disjI1)
qed

end