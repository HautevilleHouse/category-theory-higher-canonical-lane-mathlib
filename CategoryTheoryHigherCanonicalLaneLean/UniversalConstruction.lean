import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure UniversalConstructionPackage where
  categorySource : Type u
  categoryTarget : Type v
  diagramShape : Type w
  limitObject : Type u
  colimitObject : Type v
  limitExists : Prop
  colimitExists : Prop
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop

structure UniversalConstructionEvidence (U : UniversalConstructionPackage) where
  limitExistsClosed : U.limitExists
  colimitExistsClosed : U.colimitExists
  universalPropertyLimitClosed : U.universalPropertyLimit
  universalPropertyColimitClosed : U.universalPropertyColimit

def UniversalConstructionClosed (U : UniversalConstructionPackage) : Prop :=
  U.limitExists ∧ U.colimitExists ∧ U.universalPropertyLimit ∧ U.universalPropertyColimit

theorem universal_construction_closed_from_evidence (U : UniversalConstructionPackage) (E : UniversalConstructionEvidence U) :
    UniversalConstructionClosed U := by
  exact And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed (And.intro E.universalPropertyLimitClosed E.universalPropertyColimitClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse