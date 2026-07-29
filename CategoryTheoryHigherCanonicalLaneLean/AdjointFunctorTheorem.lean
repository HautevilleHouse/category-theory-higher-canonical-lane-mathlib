import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category C] [Category D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  adjunction : Prop
  unitCounit : Prop

structure AdjointEvidence (C D : Type u) [Category C] [Category D] (A : AdjointPair C D) where
  adjunctionClosed : A.adjunction
  unitCounitClosed : A.unitCounit

def AdjointClosed (C D : Type u) [Category C] [Category D] (A : AdjointPair C D) : Prop :=
  A.adjunction ∧ A.unitCounit

theorem adjoint_closed_from_evidence (C D : Type u) [Category C] [Category D] (A : AdjointPair C D) (E : AdjointEvidence A) : AdjointClosed A :=
  And.intro E.adjunctionClosed E.unitCounitClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse