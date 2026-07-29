import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure WatershedHydrologyPackage where
  basinArea : Nat
  annualPrecipitation : Nat
  runoffCoefficient : Rational
  baseflowIndex : Rational

structure WatershedHydrologyEvidence (W : WatershedHydrologyPackage) where
  basinAreaClosed : W.basinArea > 0
  annualPrecipitationClosed : W.annualPrecipitation > 0
  runoffCoefficientClosed : W.runoffCoefficient > 0 ∧ W.runoffCoefficient ≤ 1
  baseflowIndexClosed : W.baseflowIndex ≥ 0 ∧ W.baseflowIndex ≤ 1

def WatershedHydrologyClosed (W : WatershedHydrologyPackage) : Prop :=
  W.basinArea > 0 ∧ W.annualPrecipitation > 0 ∧
  (W.runoffCoefficient > 0 ∧ W.runoffCoefficient ≤ 1) ∧
  (W.baseflowIndex ≥ 0 ∧ W.baseflowIndex ≤ 1)

theorem watershed_hydrology_closed_from_evidence
    (W : WatershedHydrologyPackage) (E : WatershedHydrologyEvidence W) :
    WatershedHydrologyClosed W := by
  refine And.intro E.basinAreaClosed (And.intro E.annualPrecipitationClosed
    (And.intro E.runoffCoefficientClosed E.baseflowIndexClosed))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse