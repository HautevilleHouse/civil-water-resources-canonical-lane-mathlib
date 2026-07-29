import civilWaterResourcesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

df gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse