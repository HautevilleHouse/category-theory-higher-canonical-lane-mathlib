import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure KanExtensionPackage where
  functorF : Type u → Type v
  functorK : Type u → Type w
  leftKanExtension : Type v → Type w
  rightKanExtension : Type v → Type w
  leftKanExists : Prop
  rightKanExists : Prop
  universalPropertyLeft : Prop
  universalPropertyRight : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  leftKanExistsClosed : K.leftKanExists
  rightKanExistsClosed : K.rightKanExists
  universalPropertyLeftClosed : K.universalPropertyLeft
  universalPropertyRightClosed : K.universalPropertyRight

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.leftKanExists ∧ K.rightKanExists ∧ K.universalPropertyLeft ∧ K.universalPropertyRight

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (E : KanExtensionEvidence K) :
    KanExtensionClosed K := by
  exact And.intro E.leftKanExistsClosed (And.intro E.rightKanExistsClosed (And.intro E.universalPropertyLeftClosed E.universalPropertyRightClosed))

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse