import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryHigherCanonicalLaneLean.AdmissibleCategoryClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure YonedaLemmaPackage (A : AdmissibleCategoryClass) where
  functorCategory : Type u
  yonedaEmbedding : Type v
  fullFaithfulness : Prop
  naturalIsomorphism : Prop
  yonedaLemmaStatement : Prop

structure YonedaLemmaEvidence (A : AdmissibleCategoryClass) (Y : YonedaLemmaPackage A) where
  fullFaithfulnessClosed : Y.fullFaithfulness
  naturalIsomorphismClosed : Y.naturalIsomorphism
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement

def YonedaLemmaClosed (A : AdmissibleCategoryClass) (Y : YonedaLemmaPackage A) : Prop :=
  Y.fullFaithfulness ∧ Y.naturalIsomorphism ∧ Y.yonedaLemmaStatement

theorem yoneda_lemma_closed_from_evidence (A : AdmissibleCategoryClass) 
    (Y : YonedaLemmaPackage A) (E : YonedaLemmaEvidence A Y) : YonedaLemmaClosed A Y := by
  exact And.intro E.fullFaithfulnessClosed (And.intro E.naturalIsomorphismClosed E.yonedaLemmaStatementClosed)

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse