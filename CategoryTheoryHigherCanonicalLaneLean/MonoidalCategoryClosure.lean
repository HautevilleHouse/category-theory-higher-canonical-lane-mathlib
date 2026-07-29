import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure MonoidalCategoryData (C : Type u) [Category.{v} C] where
  tensorProduct : Functor (C × C) C
  unitObject : C
  associator : ∀ (X Y Z : C), (tensorProduct.obj (X, tensorProduct.obj (Y, Z))) ≅ tensorProduct.obj (tensorProduct.obj (X, Y), Z)
  leftUnitor : ∀ (X : C), tensorProduct.obj (unitObject, X) ≅ X
  rightUnitor : ∀ (X : C), tensorProduct.obj (X, unitObject) ≅ X
  pentagonCondition : Prop
  triangleCondition : Prop

structure MonoidalCategoryPackage (C : Type u) [Category.{v} C] where
  data : MonoidalCategoryData C
  pentagonHolds : Prop
  triangleHolds : Prop

structure MonoidalCategoryEvidence {C : Type u} [Category.{v} C]
    (P : MonoidalCategoryPackage C) where
  pentagonHoldsClosed : P.pentagonHolds
  triangleHoldsClosed : P.triangleHolds

def MonoidalCategoryClosure {C : Type u} [Category.{v} C]
    (P : MonoidalCategoryPackage C) : Prop :=
  P.pentagonHolds ∧ P.triangleHolds

theorem monoidal_category_closure_from_evidence {C : Type u} [Category.{v} C]
    (P : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence P) :
    MonoidalCategoryClosure P := by
  exact And.intro E.pentagonHoldsClosed E.triangleHoldsClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse