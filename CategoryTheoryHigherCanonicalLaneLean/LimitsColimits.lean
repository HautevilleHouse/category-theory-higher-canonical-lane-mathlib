import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Diagram where
  shape : Type u
  objects : shape → Type u
  morphisms : (i j : shape) → (objects i → objects j)

structure Cone (D : Diagram) where
  apex : Type u
  projection : (i : D.shape) → apex → D.objects i
  commuting : (i j : D.shape) → (proj j) = (D.morphisms i j) ∘ (proj i)

structure Limit (D : Diagram) where
  cone : Cone D
  universalProperty : ∀ (C : Cone D), ∃! morphism : C.apex → cone.apex, True
  universalPropertyTerm : universalProperty

structure LimitsPackage (L : Limit) where
  limitPreservingFunctor : Prop
  completeness : Prop
  limitPreservingClosed : limitPreservingFunctor
  completenessClosed : completeness

structure LimitsEvidence (L : Limit) (P : LimitsPackage L) where
  limitPreservingTerm : P.limitPreservingFunctor
  completenessTerm : P.completeness

def LimitsClosed (L : Limit) (P : LimitsPackage L) : Prop :=
  P.limitPreservingFunctor ∧ P.completeness

theorem limits_closed_from_evidence (L : Limit) (P : LimitsPackage L) (E : LimitsEvidence L P) :
    LimitsClosed L P := And.intro E.limitPreservingTerm E.completenessTerm

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse