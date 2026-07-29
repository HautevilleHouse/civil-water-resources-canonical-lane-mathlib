import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure HydraulicStructuresPackage where
  damEngineering : Type u
  spillwayDesign : Type v
  floodControl : Prop
  sedimentManagement : Prop
  energyDissipation : Prop

structure HydraulicStructuresEvidence (H : HydraulicStructuresPackage) where
  floodControlClosed : H.floodControl
  sedimentManagementClosed : H.sedimentManagement
  energyDissipationClosed : H.energyDissipation

def HydraulicStructuresClosed (H : HydraulicStructuresPackage) : Prop :=
  H.floodControl ∧ H.sedimentManagement ∧ H.energyDissipation

theorem hydraulic_structures_closed_from_evidence (H : HydraulicStructuresPackage)
    (E : HydraulicStructuresEvidence H) : HydraulicStructuresClosed H := by
  exact And.intro E.floodControlClosed
    (And.intro E.sedimentManagementClosed E.energyDissipationClosed)

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse