#lang hackett/private/kernel

(require (only-in racket/base all-from-out)

         (except-in hackett/private/adt data)
         (except-in hackett/private/class class)

         hackett/data/list
         hackett/data/maybe

         hackett/private/prim
         hackett/private/provide)

(provide (all-from-out hackett/data/list)
         (all-from-out hackett/data/maybe)

         (data Unit) (data Bool) (data Tuple) (data Maybe) (data List)
         not or and if fst snd

         id compose const flip

         (class Eq) (class Show) (class Semigroup) (class Monoid)

         (class Functor) (rename-out [map <$>]) <&> <$ $> ignore
         (class Applicative) sequence traverse
         (class Monad) =<< >>= do ap

         seq error! undefined!
         IO main print println
         + - * quotient! remainder! < > <= >=
         string-length string-split

         (class Show)
         (class Eq))

;; ---------------------------------------------------------------------------------------------------

(def undefined! : (∀ [a] a)
  (error! "undefined!"))

(defn println : {String -> (IO Unit)}
  [[str] (do (print str)
             (print "\n"))])