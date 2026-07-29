import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure AdmissibleClass where
  object : CategoryTheoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CategoryTheoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse