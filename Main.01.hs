-- Aluno: Alan Renato Bunese
-- Disciplina: Programação Funcional
-- Professor: Frank Alcantara
module Main (main) where

{- 1.
 - Em Haskell temos um conjunto de tipos especiais: Maybe, Nothing e Just seu trabalho será
 - criar no repl.it um código, comentado, que explique estes tipos, sua funcionalidade e que
 - contenha quatro exemplos do seu uso. Com uma restrição: você deve evitar qualquer explicação
 - que inclua o uso de Monads. Lembre-se entre estes exemplos, um deve ser de sua autoria e
 - todos os outros precisam ter suas fontes citadas.
 -}

{- Nothing:
 - Representa que um valor não existe, ou seja, ele está ausente ou vazio.

 - Just:
 - Representa que um valor existe, ou seja, ele está presente ou preenchido.

 - Maybe:
 - Um tipo que pode ser um Nothing ou um Just. Ou seja, ele está vazio ou preenchido.
 - Os nomes/valores Nothing e Just são específicos deste tipo Maybe.
 -}
maybeTest :: Maybe Int -> Int -- Meu Exemplo
maybeTest (Just x) = x + 1
maybeTest Nothing = 0

-- Outros Exemplos de: https://wiki.haskell.org/Maybe
f :: Int -> Maybe Int
f 0 = Nothing
f x = Just x

g :: Int -> Maybe Int
g 100 = Nothing
g x = Just x

h :: Int -> Maybe Int
h x = case f x of
    Just n -> g n
    Nothing -> Nothing

h' :: Int -> Maybe Int
h' x = do n <- f x
          g n

-- Main...
main :: IO()
main = do
  -- Testes Meu método.
  print ("maybeTest: entrada: Just 1; resultado: " ++ show (maybeTest (Just 1)))
  print ("maybeTest: entrada: Nothing; resultado: " ++ show (maybeTest Nothing))

  -- Teste Método Exemplo.
  print ("h': entrada: 50; resultado: " ++ show (h' 50))
  print ("h': entrada: 100; resultado: " ++ show (h' 100))
  print ("h': entrada: 0; resultado: " ++ show (h' 0))
