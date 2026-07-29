import canonicalLaneMathlib.AdmissibleClass

/-!
# Hydrologic Design Package
-/

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure DesignStormPackage where
  returnPeriod : Nat
  duration : Float
  intensity : Float
  depth : Float
  temporalPattern : String
  spatialDistribution : String

structure HydraulicStructurePackage (D : DesignStormPackage) where
  structureType : String
  designDischarge : Float
  freeboard : Float
  energyDissipation : String
  materialType : String

structure HydrologicDesignEvidence {D : DesignStormPackage}
    (H : HydraulicStructurePackage D) where
  structureTypeClosed : H.structureType = "DetentionBasin" ∨ H.structureType = "Culvert" ∨ H.structureType = "Spillway" ∨ H.structureType = "Channel"
  designDischargeClosed : H.designDischarge > 0.0
  freeboardClosed : H.freeboard ≥ 0.3
  energyDissipationClosed : H.energyDissipation = "StillBasin" ∨ H.energyDissipation = "RipRap" ∨ H.energyDissipation = "ConcreteApron"
  materialTypeClosed : H.materialType = "Concrete" ∨ H.materialType = "Steel" ∨ H.materialType = "Earthen"

def HydrologicDesignClosed {D : DesignStormPackage}
    (H : HydraulicStructurePackage D) : Prop :=
  (H.structureType = "DetentionBasin" ∨ H.structureType = "Culvert" ∨ H.structureType = "Spillway" ∨ H.structureType = "Channel") ∧
  H.designDischarge > 0.0 ∧
  H.freeboard ≥ 0.3 ∧
  (H.energyDissipation = "StillBasin" ∨ H.energyDissipation = "RipRap" ∨ H.energyDissipation = "ConcreteApron") ∧
  (H.materialType = "Concrete" ∨ H.materialType = "Steel" ∨ H.materialType = "Earthen")

theorem hydrologic_design_closed_from_evidence
    {D : DesignStormPackage} (H : HydraulicStructurePackage D)
    (E : HydrologicDesignEvidence H) : HydrologicDesignClosed H := by
  exact And.intro E.structureTypeClosed
    (And.intro E.designDischargeClosed
      (And.intro E.freeboardClosed
        (And.intro E.energyDissipationClosed E.materialTypeClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse