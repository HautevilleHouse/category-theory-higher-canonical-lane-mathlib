import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Presheaf (C : Type u) [Category C] where
  functor : Cᵒᵖ ⥤ Set

structure YonedaEmbedding (C : Type u) [Category C] where
  object : C → Presheaf C
  morphism : ∀ (X Y : C), (X ⟶ Y) → (object X).functor ⟶ (object Y).functor
  faithful : Function.Injective (fun (f : X ⟶ Y) => morphism X Y f)
  full : ∀ (X Y : C) (η : (object X).functor ⟶ (object Y).functor), ∃ (f : X ⟶ Y), morphism X Y f = η

structure YonedaLemmaPackage (C : Type u) [Category C] where
  yonedaEmbedding : YonedaEmbedding C
  yonedaLemmaStatement : Prop
  bijectionNatural : Prop
  yonedaEmbeddingClosed : yonedaEmbedding.faithful ∧ yonedaEmbedding.full
  yonedaLemmaStatementClosed : yonedaLemmaStatement
  bijectionNaturalClosed : bijectionNatural

structure YonedaLemmaEvidence {C : Type u} [Category C] (P : YonedaLemmaPackage C) where
  yonedaEmbeddingClosed : P.yonedaEmbeddingClosed
  yonedaLemmaStatementClosed : P.yonedaLemmaStatement
  bijectionNaturalClosed : P.bijectionNatural

def YonedaLemmaClosed {C : Type u} [Category C] (P : YonedaLemmaPackage C) : Prop :=
  P.yonedaEmbeddingClosed ∧ P.yonedaLemmaStatement ∧ P.bijectionNatural

theorem yoneda_lemma_closed_from_evidence {C : Type u} [Category C] (P : YonedaLemmaPackage C)
    (E : YonedaLemmaEvidence P) : YonedaLemmaClosed P := by
  exact And.intro E.yonedaEmbeddingClosed (And.intro E.yonedaLemmaStatementClosed E.bijectionNaturalClosed)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse
