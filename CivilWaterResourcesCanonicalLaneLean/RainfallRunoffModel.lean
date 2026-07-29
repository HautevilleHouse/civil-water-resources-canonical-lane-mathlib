import civilWaterResourcesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure RainfallRunoffModel where
  precipitationInput : Prop
  evaporationLoss : Prop
  infiltrationRate : Prop
  runoffCoefficient : Prop
  calibrationData : Prop
  modelCalibrated : Prop
  modelValidated : Prop
  modelCalibratedTerm : modelCalibrated
  modelValidatedTerm : modelValidated

structure RainfallRunoffModelEvidence (R : RainfallRunoffModel) where
  precipitationInputClosed : R.precipitationInput
  evaporationLossClosed : R.evaporationLoss
  infiltrationRateClosed : R.infiltrationRate
  runoffCoefficientClosed : R.runoffCoefficient
  calibrationDataClosed : R.calibrationData
  modelCalibratedClosed : R.modelCalibrated
  modelValidatedClosed : R.modelValidated

df RainfallRunoffModelClosed (R : RainfallRunoffModel) : Prop :=
  R.precipitationInput ∧ R.evaporationLoss ∧ R.infiltrationRate ∧ R.runoffCoefficient ∧ R.calibrationData ∧ R.modelCalibrated ∧ R.modelValidated

theorem rainfall_runoff_model_closed_from_evidence (R : RainfallRunoffModel) (E : RainfallRunoffModelEvidence R) : RainfallRunoffModelClosed R := by
  exact And.intro E.precipitationInputClosed (And.intro E.evaporationLossClosed (And.intro E.infiltrationRateClosed (And.intro E.runoffCoefficientClosed (And.intro E.calibrationDataClosed (And.intro E.modelCalibratedClosed E.modelValidatedClosed)))))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse