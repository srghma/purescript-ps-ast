module Test.Golden.DeclFixity.Actual where

import Language.PS.CST.Sugar (mkModuleName, nonQualifiedName)
import Language.PS.CST.Types (Declaration(..), Fixity(..), FixityOp(..), Ident(..), Module(..), OpName(..), ProperName(..))

import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Prelude (($))
import Data.Either (Either(..))

actualModule :: Module
actualModule = Module
  { moduleName: mkModuleName $ "DeclFixity" :| []
  , imports: []
  , exports: []
  , declarations:
    [ DeclFixity { comments: Nothing, fixityFields: { keyword: Infixl, precedence: 0, operator: FixityValue (Left $ nonQualifiedName $ Ident "compose") (OpName "<<") } }
    , DeclFixity { comments: Nothing, fixityFields: { keyword: Infix, precedence: 5, operator: FixityValue (Right $ nonQualifiedName $ ProperName "EQ") (OpName "===") } }
    , DeclFixity { comments: Nothing, fixityFields: { keyword: Infixr, precedence: 10, operator: FixityType (nonQualifiedName $ ProperName "NaturalTransformation") (OpName ">>") } }
    ]
  }
