import CivilWaterResourcesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilWaterResourcesCanonicalLaneLean

structure BasinCharacteristics where
  catchmentArea : Float
  slope : Float
  landUse : String
  soilType : String

def drainageDensity (L : Float) (A : Float) : Float :=
  L / A

structure RainfallRecord where
  intensity : Float
  duration : Float
  returnPeriod : Nat

structure RainfallExcess where
  totalRainfall : Float
  abstractions : Float
  excess : Float

structure Hydrograph where
  time : List Float
  discharge : List Float

def unitHydrograph (area : Float) : Hydrograph :=
  { time := [0.0, 1.0, 2.0],
    discharge := [0.0, area * 0.5, area * 0.2] }

def rationalMethod (C : Float) (i : Float) (A : Float) : Float :=
  C * i * A / 360.0

end CivilWaterResourcesCanonicalLaneLean
end HautevilleHouse