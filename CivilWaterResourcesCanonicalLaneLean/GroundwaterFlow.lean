import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure GroundwaterFlowPackage where
  hydraulicConductivity : Rational
  aquiferThickness : Rational
  hydraulicGradient : Rational
  specificYield : Rational
  storageCoefficient : Rational

structure GroundwaterFlowEvidence (G : GroundwaterFlowPackage) where
  hydraulicConductivityClosed : G.hydraulicConductivity > 0
  aquiferThicknessClosed : G.aquiferThickness > 0
  hydraulicGradientClosed : G.hydraulicGradient > 0
  specificYieldClosed : G.specificYield > 0 ∧ G.specificYield ≤ 1
  storageCoefficientClosed : G.storageCoefficient > 0 ∧ G.storageCoefficient ≤ 1

def GroundwaterFlowClosed (G : GroundwaterFlowPackage) : Prop :=
  G.hydraulicConductivity > 0 ∧ G.aquiferThickness > 0 ∧ G.hydraulicGradient > 0 ∧
  (G.specificYield > 0 ∧ G.specificYield ≤ 1) ∧
  (G.storageCoefficient > 0 ∧ G.storageCoefficient ≤ 1)

theorem groundwater_flow_closed_from_evidence
    (G : GroundwaterFlowPackage) (E : GroundwaterFlowEvidence G) :
    GroundwaterFlowClosed G := by
  refine And.intro E.hydraulicConductivityClosed (And.intro E.aquiferThicknessClosed
    (And.intro E.hydraulicGradientClosed (And.intro E.specificYieldClosed
      E.storageCoefficientClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse