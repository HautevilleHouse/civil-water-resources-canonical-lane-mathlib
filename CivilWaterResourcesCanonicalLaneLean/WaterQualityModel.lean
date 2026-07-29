import canonicalLaneMathlib.AdmissibleClass
import CivilWaterResourcesCanonicalLaneLean.WaterResourceSystem

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure WaterQualityModel {W : WaterResourceSystem} where
  pollutantSources : Prop
  transportMechanisms : Prop
  chemicalReactions : Prop
  biologicalProcesses : Prop
  concentrationGrading : Prop
  qualityStandards : Prop
  treatmentEfficiency : Prop
  monitoringNetwork : Prop

def WaterQualityModelClosed {W : WaterResourceSystem} (Q : WaterQualityModel W) : Prop :=
  Q.pollutantSources ∧ Q.transportMechanisms ∧ Q.chemicalReactions ∧
  Q.biologicalProcesses ∧ Q.concentrationGrading ∧ Q.qualityStandards ∧
  Q.treatmentEfficiency ∧ Q.monitoringNetwork

theorem water_quality_model_closed {W : WaterResourceSystem} (Q : WaterQualityModel W)
    (hps : Q.pollutantSources) (htm : Q.transportMechanisms)
    (hcr : Q.chemicalReactions) (hbp : Q.biologicalProcesses)
    (hcg : Q.concentrationGrading) (hqs : Q.qualityStandards)
    (hte : Q.treatmentEfficiency) (hmn : Q.monitoringNetwork) :
    WaterQualityModelClosed Q := by
  exact And.intro hps (And.intro htm (And.intro hcr (And.intro hbp
    (And.intro hcg (And.intro hqs (And.intro hte hmn))))))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse