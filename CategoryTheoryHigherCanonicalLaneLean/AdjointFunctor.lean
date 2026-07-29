import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category.{v} C] [Category.{v} D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  unit : 𝟭 C ⟶ leftAdjoint ⋙ rightAdjoint
  counit : rightAdjoint ⋙ leftAdjoint ⟶ 𝟭 D
  triangleIdentities : Prop

structure AdjointFunctorData (C D : Type u) [Category.{v} C] [Category.{v} D] where
  adjointPair : AdjointPair C D
  existenceProof : adjointPair.unit ∘ adjointPair.counit = 𝟙 _

def AdjointFunctorClosed {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorData C D) : Prop :=
  A.adjointPair.triangleIdentities

structure AdjointFunctorEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorData C D) where
  triangleIdentitiesClosed : A.adjointPair.triangleIdentities

theorem adjoint_functor_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (A : AdjointFunctorData C D) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A :=
  E.triangleIdentitiesClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse