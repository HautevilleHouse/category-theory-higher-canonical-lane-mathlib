import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.AdmissibleCategoryClass
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.YonedaLemmaBridge
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.AdjointFunctorsPackage

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

def bridgeClosed (A : AdmissibleCategoryClass) : Prop :=
  CategoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleCategoryClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleCategoryClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleCategoryClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCategoryClosure (A : AdmissibleCategoryClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_endgame (A : AdmissibleCategoryClass) : ConstrainedCategoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse