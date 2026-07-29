import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure MonoidalCategoryData (C : Type u) [Category.{v} C] where
  tensorProduct : C ⥤ C ⥤ C
  unitObject : C
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  coherenceConditions : Prop

structure MonoidalCategoryEvidence (C : Type u) [Category.{v} C] (M : MonoidalCategoryData C) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  coherenceClosed : M.coherenceConditions

def MonoidalCategoryClosed {C : Type u} [Category.{v} C] (M : MonoidalCategoryData C) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.coherenceConditions

theorem monoidal_category_closed_from_evidence {C : Type u} [Category.{v} C]
    (M : MonoidalCategoryData C) (E : MonoidalCategoryEvidence C M) : MonoidalCategoryClosed M :=
  And.intro E.associatorClosed (And.intro E.leftUnitorClosed (And.intro E.rightUnitorClosed E.coherenceClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse