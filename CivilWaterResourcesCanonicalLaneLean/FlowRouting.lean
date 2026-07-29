import canonicalLaneMathlib.AdmissibleClass

/-!
# Flow Routing Package
-/

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure ChannelGeometryPackage where
  channelLength : Float
  channelSlope : Float
  manningRoughness : Float
  crossSectionShape : String
  bottomWidth : Float
  sideSlope : Float

structure HydraulicRoutingPackage (G : ChannelGeometryPackage) where
  flowEquation : String
  waveApproximation : String
  timeStep : Float
  distanceStep : Float
  routingMethod : String

structure FlowRoutingEvidence {G : ChannelGeometryPackage}
    (R : HydraulicRoutingPackage G) where
  flowEquationClosed : R.flowEquation = "Saint-Venant" ∨ R.flowEquation = "KinematicWave" ∨ R.flowEquation = "DiffusionWave"
  waveApproximationClosed : R.waveApproximation = "Kinematic" ∨ R.waveApproximation = "Diffusion" ∨ R.waveApproximation = "Dynamic"
  timeStepClosed : R.timeStep > 0.0
  distanceStepClosed : R.distanceStep > 0.0
  routingMethodClosed : R.routingMethod = "Muskingum" ∨ R.routingMethod = "Muskingum-Cunge" ∨ R.routingMethod = "DynamicWave"

def FlowRoutingClosed {G : ChannelGeometryPackage}
    (R : HydraulicRoutingPackage G) : Prop :=
  (R.flowEquation = "Saint-Venant" ∨ R.flowEquation = "KinematicWave" ∨ R.flowEquation = "DiffusionWave") ∧
  (R.waveApproximation = "Kinematic" ∨ R.waveApproximation = "Diffusion" ∨ R.waveApproximation = "Dynamic") ∧
  R.timeStep > 0.0 ∧
  R.distanceStep > 0.0 ∧
  (R.routingMethod = "Muskingum" ∨ R.routingMethod = "Muskingum-Cunge" ∨ R.routingMethod = "DynamicWave")

theorem flow_routing_closed_from_evidence
    {G : ChannelGeometryPackage} (R : HydraulicRoutingPackage G)
    (E : FlowRoutingEvidence R) : FlowRoutingClosed R := by
  exact And.intro E.flowEquationClosed
    (And.intro E.waveApproximationClosed
      (And.intro E.timeStepClosed
        (And.intro E.distanceStepClosed E.routingMethodClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse