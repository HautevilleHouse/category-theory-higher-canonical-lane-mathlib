import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure Monad where
  endofunctor : Type u → Type u
  unit : (A : Type u) → A → endofunctor A
  multiplication : (A : Type u) → endofunctor (endofunctor A) → endofunctor A
  associativity : Prop
  unitLaws : Prop
  associativityTerm : associativity
  unitLawsTerm : unitLaws

structure MonadPackage (M : Monad) where
  kleisliCategory : Prop
  emCategory : Prop
  barConstruction : Prop
  kleisliClosed : kleisliCategory
  emClosed : emCategory
  barClosed : barConstruction

structure MonadEvidence (M : Monad) (P : MonadPackage M) where
  kleisliTerm : P.kleisliCategory
  emTerm : P.emCategory
  barTerm : P.barConstruction

def MonadClosed (M : Monad) (P : MonadPackage M) : Prop :=
  P.kleisliCategory ∧ P.emCategory ∧ P.barConstruction

theorem monad_closed_from_evidence (M : Monad) (P : MonadPackage M) (E : MonadEvidence M P) :
    MonadClosed M P := And.intro E.kleisliTerm (And.intro E.emTerm E.barTerm)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse