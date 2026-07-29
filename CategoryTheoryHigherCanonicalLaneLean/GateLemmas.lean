import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse