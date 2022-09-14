-- Aluno: Alan Renato Bunese
-- Disciplina: Programação Funcional
-- Professor: Frank Alcantara
module Main (main) where

{- 3.
 - Dada uma coleção de números, implemente as funções manter e descartar que recebem a coleção
 - e um predicado. Sempre que o predicado for verdadeiro quando aplicado a um item da coleção
 - original este item deve ser mantido ou descartado. Lembre-se dos valores imutáveis. Você
 - não pode usar as funções filter e reject já disponíveis no Prelude ou em qualquer outra
 - biblioteca.
 -}
manter :: [any] -> (any -> Bool) -> [any]
manter [] _ = []
manter (head:tail) pred = [head | pred head] ++ (manter tail pred)

descartar :: [any] -> (any -> Bool) -> [any]
descartar [] _ = []
descartar (head:tail) pred = [head | not (pred head)] ++ (descartar tail pred)

-- Main...
main :: IO()
main = do
  -- Testes...
  print ("manter: entrada: [10, 15, 3, 7, 20, 35] (\\x -> x `mod` 5 == 0); resultado: " ++ show (manter [10, 15, 3, 7, 20, 35] (\x -> x `mod` 5 == 0)))

  print ("manter: entrada: [5, 6, 9, 10, 25, 2] (\\x -> x > 10); resultado: " ++ show (manter [5, 6, 9, 10, 25, 2] (\x -> x > 10)))

  print ("descartar: entrada: [10, 15, 3, 7, 20, 35] (\\x -> x `mod` 5 == 0); resultado: " ++ show (descartar [10, 15, 3, 7, 20, 35] (\x -> x `mod` 5 == 0)))

  print ("descartar: entrada: [5, 6, 9, 10, 25, 2] (\\x -> x > 10); resultado: " ++ show (descartar [5, 6, 9, 10, 25, 2] (\x -> x > 10)))


