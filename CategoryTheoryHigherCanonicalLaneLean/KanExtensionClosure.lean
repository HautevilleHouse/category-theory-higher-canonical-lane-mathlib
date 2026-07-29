import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCanonicalLaneLean

structure RanExtension {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (F : Functor C D) (G : Functor C E) (R : Functor D E) where
  unit : G ⟶ R.comp F
  universalProperty : ∀ (H : Functor D E) (α : G ⟶ H.comp F), ∃! (β : R ⟶ H), α = unit ≫ (β ◁ F)

structure LanExtension {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (F : Functor C D) (G : Functor C E) (L : Functor D E) where
  counit : L.comp F ⟶ G
  universalProperty : ∀ (H : Functor D E) (α : H.comp F ⟶ G), ∃! (β : H ⟶ L), α = (β ◁ F) ≫ counit

structure KanExtensionPackage {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (F : Functor C D) (G : Functor C E) where
  ranExists : Prop
  lanExists : Prop
  ranConstruction : RanExtension F G (someRan)
  lanConstruction : LanExtension F G (someLan)

structure KanExtensionEvidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    {F : Functor C D} {G : Functor C E} (P : KanExtensionPackage F G) where
  ranExistsClosed : P.ranExists
  lanExistsClosed : P.lanExists

def KanExtensionClosure {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    {F : Functor C D} {G : Functor C E} (P : KanExtensionPackage F G) : Prop :=
  P.ranExists ∧ P.lanExists

theorem kan_extension_closure_from_evidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    {F : Functor C D} {G : Functor C E} (P : KanExtensionPackage F G)
    (E' : KanExtensionEvidence P) : KanExtensionClosure P := by
  exact And.intro E'.ranExistsClosed E'.lanExistsClosed

end CategoryTheoryHigherCanonicalLaneLean
end HautevilleHouse