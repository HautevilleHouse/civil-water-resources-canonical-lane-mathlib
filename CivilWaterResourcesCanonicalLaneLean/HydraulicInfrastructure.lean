import civilWaterResourcesCanonicalLaneLean.RainfallRunoffModel

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure HydraulicInfrastructure where
  pipeNetwork : Prop
  storageTanks : Prop
  pumpingStations : Prop
  treatmentPlants : Prop
  capacityUnderDesignStorm : Prop
  resilienceToFailure : Prop
  capacityUnderDesignStormTerm : capacityUnderDesignStorm
  resilienceToFailureTerm : resilienceToFailure

structure HydraulicInfrastructureEvidence (H : HydraulicInfrastructure) where
  pipeNetworkClosed : H.pipeNetwork
  storageTanksClosed : H.storageTanks
  pumpingStationsClosed : H.pumpingStations
  treatmentPlantsClosed : H.treatmentPlants
  capacityUnderDesignStormClosed : H.capacityUnderDesignStorm
  resilienceToFailureClosed : H.resilienceToFailure

df HydraulicInfrastructureClosed (H : HydraulicInfrastructure) : Prop :=
  H.pipeNetwork ∧ H.storageTanks ∧ H.pumpingStations ∧ H.treatmentPlants ∧ H.capacityUnderDesignStorm ∧ H.resilienceToFailure

theorem hydraulic_infrastructure_closed_from_evidence (H : HydraulicInfrastructure) (E : HydraulicInfrastructureEvidence H) : HydraulicInfrastructureClosed H := by
  exact And.intro E.pipeNetworkClosed (And.intro E.storageTanksClosed (And.intro E.pumpingStationsClosed (And.intro E.treatmentPlantsClosed (And.intro E.capacityUnderDesignStormClosed E.resilienceToFailureClosed))))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse