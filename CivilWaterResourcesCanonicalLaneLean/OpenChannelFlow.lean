import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure OpenChannelFlowPackage where
  discharge : Rational
  crossSectionArea : Rational
  hydraulicRadius : Rational
  frictionSlope : Rational
  manningCoefficient : Rational

structure OpenChannelFlowEvidence (O : OpenChannelFlowPackage) where
  dischargeClosed : O.discharge > 0
  crossSectionAreaClosed : O.crossSectionArea > 0
  hydraulicRadiusClosed : O.hydraulicRadius > 0
  frictionSlopeClosed : O.frictionSlope > 0
  manningCoefficientClosed : O.manningCoefficient > 0

def OpenChannelFlowClosed (O : OpenChannelFlowPackage) : Prop :=
  O.discharge > 0 ∧ O.crossSectionArea > 0 ∧ O.hydraulicRadius > 0 ∧
  O.frictionSlope > 0 ∧ O.manningCoefficient > 0

theorem open_channel_flow_closed_from_evidence
    (O : OpenChannelFlowPackage) (E : OpenChannelFlowEvidence O) :
    OpenChannelFlowClosed O := by
  refine And.intro E.dischargeClosed (And.intro E.crossSectionAreaClosed
    (And.intro E.hydraulicRadiusClosed (And.intro E.frictionSlopeClosed
      E.manningCoefficientClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse