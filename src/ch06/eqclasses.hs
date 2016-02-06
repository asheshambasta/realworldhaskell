-- file: ch06/eqclasses.hs

data Colour =   Red
                | Green
                | Blue
                | White

instance Show Colour where
    show Red    = "Red"
    show Green  = "Green"
    show Blue   = "Blue"
    show White  = "White"

-- the code below doesn't compile.
{-eqclasses.hs:15:5: ‘read’ is not a (visible) method of class ‘Read’
Failed, modules loaded: none.-}
{-instance Read Colour where
    read "Red"      = Red
    read "Green"    = Green
    read "Blue"     = Blue
    read "White"    = White-}

class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Bool where
    isEqual True    True    = True
    isEqual False   False   = True
    isEqual _       _       = False

class BasicEq2 a where
    isEqual2 :: a -> a -> Bool
    isNotEqual2 :: a -> a -> Bool

class BasicEq3 a where
    isEqual3 :: a -> a -> Bool
    isEqual3 x y = not (isNotEqual3 x y)

    isNotEqual3 :: a -> a -> Bool
    isNotEqual3 x y = not (isEqual3 x y)

instance BasicEq3 Colour where
    isEqual3 Red    Red     = True
    isEqual3 Green  Green   = True
    isEqual3 Blue   Blue    = True
    isEqual3 _      _       = False
