import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure PipeNetworkHydraulicsPackage where
  pipeDiameter : Rational
  pipeLength : Rational
  roughnessHeight : Rational
  kinematicViscosity : Rational
  flowVelocity : Rational

structure PipeNetworkHydraulicsEvidence (P : PipeNetworkHydraulicsPackage) where
  pipeDiameterClosed : P.pipeDiameter > 0
  pipeLengthClosed : P.pipeLength > 0
  roughnessHeightClosed : P.roughnessHeight > 0
  kinematicViscosityClosed : P.kinematicViscosity > 0
  flowVelocityClosed : P.flowVelocity > 0

def PipeNetworkHydraulicsClosed (P : PipeNetworkHydraulicsPackage) : Prop :=
  P.pipeDiameter > 0 ∧ P.pipeLength > 0 ∧ P.roughnessHeight > 0 ∧
  P.kinematicViscosity > 0 ∧ P.flowVelocity > 0

theorem pipe_network_hydraulics_closed_from_evidence
    (P : PipeNetworkHydraulicsPackage) (E : PipeNetworkHydraulicsEvidence P) :
    PipeNetworkHydraulicsClosed P := by
  refine And.intro E.pipeDiameterClosed (And.intro E.pipeLengthClosed
    (And.intro E.roughnessHeightClosed (And.intro E.kinematicViscosityClosed
      E.flowVelocityClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse