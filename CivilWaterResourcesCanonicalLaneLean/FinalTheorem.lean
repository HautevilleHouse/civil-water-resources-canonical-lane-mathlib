import canonicalLaneMathlib.AdmissibleClass
import BridgeLemmas
import GateLemmas

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

def ConstrainedWaterResourcesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_water_resources_endgame (A : AdmissibleClass) :
    ConstrainedWaterResourcesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse