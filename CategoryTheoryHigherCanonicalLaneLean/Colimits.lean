import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure CoconeUnder (J C : Type u) [Category J] [Category C] (F : Functor J C) where
  apex : C
  components : ∀ j : J, F.obj j ⟶ apex
  naturality : ∀ {j k : J} (f : j ⟶ k), F.map f ≫ components k = components j

structure ColimitCocone (J C : Type u) [Category J] [Category C] (F : Functor J C) where
  cocone : CoconeUnder F
  universal : ∀ (c : CoconeUnder F), ∃! (f : cocone.apex ⟶ c.apex), ∀ (j : J), cocone.components j ≫ f = c.components j

structure FiniteColimitPackage where
  hasFiniteCoproducts : Prop
  hasCoequalizers : Prop
  hasPushouts : Prop
  hasFiniteColimits : Prop
  finiteCoproductsClosed : hasFiniteCoproducts
  coequalizersClosed : hasCoequalizers
  pushoutsClosed : hasPushouts
  finiteColimitsClosed : hasFiniteColimits

structure ColimitEvidence (P : FiniteColimitPackage) where
  finiteCoproductsClosed : P.hasFiniteCoproducts
  coequalizersClosed : P.hasCoequalizers
  pushoutsClosed : P.hasPushouts
  finiteColimitsClosed : P.hasFiniteColimits

def FiniteColimitsClosed (P : FiniteColimitPackage) : Prop :=
  P.hasFiniteCoproducts ∧ P.hasCoequalizers ∧ P.hasPushouts ∧ P.hasFiniteColimits

theorem finite_colimits_closed_from_evidence (P : FiniteColimitPackage) (E : ColimitEvidence P) :
    FiniteColimitsClosed P := by
  exact And.intro E.finiteCoproductsClosed
    (And.intro E.coequalizersClosed (And.intro E.pushoutsClosed E.finiteColimitsClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse
