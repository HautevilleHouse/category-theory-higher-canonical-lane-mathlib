import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure LimitCone (J C : Type u) [Category.{v} J] [Category.{v} C]
    (F : Functor J C) where
  cone : Cone F
  universalProperty : ∀ (c : Cone F), ∃! (m : c.X ⟶ cone.X), c.π = cone.π ≫ (m ◁ F)

structure ColimitCocone (J C : Type u) [Category.{v} J] [Category.{v} C]
    (F : Functor J C) where
  cocone : Cocone F
  universalProperty : ∀ (c : Cocone F), ∃! (m : cocone.X ⟶ c.X), c.ι = (m ◁ F) ≫ cocone.ι

structure LimitColimitPackage (C : Type u) [Category.{v} C] where
  hasLimits : HasLimits C
  hasColimits : HasColimits C
  limitConstruction : Prop
  colimitConstruction : Prop

structure LimitColimitEvidence {C : Type u} [Category.{v} C]
    (P : LimitColimitPackage C) where
  limitConstructionClosed : P.limitConstruction
  colimitConstructionClosed : P.colimitConstruction

def LimitColimitClosure {C : Type u} [Category.{v} C]
    (P : LimitColimitPackage C) : Prop :=
  P.limitConstruction ∧ P.colimitConstruction

theorem limit_colimit_closure_from_evidence {C : Type u} [Category.{v} C]
    (P : LimitColimitPackage C) (E : LimitColimitEvidence P) :
    LimitColimitClosure P := by
  exact And.intro E.limitConstructionClosed E.colimitConstructionClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse