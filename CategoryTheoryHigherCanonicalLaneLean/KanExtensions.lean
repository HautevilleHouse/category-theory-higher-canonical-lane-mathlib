import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure KanExtension where
  left : Type u → Type u
  right : Type u → Type u
  extensionProperty : Prop
  extensionPropertyTerm : extensionProperty

structure KanExtensionPackage (K : KanExtension) where
  pointwiseFormula : Prop
  uniqueness : Prop
  pointwiseClosed : pointwiseFormula
  uniquenessClosed : uniqueness

structure KanExtensionEvidence (K : KanExtension) (P : KanExtensionPackage K) where
  pointwiseTerm : P.pointwiseFormula
  uniquenessTerm : P.uniqueness

def KanExtensionClosed (K : KanExtension) (P : KanExtensionPackage K) : Prop :=
  P.pointwiseFormula ∧ P.uniqueness

theorem kan_extension_closed_from_evidence (K : KanExtension) (P : KanExtensionPackage K)
    (E : KanExtensionEvidence K P) : KanExtensionClosed K P :=
  And.intro E.pointwiseTerm E.uniquenessTerm

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse