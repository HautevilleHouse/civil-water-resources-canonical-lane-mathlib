import canonicalLaneMathlib.AdmissibleClass

/-!
# Catchment Modeling Package
-/

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure CatchmentCharacterizationPackage where
  catchmentArea : Float
  averageSlope : Float
  landCoverType : String
  soilType : String
  precipitationRegime : String

structure RunoffGenerationPackage (C : CatchmentCharacterizationPackage) where
  rainfallExcessMethod : String
  infiltrationModel : String
  initialAbstraction : Float
  curveNumber : Nat
  runoffCoefficient : Float

structure CatchmentModelEvidence {C : CatchmentCharacterizationPackage}
    (R : RunoffGenerationPackage C) where
  rainfallExcessMethodClosed : R.rainfallExcessMethod = "SCS-CN" ∨ R.rainfallExcessMethod = "Green-Ampt"
  infiltrationModelClosed : R.infiltrationModel = "Horton" ∨ R.infiltrationModel = "Philip"
  initialAbstractionClosed : 0.0 ≤ R.initialAbstraction
  curveNumberClosed : 30 ≤ R.curveNumber ∧ R.curveNumber ≤ 100
  runoffCoefficientClosed : 0.0 ≤ R.runoffCoefficient ∧ R.runoffCoefficient ≤ 1.0

def CatchmentModelClosed {C : CatchmentCharacterizationPackage}
    (R : RunoffGenerationPackage C) : Prop :=
  (R.rainfallExcessMethod = "SCS-CN" ∨ R.rainfallExcessMethod = "Green-Ampt") ∧
  (R.infiltrationModel = "Horton" ∨ R.infiltrationModel = "Philip") ∧
  0.0 ≤ R.initialAbstraction ∧
  (30 ≤ R.curveNumber ∧ R.curveNumber ≤ 100) ∧
  (0.0 ≤ R.runoffCoefficient ∧ R.runoffCoefficient ≤ 1.0)

theorem catchment_model_closed_from_evidence
    {C : CatchmentCharacterizationPackage} (R : RunoffGenerationPackage C)
    (E : CatchmentModelEvidence R) : CatchmentModelClosed R := by
  exact And.intro E.rainfallExcessMethodClosed
    (And.intro E.infiltrationModelClosed
      (And.intro E.initialAbstractionClosed
        (And.intro E.curveNumberClosed E.runoffCoefficientClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse