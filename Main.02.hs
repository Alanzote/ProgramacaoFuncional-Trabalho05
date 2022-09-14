-- Aluno: Alan Renato Bunese
-- Disciplina: Programação Funcional
-- Professor: Frank Alcantara
module Main (main) where

{- 2.
 - Escreva uma função chamada idade que usando pelo menos um tipo definido por você que
 - receba o tempo de vida em segundos de uma determinada pessoa, o nome de um planeta
 - e devolva a idade desta pessoa em anos caso ela tivesse vivido naquele planeta. Sabendo
 - que o período orbital dos planetas é dado por:
 - a. Mercúrio: 0.2408467 anos terrestes;
 - b. Vênus: 0.61519726 anos terrestes;
 - c. Terra: 1.0 anos terrestre equivalente a 365.25 dias, ou 31.557.600 segundos;
 - d. Marte: 1.8808158 anos terrestres;
 - e. Júpiter: 11.862615 anos terrestres;
 - f. Saturno: 29.447498 anos terrestres;
 - g. Urano: 84.016846 anos terrestres;
 - h. Netuno: 164.79132 anos terrestres.
 -}
data Planeta = Mercúrio | Vênus | Terra | Marte | Júpiter | Saturno | Urano | Netuno
  deriving (Show, Eq)

idade :: Double -> Planeta -> Double
idade segundos planeta = case planeta of
  Mercúrio -> (segundos / 31557600) * 0.2408467
  Vênus -> (segundos / 31557600) * 0.61519726
  Terra -> segundos / 31557600
  Marte -> (segundos / 31557600) * 1.8808158
  Júpiter -> (segundos / 31557600) * 11.862615
  Saturno -> (segundos / 31557600) * 29.447498
  Urano -> (segundos / 31557600) * 84.016846
  Netuno -> (segundos / 31557600) * 164.79132

-- Main...
main :: IO()
main = do
  -- Testes
  print ("idade: entrada: 788940000 Marte; resultado: " ++ show (idade 788940000 Marte))

  print ("idade: entrada: 788940000 Terra; resultado: " ++ show (idade 788940000 Terra))

  print ("idade: entrada: 997773333 Urano; resultado: " ++ show (idade 997773333 Urano))