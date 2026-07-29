import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure LimitColimitPackage where
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop
  uniqueness : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty
  uniquenessClosed : L.uniqueness

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty ∧ L.uniqueness

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed
      (And.intro E.universalPropertyClosed E.uniquenessClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse