import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Adjunction (C D : Type u) [Category C] [Category D] (F : C ⥤ D) (G : D ⥤ C) where
  unit : 𝟭 C ⟶ F ⋙ G
  counit : G ⋙ F ⟶ 𝟭 D
  triangleLeft : ∀ (c : C), (F.map (unit.app c)) ≫ (counit.app (F.obj c)) = 𝟙 (F.obj c)
  triangleRight : ∀ (d : D), (unit.app (G.obj d)) ≫ (G.map (counit.app d)) = 𝟙 (G.obj d)

structure AdjunctionPackage where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  adjunctionConstructed : Prop
  leftAdjointClosed : leftAdjointExists
  rightAdjointClosed : rightAdjointExists
  adjunctionClosed : adjunctionConstructed

structure AdjunctionEvidence (P : AdjunctionPackage) where
  leftAdjointClosed : P.leftAdjointExists
  rightAdjointClosed : P.rightAdjointExists
  adjunctionClosed : P.adjunctionConstructed

def AdjunctionClosed (P : AdjunctionPackage) : Prop :=
  P.leftAdjointExists ∧ P.rightAdjointExists ∧ P.adjunctionConstructed

theorem adjunction_closed_from_evidence (P : AdjunctionPackage) (E : AdjunctionEvidence P) :
    AdjunctionClosed P := by
  exact And.intro E.leftAdjointClosed (And.intro E.rightAdjointClosed E.adjunctionClosed)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse
