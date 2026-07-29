import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure YonedaEmbedding (C : Type u) [Category.{v} C] where
  yonedaFunctor : Functor C (Presheaf C)
  fullyFaithful : FullyFaithful yonedaFunctor

structure YonedaLemmaPackage (C : Type u) [Category.{v} C] where
  embedding : YonedaEmbedding C
  yonedaLemmaStatement : Prop
  naturalIsoExists : Prop

structure YonedaLemmaEvidence {C : Type u} [Category.{v} C]
    (P : YonedaLemmaPackage C) where
  yonedaLemmaStatementClosed : P.yonedaLemmaStatement
  naturalIsoExistsClosed : P.naturalIsoExists

def YonedaLemmaClosure {C : Type u} [Category.{v} C]
    (P : YonedaLemmaPackage C) : Prop :=
  P.yonedaLemmaStatement ∧ P.naturalIsoExists

theorem yoneda_lemma_closure_from_evidence {C : Type u} [Category.{v} C]
    (P : YonedaLemmaPackage C) (E : YonedaLemmaEvidence P) :
    YonedaLemmaClosure P := by
  exact And.intro E.yonedaLemmaStatementClosed E.naturalIsoExistsClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse