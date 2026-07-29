import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure AdjointFunctorPair (C D : Type u) [Category.{v} C] [Category.{v} D] where
  left : Functor C D
  right : Functor D C
  unit : 𝟙 C ⟶ right.comp left
  counit : left.comp right ⟶ 𝟙 D
  triangleLeft : (unit ▷ left) ≫ (left ◁ counit) = 𝟙 left
  triangleRight : (right ◁ unit) ≫ (counit ▷ right) = 𝟙 right

structure AdjointFunctorPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  pair : AdjointFunctorPair C D
  leftAdjointExists : Prop
  rightAdjointExists : Prop

structure AdjointFunctorEvidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (P : AdjointFunctorPackage C D) where
  leftAdjointExistsClosed : P.leftAdjointExists
  rightAdjointExistsClosed : P.rightAdjointExists

def AdjointFunctorClosure {C D : Type u} [Category.{v} C] [Category.{v} D]
    (P : AdjointFunctorPackage C D) : Prop :=
  P.leftAdjointExists ∧ P.rightAdjointExists

theorem adjoint_functor_closure_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (P : AdjointFunctorPackage C D) (E : AdjointFunctorEvidence P) :
    AdjointFunctorClosure P := by
  exact And.intro E.leftAdjointExistsClosed E.rightAdjointExistsClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse