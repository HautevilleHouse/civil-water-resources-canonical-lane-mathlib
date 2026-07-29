import CivilWaterResourcesCanonicalLaneLean.WaterQuality

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure Pipe where
  length : Float
  diameter : Float
  roughness : Float

structure Node where
  elevation : Float
  demand : Float
  pressureHead : Float

structure Network where
  pipes : List Pipe
  nodes : List Node
  supplyNode : Nat

def headLossDarcyWeisbach (f : Float) (L : Float) (D : Float) (V : Float) (g : Float) : Float :=
  f * (L / D) * (V ^ 2) / (2.0 * g)

def hazenWilliamsFormula (C : Float) (D : Float) (S : Float) : Float :=
  0.849 * C * D ^ (2.63) * S ^ (0.54)

def networkMassBalance (nodes : List Node) : Prop :=
  (List.sum (nodes.map (fun n => n.demand))) = 0.0

structure WDNAdmissibleClass (A : AdmissibleClass) where
  bridgeClosedN : bridgeClosed A
  gateClosedN : gateClosed A
  networkConstraints : Prop
  networkConstraintsTerm : networkConstraints

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse