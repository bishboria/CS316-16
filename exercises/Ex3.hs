module Ex3 where

import Text.Read

{----------------------------------------------------------------------}
{- CS316 (2016/17) EXERCISE 3                                         -}
{----------------------------------------------------------------------}

-- Submit by committing to GitLab at or before 2pm on Monday 7th November.
-- There will be a test on this exercise in the lab on that date.
--
-- Your combined score from the submission and the test will be worth
-- 30% of the overall marks for the class (so one mark, below is worth
-- half a percent).
--
-- The test will consists of further requirements issued as updates to
-- this file, and you will need to make changes in response to the new
-- requirements, then commit a new version of the file by the end of
-- the lab session.

{----------------------------------------------------------------------}
{- HIGHER-ORDER PROGRAMMING                                           -}
{----------------------------------------------------------------------}

{- 3.1 Identify yourself. Encode your name instead of Harry's between the
   quotation marks. Your file might get separated from your repository,
   so we'll need this info to give you your mark. -}

myName :: String
myName = map pred "Ibssz!Qbmnfs"

{- 1 mark -}

{----------------------------------------------------------------------}
{- STRUCTURAL RECURSION ON TREES AND LISTS                            -}
{----------------------------------------------------------------------}

{- In the last exercise, we asked you to write functions by recursion on
   lists and trees. These functions only did one thing. For example,
   'concLists' concatenated lists, 'mirror' mirrored trees.

   In this exercise, you will be using and writing so-called "higher
   order" functions that can do many different things, depending on
   the functions that are passed to them as parameters. -}

{- 3.2. Write filter's evil twin that retains the elements of a list
   that fail the test rather than those that pass. Write your function
   using 'filter'. -}

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = undefined

{- 1 mark -}

{- There are two very general ways of iterating over the elements of a
   list, combining all the elements one by one. We can either go
   'right to left' or 'left to right'. We call the first one
   'iterRight' and the second 'iterLeft', and they are defined as
   follows. Many functions on lists can be defined in terms of these
   functions, as you will see below. -}

iterRight :: (a -> b -> b) -> b -> [a] -> b
iterRight f z []     = z
iterRight f z (x:xs) = f x (iterRight f z xs)

iterLeft :: (b -> a -> b) -> b -> [a] -> b
iterLeft f acc []     = acc
iterLeft f acc (x:xs) = iterLeft f (f acc x) xs

{- These functions are sometimes called 'foldr' and 'foldl'. We use
   these names here to avoid confusion with the general 'fold'
   functions introduced in Lectures 7 and 8. -}

{- 3.3 The product function computes the product of (i.e. multiplies
   together) a list of integers. For example:

     product [1,2,3] = 6

   Define this function using 'iterRight'. Do not use explicit
   recursion -- if you write 'productFromIterRight' on the right hand
   side of the equals sign here, you are doing it wrong. -}
productFromIterRight :: [Int] -> Int
productFromIterRight = undefined

{- 1 mark -}

{----------------------------------------------------------------------}
{- 3.4 mapfromIterRight (TEST)                                        -}

{- Define the 'map' function for lists using 'iterRight'. Do not use
   explicit recursion -- if you write 'productFromIterRight' on the
   right hand side of the equals sign here, you are doing it wrong. -}

mapFromIterRight :: (a -> b) -> [a] -> [b]
mapFromIterRight = undefined

{- 2 marks                                                            -}
{----------------------------------------------------------------------}

{- 3.5 The reverse function reverses a list. For example:

     reverse [1,2,3] = [3,2,1]

   Define a function that does the same job, but written in terms of
   'iterLeft'. Again, if you write 'reverseFromIterLeft' on the right
   hand side of the equals sign here, you are doing it wrong. -}
reverseFromIterLeft :: [a] -> [a]
reverseFromIterLeft = undefined

{- 2 marks -}

{- 3.6 Now define a function that does the same job as 'iterLeft', but
   defined by using 'iterRight'. Again, using explicit recursion is
   not the answer! -}
iterLeftFromIterRight :: (b -> a -> b) -> b -> [a] -> b
iterLeftFromIterRight = undefined

{- 2 marks -}

{- 'iterLeft' and 'iterRight' allow iteration through a list of
   elements, but don't provide access to the list being iterated
   over. The 'recList' function, provided below, does allow access to
   the underlying list. See how the type of the function argument
   includes an extra '[a]' compared to the corresponding part in the
   type of 'iterRight'. -}

recList :: (a -> ([a], b) -> b) -> b -> [a] -> b
recList f z []     = z
recList f z (x:xs) = f x (xs, recList f z xs)

{- 3.7 Define the insertion into an ordered list function, as seen in
   Lecture 5, but this time using 'recList' instead of explicit
   recursion. -}

insert :: Ord a => a -> [a] -> [a]
insert = undefined

{- 1 mark -}

{- 3.8 Define 'iterRight' from 'recList', without using explicit
   recursion. -}
iterRightFromRecList :: (a -> b -> b) -> b -> [a] -> b
iterRightFromRecList = undefined

{- 1 mark -}

{- For 3.8, it may be helpful to know that you can write lambda
   functions that take pairs as arguments using pattern matching
   notation. For example:

    \(a,b) -> a
-}

{- 3.9 Is intentionally left blank. -}

{----------------------------------------------------------------------}
{- 3.10 recListFromIterRight (TEST)                                   -}

{- Define 'recList' in terms of 'iterRight'. -}

recListFromIterRight :: (a -> ([a], b) -> b) -> b -> [a] -> b
recListFromIterRight = undefined

{- 3 marks -}
{----------------------------------------------------------------------}

{- Here is the Tree type again. Trees are built from 'Leaf's and
   'Node's, and each node has two children and a value of type
   'a'. Just as for lists, we can write higher-order functions that
   process trees. -}

data Tree a
  = Leaf
  | Node (Tree a) a (Tree a)
  deriving Show

{- 3.11 The 'mapTree' function applies a given function to every value
   stored within the tree, returning the new tree. For example

     mapTree (+1) (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))
  ==
     Node (Node Leaf 2 Leaf) 3 (Node Leaf 4 Leaf)

  Define this function by recursion over trees. -}

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree = undefined

{- 2 marks -}

{- 3.12 'iterTree' is similar to 'iterLeft' and 'iterRight' for
   lists. 'iterTree l n t' uses 'n' as the value for every leaf in the
   tree and uses 'n' compute a value for every Node. Define this
   function. -}

iterTree :: b -> (b -> a -> b -> b) -> Tree a -> b
iterTree = undefined

{- 2 marks -}

{- 3.13 'recTree' is similar to 'recList', but operates on trees. Copy
   your definition of 'iterTree' and extend it to have the type given
   below. -}

recTree :: b -> ((Tree a,b) -> a -> (Tree a,b) -> b) -> Tree a -> b
recTree = undefined

{- 2 marks -}

{- 3.14 Define sumTree using iterTree. 'sumTree' adds up all the
   integers stored within a tree. For example:

     sumTree (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))
  ==
     6

    As before, your 'sumTree' should be defined using 'iterTree'. If
    you write 'sumTree' on the right hand side of the equals, you are
    doing it wrong! -}
sumTree :: Tree Int -> Int
sumTree = undefined

{- 1 mark -}

{- 3.15 Define 'flatten' (as in Lecture 5) using 'iterTree'. -}
flatten :: Tree a -> [a]
flatten = undefined

{- 1 mark -}

{----------------------------------------------------------------------}
{- 3.16 Left Spines (TEST)                                            -}

{- The "left spine" of a binary tree is the list of node labels starting
   at the root, and descending into each left subtree until the
   leftmost leaf is reached. Write a function to compute the left
   spine of a tree.

   This function must be written using 'iterTree', and not using
   explicit recursion. -}

leftSpine :: Tree a -> [a]
leftSpine = undefined

{- For example, you should have

   leftSpine (Node (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))
                   4
                   (Node (Node Leaf 5 Leaf) 6 (Node Leaf 7 Leaf)))
   = [4,2,1]
-}

{- 1 mark -}
{----------------------------------------------------------------------}

{- 3.17 Write 'insertFromRecTree' (assuming that the tree is ordered),
   using 'recTree'. This function should do the same job as the
   'insertBST' function defined in Lecture 5. -}
insertFromRecTree :: Ord a => a -> Tree a -> Tree a
insertFromRecTree = undefined

{- 2 marks -}

{- 3.18 We will now see that even though 'recTree' appears to be more
   powerful than 'iterTree', we can in fact define 'recTree' from
   'iterTree'. The trick is to pass extra information through the
   iteration and discard it at the end. We have given the start of the
   definition below. You have to:

    a) Alter the definition of Extra a b to correctly describe the
    extra information needed; and

    b) Implement 'leaf' and 'node' below. -}

type Extra a b = () -- REPLACE THIS

recTreeFromIterTree :: b -> ((Tree a,b) -> a -> (Tree a,b) -> b) -> Tree a -> b
recTreeFromIterTree n l t = snd (iterTree leaf node t)
  where
    -- leaf :: (Extra a b, b)
    leaf = undefined

    -- node :: (Extra a b, b) -> a -> (Extra a b, b) -> (Extra a b, b)
    node = undefined

{- 3 marks -}

{----------------------------------------------------------------------}
{- 3.19 Trees full of functions (TEST)                                -}

{- Define 'applyTree', a function that takes a binary tree of binary
   functions, and a value to use for the leaves, and returns the value
   computed by recursively applying the function at each node to the
   values computed for its two sub-trees.

   For example:

     applyTree (Node (Node Leaf (+) Leaf) (*) (Node Leaf (+) Leaf)) 1 = 4

   because: (1 + 1) * (1 + 1) = 2 * 2 = 4.

   Define your 'applyTree' using 'iterTree'. -}

applyTree :: Tree (Int -> Int -> Int) -> Int -> Int
applyTree = undefined

{- 2 marks -}
{----------------------------------------------------------------------}

{----------------------------------------------------------------------}
{- MODELLING COMMUNICATING PROCESSES                                  -}
{----------------------------------------------------------------------}

{- This exercise generalises the communicating processes from Exercise 2
   to allow processes that send and recieve data of any type, not just
   bits. These processes are also a kind of tree, except that now the
   number of choices of what to do next after an input is represented
   by a function. -}

{- We'll do the setup, then it'll be your turn. -}

data CP x a
  = End a -- marks the end of a process, returning a value of type a
  | Input (x -> CP x a) -- (Input k) inputs a value v of type x, and
                        -- chooses a continuation process (k v) based
                        -- on that value.
  | Output x (CP x a) -- (Output v k) outputs a value v of type x and
                      -- continues as the process k.
  | Abort -- signals that the process has aborted. This can happen if
          -- it gets unexpected input.

{- Just in the 'Process' type in Exercise 2, the data in this type are
   descriptions of processes. We will see different ways of
   interpreting them below. -}

{- Let's have some example processes. First, the notGate example from
   Exercise 2, rewritten to be a member of the more general CP type: -}

notGate :: CP Bool ()
notGate = Input (\b -> Output (not b) (End ()))

{- See how this is the same as the notGate example in Exercise 2, only
   here instead of explicitly giving the two different options for the
   two possible inputs, we give a function that decides what to do
   instead. In this case, it outputs the 'not' of whatever the input
   is. -}

{- Let's have an example process: this process inputs any value, and
   then outputs that same value. -}

echo :: CP x ()
echo = Input (\v -> Output v (End ()))

{- We make processes 'go' in the same way as we did before. We interpret
   them, feeding the 'Input's from a list of inputs, and placing the
   'Output's into a list. There are two main differences with
   'process' from Ex 2: we need to return the extra value attached to
   'End', and we need to interpret the new 'Abort' instruction. -}

process :: CP x a -> [x] -> (a,[x])
process (End a)      inputs     = (a,[])
process (Input k)    (v:inputs) = process (k v) inputs
process (Input k)    []         = error "Not enough input"
process (Output v k) inputs     = (a,v:outputs)
  where (a,outputs) = process k inputs
process Abort        inputs     = error "ABORT"

{- For example,

   process echo ["Hello"] == ((),["Hello"])
-}

{- If we have a process that communicates using 'String's, then we can
   make it actually interact with the user using 'runIO'. This
   function translates process descriptions into I/O commands. This
   function uses Haskell's basic facilites for doing real I/O. We will
   come back to this later in the course. -}

runIO :: CP String a -> IO a
runIO (End a)      = return a
runIO (Input k)    = getLine >>= runIO . k
runIO (Output x k) = putStrLn x >> runIO k
runIO Abort        = error "ABORT"

{- Here's an example of using 'runIO'. The '>' is the haskell prompt.

   > runIO echo
   hello
   hello

   where the first 'hello' is typed by the user, and the second is
   printed by the computer. You can use runIO to test your processes
   below, interactively. -}

{- Let's make some basic processes that we can use to build larger
   processes. Your job is to write these from their specifications. -}

{- 3.20 Define 'input'. 'input' is the process that inputs a single
   value and then ends with that value. -}
input :: CP x x
input = undefined

{- 1 mark -}

{- 3.21 Define 'output'. 'output x' is the process that outputs the
   value x, and then ends with the value (). -}
output :: x -> CP x ()
output x = undefined

{- 1 mark -}

{- 3.22 Sequential composition of processes. In the previous exercise,
   sequential composition of processes had type 'Process -> Process ->
   Process'. Here, processes end with a value, which is passed on to
   subsequent processes. Define the rest of this function to complete
   the definition of sequential composition of processes.

   Here are some examples of its use:

   > runIO (Input (\x -> End x) `sequ` \x -> Output x (End ()))
   hello
   hello

   > runIO (Input (\x -> Abort) `sequ` \x -> End ())
   hello
   *** Exception: ABORT
-}

sequ :: CP x a -> (a -> CP x b) -> CP x b
sequ (End a)      f = f a
sequ (Input k)    f = Input undefined
sequ (Output x k) f = undefined
sequ Abort        f = undefined

{- 3 marks -}

{- 3.23 Define a process that does the same thing as 'echo' above, but
   using only 'input', 'output' and 'sequ'. -}

echoFromSequ :: CP x ()
echoFromSequ = undefined

{- 1 mark -}

{- 3.24 Define a process that inputs two numbers and ends with the sum
 of those numbers. -}
addInputs :: CP Int Int
addInputs = undefined

{- 2 marks -}

{- 3.25 Using the 'sequ', define cpApply, which takes a process that
   returns a function, a process that returns a value and returns a
   process that returns the result of applying the function to the
   value. It ought to sequence the operations of the two processes so
   that the process that returns the function goes first. -}

cpApply :: CP x (a -> b) -> CP x a -> CP x b
cpApply pf pa = undefined

{- 2 marks -}

{- 3.26 Now write addInputs again, but this time using 'input',
   'cpApply', and End. -}

addInputs2 :: CP Int Int
addInputs2 = undefined

{- 1 mark -}

{----------------------------------------------------------------------}
{- 3.27 Translation of processes (TEST) -}

{- Sometimes, we might have a process that sends and receives values of
   type 'x', but we want a process that sends and receives values of
   type 'y'. Define a function 'translate' that takes two translation
   functions, one from 'x's to 'y's and one from 'y's to 'Maybe x's,
   and converts processes that communicate using 'x's into processes
   that communicate using 'y's. If the translation fails (because the
   second function returns 'Nothing'), then the process should Abort. -}

translate :: (x -> y) -> (y -> Maybe x) -> CP x a -> CP y a
translate = undefined

{- 3 marks -}

{- 3.28 Below we have defined functions stringToMaybeInt and intToString
   that translate back and forth between strings and integers. Use
   these functions and translate to define 'intsToStrings'. -}

stringToInt :: String -> Maybe Int
stringToInt = readMaybe

intToString :: Int -> String
intToString = show

intsToStrings :: CP Int a -> CP String a
intsToStrings = undefined

{- 1 mark -}
{----------------------------------------------------------------------}

{- 3.29 Piping one process's output into another input. Just as for
   'Process'es in Exercise 2, we can plug our processes together in
   parallel, feeding the outputs of one into the inputs of the
   other. Complete the definition of 'pipe', following the same
   specification as in Exercise 2, but noting that (a) if process two
   requires input that process one cannot give, then we abort; and (b)
   we must also handle the Abort cases from both processes. -}

pipe :: CP x a -> CP x b -> CP x b
pipe p1            (End b)       = undefined
pipe p1            (Output x p2) = undefined
pipe (End _)       (Input _)     = Abort
pipe (Output x p1) (Input p2)    = undefined
pipe (Input p1)    p2            = undefined
pipe Abort         _             = undefined
pipe _             Abort         = undefined

{- 5 marks -}

{- 3.30 Knock-knock jokes!

   Exhaustive research has discovered that users love it when their
   computers tell them jokes. It helps people think their machines are
   more than just unfeeling lumps of metal and plastic.

   To bring this vision into the present, you are asked to implement a
   generic "Knock Knock" joke telling process. The protocol for "Knock
   Knock" jokes is very rigid:

   1. Your process must output "Knock, Knock!"
   2. The response must be "Who's there?"
   3. Your process must output the 'who' string it has been provided with
   4. The response must be 'who ++ " who?"'
   5. Your process must output 'who ++ " " ++ clarification'
   6. The response must be "*LOL*"

   If at any point your process detects that the "Knock Knock" joke
   protocol has been violated, it must abort. You might find a nice
   way to package up the idea of 'input with expectations'. -}

knockKnocker :: String -> String -> CP String ()
knockKnocker who clarification =
  undefined

{- 2 marks -}

{----------------------------------------------------------------------}
{- 3.31 Expected Inputs (TEST)                                        -}

{- Define a function 'expectInput' that is given an expected input and
   returns a process that takes an input. If the input is as expected,
   then it returns '()' and otherwise it aborts. You may have already
   done this if you followed the hint above. -}

expectInput :: Eq a => a -> CP a ()
expectInput = undefined

{- 2 marks -}

{- 3.32 Write the other side of the "Knock Knock" protocol. The protocol
   to be followed must match the 'knockKnocker's protocol:

   1. You expect to receive 'Knock, Knock!"
   2. Your process must output "Who's there?"
   3. You must take any input 'who'
   4. Your process must respond with 'who ++ " who?"
   5. You must take any input as the punchline
   6. Your process must respond with "*LOL*". -}

knockKnockee :: CP String ()
knockKnockee =
  undefined
  
{- 3 marks -}

{- 3.33 Chatting (TEST)

   Write a function that records the chat between two processes,
   labelling each message that is sent. If either process Ends or
   Aborts, or one side is not listening when the other is sending,
   then the chat log finishes (but the messages successfully sent up
   to that point are returned).

   For example:

       chat ("A", Output "X" (Input (\_ -> End ())))
            ("B", Input (\_ -> Output "Y" (End ())))
     =
       [("A", "X"), ("B", "Y")]

   and

   chat ("A",knockKnocker "Euripedes" "trousers, you pay for these trousers!")
        ("B",knockKnockee)
     =
       [("A","Knock, Knock!"),
        ("B","Who's there?"),
        ("A","Euripedes"),
        ("B","Euripedes who?"),
        ("A","Euripedes trousers, you pay for these trousers!"),
        ("B","*LOL*")]  
-}

chat :: (l, CP x ()) -> (l, CP x ()) -> [(l, x)]
chat = undefined

{- 3 marks -}
{----------------------------------------------------------------------}
