import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Cone (J C : Type u) [Category.{v} J] [Category.{v} C] (F : J ⥤ C) where
  apex : C
  components : (j : J) → apex ⟶ F.obj j
  naturality : Prop

structure Limit (J C : Type u) [Category.{v} J] [Category.{v} C] (F : J ⥤ C) where
  cone : Cone J C F
  universalProperty : Prop
  universalPropertyProof : universalProperty

structure LimitEvidence (J C : Type u) [Category.{v} J] [Category.{v} C] {F : J ⥤ C} (L : Limit J C F) where
  universalPropertyClosed : L.universalProperty
  naturalityClosed : L.cone.naturality

def LimitClosed {J C : Type u} [Category.{v} J] [Category.{v} C] {F : J ⥤ C} (L : Limit J C F) : Prop :=
  L.universalProperty ∧ L.cone.naturality

theorem limit_closed_from_evidence {J C : Type u} [Category.{v} J] [Category.{v} C] {F : J ⥤ C}
    (L : Limit J C F) (E : LimitEvidence J C L) : LimitClosed L :=
  And.intro E.universalPropertyClosed E.naturalityClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse