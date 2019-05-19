ð.
9D:\git\Achei\backend\Extensions\ObjectExtensionMethods.cs
	namespace 	

Extensions
 
{ 
public		 

static		 
class		 "
ObjectExtensionMethods		 .
{

 
public 
static 
void  
CopiarPropriedadesDe /
(/ 0
this0 4
object5 ;
to< >
,> ?
object@ F
fromG K
)K L
{ 	
if 
( 
from 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$str0 6
,6 7
$str8 \
)\ ]
;] ^
}   
var"" 
fromProperties"" 
=""  
from""! %
.""% &
GetType""& -
(""- .
)"". /
.""/ 0
GetProperties""0 =
(""= >
)""> ?
;""? @
var## 
toProperties## 
=## 
to## !
.##! "
GetType##" )
(##) *
)##* +
.##+ ,
GetProperties##, 9
(##9 :
)##: ;
;##; <
IniciarCopia%% 
(%% 
toProperties%% %
,%%% &
fromProperties%%' 5
,%%5 6
to%%7 9
,%%9 :
from%%; ?
)%%? @
;%%@ A
}&& 	
public88 
static88 
void88 "
CopiarPropriedadesPara88 1
(881 2
this882 6
object887 =
from88> B
,88B C
object88D J
to88K M
)88M N
{99 	
if:: 
(:: 
to:: 
==:: 
null:: 
):: 
{;; 
throw<< 
new<< !
ArgumentNullException<< /
(<</ 0
$str<<0 4
,<<4 5
$str<<6 Z
)<<Z [
;<<[ \
}== 
var?? 
toProperties?? 
=?? 
to?? !
.??! "
GetType??" )
(??) *
)??* +
.??+ ,
GetProperties??, 9
(??9 :
)??: ;
;??; <
var@@ 
fromProperties@@ 
=@@  
from@@! %
.@@% &
GetType@@& -
(@@- .
)@@. /
.@@/ 0
GetProperties@@0 =
(@@= >
)@@> ?
;@@? @
IniciarCopiaBB 
(BB 
toPropertiesBB %
,BB% &
fromPropertiesBB' 5
,BB5 6
toBB7 9
,BB9 :
fromBB; ?
)BB? @
;BB@ A
}CC 	
privateOO 
staticOO 
voidOO 
IniciarCopiaOO (
(OO( )
PropertyInfoOO) 5
[OO5 6
]OO6 7
toPropertiesOO8 D
,OOD E
PropertyInfoOOF R
[OOR S
]OOS T
fromPropertiesOOU c
,OOc d
objectOOe k
toOOl n
,OOn o
objectOOp v
fromOOw {
)OO{ |
{PP 	
ValidarParametrosQQ 
(QQ 
toPropertiesQQ *
,QQ* +
fromPropertiesQQ, :
,QQ: ;
toQQ< >
,QQ> ?
fromQQ@ D
)QQD E
;QQE F
foreachSS 
(SS 
varSS 
fromPropertySS %
inSS& (
fromPropertiesSS) 7
)SS7 8
{TT 
foreachUU 
(UU 
varUU 

toPropertyUU '
inUU( *
toPropertiesUU+ 7
)UU7 8
{VV 
ifWW 
(WW 
fromPropertyWW $
.WW$ %
NameWW% )
==WW* ,

toPropertyWW- 7
.WW7 8
NameWW8 <
&&WW= ?
fromPropertyWW@ L
.WWL M
PropertyTypeWWM Y
==WWZ \

toPropertyWW] g
.WWg h
PropertyTypeWWh t
)WWt u
{XX 

toPropertyYY "
.YY" #
SetValueYY# +
(YY+ ,
toYY, .
,YY. /
fromPropertyYY0 <
.YY< =
GetValueYY= E
(YYE F
fromYYF J
)YYJ K
)YYK L
;YYL M
breakZZ 
;ZZ 
}[[ 
}\\ 
}]] 
}^^ 	
private`` 
static`` 
void`` 
ValidarParametros`` -
(``- .
PropertyInfo``. :
[``: ;
]``; <
toProperties``= I
,``I J
PropertyInfo``K W
[``W X
]``X Y
fromProperties``Z h
,``h i
object``j p
to``q s
,``s t
object``u {
from	``| €
)
``€ 
{aa 	
ifbb 
(bb 
toPropertiesbb 
==bb 
nullbb  $
)bb$ %
{cc 
throwdd 
newdd !
ArgumentNullExceptiondd /
(dd/ 0
$strdd0 >
,dd> ?
$strdd@ j
)ddj k
;ddk l
}ee 
elseff 
ifff 
(ff 
fromPropertiesff #
==ff$ &
nullff' +
)ff+ ,
{gg 
throwhh 
newhh !
ArgumentNullExceptionhh /
(hh/ 0
$strhh0 @
,hh@ A
$strhhB l
)hhl m
;hhm n
}ii 
elsejj 
ifjj 
(jj 
tojj 
==jj 
nulljj 
)jj  
{kk 
throwll 
newll !
ArgumentNullExceptionll /
(ll/ 0
$strll0 4
,ll4 5
$strll6 h
)llh i
;lli j
}mm 
elsenn 
ifnn 
(nn 
fromnn 
==nn 
nullnn !
)nn! "
{oo 
throwpp 
newpp !
ArgumentNullExceptionpp /
(pp/ 0
$strpp0 6
,pp6 7
$strpp8 j
)ppj k
;ppk l
}qq 
}rr 	
}ss 
}tt 