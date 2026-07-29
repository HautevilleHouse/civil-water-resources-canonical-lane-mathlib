import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure WaterResourceObject where
  catchmentArea : Type
  rainfallRunoffModel : Prop
  hydraulicCapacity : Prop
  waterQualityStandard : Prop
  infrastructureResilience : Prop

structure AdmissibleClass where
  object : WaterResourceObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

df admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.rainfallRunoffModel ∧ A.object.hydraulicCapacity ∧ A.object.waterQualityStandard ∧ A.object.infrastructureResilience) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse