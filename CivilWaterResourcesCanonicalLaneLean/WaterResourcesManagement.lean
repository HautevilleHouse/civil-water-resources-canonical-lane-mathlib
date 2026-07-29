import CivilWaterResourcesCanonicalLaneLean.WaterDistributionNetworks

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure ResourceAllocation where
  sourceCapacity : Float
  demandNodes : List Node
  allocationVector : List Float

def reliability (supply : Float) (demand : Float) : Float :=
  if demand > 0 then supply / demand else 1.0

structure SustainabilityIndex where
  reliability : Float
  resilience : Float
  vulnerability : Float

def sustainability (rel : Float) (res : Float) (vul : Float) : Float :=
  rel * res * (1.0 - vul)

structure ManagementPolicy where
  rules : String
  objective : String

def zeroNetMassBalance (allocation : ResourceAllocation) : Prop :=
  let totalAlloc : Float := List.sum allocation.allocationVector
  let totalDemand : Float := List.sum (allocation.demandNodes.map (fun n => n.demand))
  totalAlloc = totalDemand

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse