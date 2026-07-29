import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Cocone (J C : Type u) [Category.{v} J] [Category.{v} C] (F : J ⥤ C) where
  apex : C
  components : (j : J) → F.obj j ⟶ apex
  naturality : Prop

structure Colimit (J C : Type u) [Category.{v} J] [Category.{v} C] (F : J ⥤ C) where
  cocone : Cocone J C F
  universalProperty : Prop
  universalPropertyProof : universalProperty

structure ColimitEvidence (J C : Type u) [Category.{v} J] [Category.{v} C] {F : J ⥤ C} (Col : Colimit J C F) where
  universalPropertyClosed : Col.universalProperty
  naturalityClosed : Col.cocone.naturality

def ColimitClosed {J C : Type u} [Category.{v} J] [Category.{v} C] {F : J ⥤ C} (Col : Colimit J C F) : Prop :=
  Col.universalProperty ∧ Col.cocone.naturality

theorem colimit_closed_from_evidence {J C : Type u} [Category.{v} J] [Category.{v} C] {F : J ⥤ C}
    (Col : Colimit J C F) (E : ColimitEvidence J C Col) : ColimitClosed Col :=
  And.intro E.universalPropertyClosed E.naturalityClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse