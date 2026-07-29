import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.AdmissibleCategoryClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure AdjointFunctorsPackage (A : AdmissibleCategoryClass) where
  leftAdjoint : Type u
  rightAdjoint : Type v
  adjunctionUnit : Prop
  adjunctionCounit : Prop
  triangleIdentities : Prop
  universalProperty : Prop

structure AdjointFunctorsEvidence (A : AdmissibleCategoryClass) (Adj : AdjointFunctorsPackage A) where
  adjunctionUnitClosed : Adj.adjunctionUnit
  adjunctionCounitClosed : Adj.adjunctionCounit
  triangleIdentitiesClosed : Adj.triangleIdentities
  universalPropertyClosed : Adj.universalProperty

def AdjointFunctorsClosed (A : AdmissibleCategoryClass) (Adj : AdjointFunctorsPackage A) : Prop :=
  Adj.adjunctionUnit ∧ Adj.adjunctionCounit ∧ Adj.triangleIdentities ∧ Adj.universalProperty

theorem adjoint_functors_closed_from_evidence (A : AdmissibleCategoryClass) 
    (Adj : AdjointFunctorsPackage A) (E : AdjointFunctorsEvidence A Adj) : AdjointFunctorsClosed A Adj := by
  exact And.intro E.adjunctionUnitClosed (And.intro E.adjunctionCounitClosed 
    (And.intro E.triangleIdentitiesClosed E.universalPropertyClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse