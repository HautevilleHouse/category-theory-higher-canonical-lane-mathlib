import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure MonadicityPackage where
  monad : Type u
  comparisonFunctor : Type v
  monadicityCondition : Prop
  reflectsIsomorphisms : Prop
  createsLimits : Prop

structure MonadicityEvidence (M : MonadicityPackage) where
  monadClosed : M.monad
  comparisonFunctorClosed : M.comparisonFunctor
  monadicityConditionClosed : M.monadicityCondition
  reflectsIsomorphismsClosed : M.reflectsIsomorphisms
  createsLimitsClosed : M.createsLimits

def MonadicityClosed (M : MonadicityPackage) : Prop :=
  M.monad ∧ M.comparisonFunctor ∧ M.monadicityCondition ∧ M.reflectsIsomorphisms ∧ M.createsLimits

theorem monadicity_closed_from_evidence (M : MonadicityPackage) (E : MonadicityEvidence M) : MonadicityClosed M := by
  exact And.intro E.monadClosed (And.intro E.comparisonFunctorClosed (And.intro E.monadicityConditionClosed (And.intro E.reflectsIsomorphismsClosed E.createsLimitsClosed)))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse