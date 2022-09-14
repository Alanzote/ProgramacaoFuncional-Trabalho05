-- Aluno: Alan Renato Bunese
-- Disciplina: Programação Funcional
-- Professor: Frank Alcantara
module Main (main) where

-- Imports...
import Data.Char
import Data.Time.Clock.POSIX

{- 4.
 - Um dos jogos infantis mais populares no planeta, chamado de Jogo Da Forca, consiste na
 - escolha de letras do alfabeto latino para tentar encontrar uma palavra que esteja oculta.
 - Você deve implementar uma versão deste jogo em Haskell considerando as seguintes restrições:
 - você deverá usar caracteres ASCII para representar a forca, o enforcado, e os espaços selecionados
 - para cada palavra; os símbolos usados nas palavras serão apenas os caracteres do alfabeto latino
 - minúsculos entre a e z; o banco de dados de palavras pode conter, no mínimo 10 palavras de 6
 - letras ou mais; a cada tentativa a tela precisa ser limpa e redesenhada (ANSI Escape Codes - GitHub).
 -}

-- Estrutura de Dados utilizado para a Forca.
data Forca = Forca {
    palavra :: String,
    letras :: [Char],
    erros :: Int
}

-- Função da Forca.
forca :: Forca -> IO()
forca f = do
    -- Limpa a tela e colocamos o título.
    putStrLn "\x1B[2J"
    putStrLn "Jogo da Forca"

    -- Imprimimos o boneco dependendo dos erros.
    putStrLn " ____"
    putStrLn (" |  " ++ (if erros f > 0 then "O" else " "))
    putStrLn (" | " ++ (if erros f > 2 then "/" else " ") ++ (if erros f > 1 then "|" else " ") ++ (if erros f > 3 then "\\" else " "))
    putStrLn (" | " ++ (if erros f > 4 then "/" else " ") ++ (if erros f > 5 then " \\" else " "))
    putStrLn " -----"

    -- Prepara a palavra para ser mostrada.
    let palavraForca = (map (\x -> if elem x (letras f) then x else '_') (palavra f))

    -- Demonstra a palavra.
    putStrLn palavraForca
    putStrLn ""

    -- Se temos muitos erros...
    if erros f >= 6 then
        -- Perdemos.
        putStrLn "Você perdeu!"
    -- Se a palavra está inteira (sem _)
    else if palavra f == palavraForca then
        -- Ganhamos.
        putStrLn "Você ganhou!"
    -- Caso contrário, ainda estamos jogando...
    else do
        -- Pedimos uma letra.
        putStrLn "Digite uma letra: "
        
        -- Pegamos ela e a tratamos.
        inpStr <- getLine
        let letra = toLower (head inpStr)

        -- Se temos a letra na palavra.
        if letra `elem` palavra f then
            -- Chamamos forca novamente com a letra adicionada.
            forca (Forca (palavra f) (letras f ++ [letra]) (erros f))
        else
            -- Se não temos a letra, Chamamos forca novamente com um erro a mais.
            forca (Forca (palavra f) (letras f ++ [letra]) (erros f + 1))


-- Main...
main :: IO()
main = do
  -- Vamos criar uma listinha de palavras para nós...
  let palavras = [ "haskell", "frank", "alcantara", "bolo", "universidade", "sistema", "programa", "executar", "programar", "funcional", "testes", "processamento", "dados" ]

  -- Buscar tempo atual.
  time <- getPOSIXTime

  -- Converter para um número.
  let number_time = floor (toRational time)

  -- Buscar como índice do array.
  let array_index = number_time `mod` length palavras

  -- Chamar o jogo da Forca com a palavra escolhida.
  forca (Forca (palavras!!array_index) [] 0)