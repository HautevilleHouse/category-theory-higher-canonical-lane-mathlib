import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CategoryTheoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse