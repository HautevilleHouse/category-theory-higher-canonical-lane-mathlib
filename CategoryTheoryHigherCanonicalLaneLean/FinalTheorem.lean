import canonicalLaneMathlib.AdmissibleClass
import YonedaLemma
import AdjFunctors
import Limits
import KanExtensions
import Monads

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

def ConstrainedCategoryTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_theory_endgame (A : AdmissibleClass) :
    ConstrainedCategoryTheoryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse