import CivilWaterResourcesCanonicalLaneLean.HydraulicStructures

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure PollutantConcentration where
  pollutant : String
  concentration : Float
  location : String
  time : Float

structure WaterQualityModel where
  decayRate : Float
  reaerationRate : Float
  sedimentationRate : Float

def doDeficit (CdoSat : Float) (Cdo : Float) : Float :=
  CdoSat - Cdo

structure StreeterPhelps where
  initialBOD : Float
  initialDO : Float
  deoxygenationRate : Float
  reaerationRate : Float

def streeterPhelps (L0 : Float) (D0 : Float) (k1 : Float) (k2 : Float) (t : Float) : Float * Float :=
  let L : Float := L0 * Real.exp (-k1 * t)
  let D : Float := (k1 * L0 / (k2 - k1)) * (Real.exp (-k1 * t) - Real.exp (-k2 * t)) + D0 * Real.exp (-k2 * t)
  (L, D)

structure WQAdmissibleClass (A : AdmissibleClass) where
  bridgeClosedD : bridgeClosed A
  gateClosedD : gateClosed A
  waterQualityConstraints : Prop
  waterQualityConstraintsTerm : waterQualityConstraints

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse