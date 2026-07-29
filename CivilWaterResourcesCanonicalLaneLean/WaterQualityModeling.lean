import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure WaterQualityModelingPackage where
  pollutantSources : Type u
  fateTransportProcesses : Type v
  dissolvedOxygenDynamics : Prop
  nutrientCycling : Prop
  pathogenIndicators : Prop

structure WaterQualityModelingEvidence (W : WaterQualityModelingPackage) where
  dissolvedOxygenDynamicsClosed : W.dissolvedOxygenDynamics
  nutrientCyclingClosed : W.nutrientCycling
  pathogenIndicatorsClosed : W.pathogenIndicators

def WaterQualityModelingClosed (W : WaterQualityModelingPackage) : Prop :=
  W.dissolvedOxygenDynamics ∧ W.nutrientCycling ∧ W.pathogenIndicators

theorem water_quality_modeling_closed_from_evidence (W : WaterQualityModelingPackage)
    (E : WaterQualityModelingEvidence W) : WaterQualityModelingClosed W := by
  exact And.intro E.dissolvedOxygenDynamicsClosed
    (And.intro E.nutrientCyclingClosed E.pathogenIndicatorsClosed)

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse