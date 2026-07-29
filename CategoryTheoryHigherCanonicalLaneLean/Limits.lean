import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure ConeOver (J C : Type u) [Category J] [Category C] (F : Functor J C) where
  apex : C
  components : ∀ j : J, apex ⟶ F.obj j
  naturality : ∀ {j k : J} (f : j ⟶ k), components j ≫ F.map f = components k

structure LimitCone (J C : Type u) [Category J] [Category C] (F : Functor J C) where
  cone : ConeOver F
  universal : ∀ (c : ConeOver F), ∃! (f : c.apex ⟶ cone.apex), ∀ (j : J), f ≫ cone.components j = c.components j

structure FiniteLimitPackage where
  hasFiniteProducts : Prop
  hasEqualizers : Prop
  hasPullbacks : Prop
  hasFiniteLimits : Prop
  finiteProductsClosed : hasFiniteProducts
  equalizersClosed : hasEqualizers
  pullbacksClosed : hasPullbacks
  finiteLimitsClosed : hasFiniteLimits

structure LimitEvidence (P : FiniteLimitPackage) where
  finiteProductsClosed : P.hasFiniteProducts
  equalizersClosed : P.hasEqualizers
  pullbacksClosed : P.hasPullbacks
  finiteLimitsClosed : P.hasFiniteLimits

def FiniteLimitsClosed (P : FiniteLimitPackage) : Prop :=
  P.hasFiniteProducts ∧ P.hasEqualizers ∧ P.hasPullbacks ∧ P.hasFiniteLimits

theorem finite_limits_closed_from_evidence (P : FiniteLimitPackage) (E : LimitEvidence P) :
    FiniteLimitsClosed P := by
  exact And.intro E.finiteProductsClosed
    (And.intro E.equalizersClosed (And.intro E.pullbacksClosed E.finiteLimitsClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse
