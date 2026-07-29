import canonicalLaneMathlib.AdmissibleClass

/-!
# Groundwater Modeling Package
-/

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure AquiferPropertiesPackage where
  hydraulicConductivity : Float
  specificYield : Float
  storativity : Float
  porosity : Float
  aquiferType : String
  boundaryConditions : String

structure GroundwaterFlowPackage (A : AquiferPropertiesPackage) where
  flowEquation : String
  numericalMethod : String
  timeDiscretization : Float
  spaceDiscretization : Float
  solverType : String

structure GroundwaterModelEvidence {A : AquiferPropertiesPackage}
    (G : GroundwaterFlowPackage A) where
  flowEquationClosed : G.flowEquation = "Darcy" ∨ G.flowEquation = "Richards" ∨ G.flowEquation = "Boussinesq"
  numericalMethodClosed : G.numericalMethod = "FiniteDifference" ∨ G.numericalMethod = "FiniteElement" ∨ G.numericalMethod = "FiniteVolume"
  timeDiscretizationClosed : G.timeDiscretization > 0.0
  spaceDiscretizationClosed : G.spaceDiscretization > 0.0
  solverTypeClosed : G.solverType = "Direct" ∨ G.solverType = "Iterative" ∨ G.solverType = "Preconditioned"

def GroundwaterModelClosed {A : AquiferPropertiesPackage}
    (G : GroundwaterFlowPackage A) : Prop :=
  (G.flowEquation = "Darcy" ∨ G.flowEquation = "Richards" ∨ G.flowEquation = "Boussinesq") ∧
  (G.numericalMethod = "FiniteDifference" ∨ G.numericalMethod = "FiniteElement" ∨ G.numericalMethod = "FiniteVolume") ∧
  G.timeDiscretization > 0.0 ∧
  G.spaceDiscretization > 0.0 ∧
  (G.solverType = "Direct" ∨ G.solverType = "Iterative" ∨ G.solverType = "Preconditioned")

theorem groundwater_model_closed_from_evidence
    {A : AquiferPropertiesPackage} (G : GroundwaterFlowPackage A)
    (E : GroundwaterModelEvidence G) : GroundwaterModelClosed G := by
  exact And.intro E.flowEquationClosed
    (And.intro E.numericalMethodClosed
      (And.intro E.timeDiscretizationClosed
        (And.intro E.spaceDiscretizationClosed E.solverTypeClosed)))

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse