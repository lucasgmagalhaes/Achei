Á

+D:\git\Achei\backend\Api\AuthorizeHandle.cs
	namespace 	
Api
 
{ 
public 

class 
AuthorizeHandle  
:! "!
IAuthorizationHandler# 8
{ 
public		 
Task		 
HandleAsync		 
(		  '
AuthorizationHandlerContext		  ;
context		< C
)		C D
{

 	
string 
email 
= 
context "
." #
User# '
.' (
Identity( 0
.0 1
Name1 5
;5 6
if 
( 
context 
. 
User 
. 
Identity %
.% &
IsAuthenticated& 5
)5 6
{ 
string 
database 
=  !
Session" )
.) * 
BuscarBancoDoUsuario* >
(> ?
email? D
)D E
;E F
if 
( 
database 
!= 
$str  "
)" #
{ 
ConnectionString $
.$ %
Database% -
=. /
database0 8
;8 9
} 
} 
return 
Task 
. 
CompletedTask %
;% &
} 	
} 
} ≠
9D:\git\Achei\backend\Api\Controllers\ApiControllerBase.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
	Authorize 
( 
$str 
) 
] 
public 

abstract 
class 
ApiControllerBase +
<+ ,
T, -
>- .
:/ 0
ControllerBase1 ?
{		 
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
abstract 
IActionResult %
Get& )
() *
)* +
;+ ,
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
abstract 
IActionResult %
Get& )
() *
long* .
id/ 1
)1 2
;2 3
[ 	
HttpPut	 
] 
public 
abstract 
IActionResult %
Put& )
() *
[* +
FromBody+ 3
]3 4
T4 5
entity6 <
)< =
;= >
[&& 	
HttpPost&&	 
]&& 
public'' 
abstract'' 
IActionResult'' %
Post''& *
(''* +
[''+ ,
FromBody'', 4
]''4 5
T''5 6
entidade''7 ?
)''? @
;''@ A
[.. 	

HttpDelete..	 
(.. 
$str.. 
).. 
].. 
public// 
abstract// 
IActionResult// %
Delete//& ,
(//, -
long//- 1
id//2 4
)//4 5
;//5 6
}00 
}11 ò2
>D:\git\Achei\backend\Api\Controllers\AutenticacaoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
AutenticacaoController '
:( )
ControllerBase* 8
{ 
[ 	
HttpPost	 
] 
[ 	
AllowAnonymous	 
] 
public 
object 
Post 
( 
[ 
FromBody 
] 
Usuario 
usuario %
,% &
[ 
FromServices 
]  
IAutenticacaoService /
autenticacaoService0 C
,C D
[ 
FromServices 
] !
SigningConfigurations /!
signingConfigurations0 E
,E F
[ 
FromServices 
] 
TokenConfigurations -
tokenConfigurations. A
)A B
{ 	
Usuario 
usuarioBase 
=  !
null" &
;& '
if 
( 
usuario 
!= 
null 
&&  "
!# $
string$ *
.* +
IsNullOrWhiteSpace+ =
(= >
usuario> E
.E F
EmailF K
)K L
)L M
{ 
try 
{ 
usuarioBase   
=    !
autenticacaoService  " 5
.  5 6
AutenticarUsuario  6 G
(  G H
usuario  H O
.  O P
Email  P U
,  U V
usuario  W ^
.  ^ _
Senha  _ d
)  d e
;  e f
if"" 
("" 
usuarioBase"" #
!=""$ &
null""' +
)""+ ,
{## 
if$$ 
($$ 
Session$$ #
.$$# $
IsUsuarioLogado$$$ 3
($$3 4
usuario$$4 ;
.$$; <
Email$$< A
)$$A B
)$$B C
{%% 
return&& "
new&&# &
{'' 
authenticated((  -
=((. /
false((0 5
,((5 6
message))  '
=))( )
$str))* :
}** 
;** 
}++ 
ClaimsIdentity-- &
identity--' /
=--0 1
new--2 5
ClaimsIdentity--6 D
(--D E
new.. 
GenericIdentity..  /
(../ 0
usuario..0 7
...7 8
Email..8 =
,..= >
$str..? F
)..F G
,..G H
new// 
[//  
]//  !
{//" #
new00 
Claim00 !
(00! "#
JwtRegisteredClaimNames00" 9
.009 :
Jti00: =
,00= >
Guid00? C
.00C D
NewGuid00D K
(00K L
)00L M
.00M N
ToString00N V
(00V W
$str00W Z
)00Z [
)00[ \
,00\ ]
new11 
Claim11 !
(11! "#
JwtRegisteredClaimNames11" 9
.119 :

UniqueName11: D
,11D E
usuario11F M
.11M N
Email11N S
)11S T
}22 
)33 
;33 
DateTime55  
dataCriacao55! ,
=55- .
DateTime55/ 7
.557 8
Now558 ;
;55; <
DateTime66  
dataExpiracao66! .
=66/ 0
dataCriacao661 <
+66= >
TimeSpan77 $
.77$ %
FromSeconds77% 0
(770 1
tokenConfigurations771 D
.77D E
Seconds77E L
)77L M
;77M N#
JwtSecurityTokenHandler99 /
handler990 7
=998 9
new99: =#
JwtSecurityTokenHandler99> U
(99U V
)99V W
;99W X
SecurityToken:: %
securityToken::& 3
=::4 5
handler::6 =
.::= >
CreateToken::> I
(::I J
new::J M#
SecurityTokenDescriptor::N e
{;; 
Issuer<< "
=<<# $
tokenConfigurations<<% 8
.<<8 9
Issuer<<9 ?
,<<? @
Audience== $
===% &
tokenConfigurations==' :
.==: ;
Audience==; C
,==C D
SigningCredentials>> .
=>>/ 0!
signingConfigurations>>1 F
.>>F G
SigningCredentials>>G Y
,>>Y Z
Subject?? #
=??$ %
identity??& .
,??. /
	NotBefore@@ %
=@@& '
dataCriacao@@( 3
,@@3 4
ExpiresAA #
=AA$ %
dataExpiracaoAA& 3
}BB 
)BB 
;BB 
stringCC 
tokenCC $
=CC% &
handlerCC' .
.CC. /

WriteTokenCC/ 9
(CC9 :
securityTokenCC: G
)CCG H
;CCH I
returnEE 
newEE "
{FF 
authenticatedGG )
=GG* +
trueGG, 0
,GG0 1
createdHH #
=HH$ %
dataCriacaoHH& 1
.HH1 2
ToStringHH2 :
(HH: ;
$strHH; P
)HHP Q
,HHQ R

expirationII &
=II' (
dataExpiracaoII) 6
.II6 7
ToStringII7 ?
(II? @
$strII@ U
)IIU V
,IIV W
tokenJJ !
=JJ" #
tokenJJ$ )
,JJ) *
messageKK #
=KK$ %
$strKK& *
,KK* +
usuarioLL #
=LL$ %
usuarioBaseLL& 1
}MM 
;MM 
}NN 
elseOO 
{PP 
returnQQ 
newQQ "
{RR 
authenticatedSS )
=SS* +
falseSS, 1
,SS1 2
messageTT #
=TT$ %
$strTT& @
}UU 
;UU 
}VV 
}WW 
catchXX 
(XX 
	ExceptionXX  
)XX  !
{YY 
returnZZ 
newZZ 
{ZZ  
messageZZ! (
=ZZ) *
$strZZ+ M
}ZZN O
;ZZO P
}[[ 
}\\ 
return]] 
new]] 
{]] 
message]]  
=]]! "
$str]]# 3
}]]4 5
;]]5 6
}^^ 	
}__ 
}`` ‡=
<D:\git\Achei\backend\Api\Controllers\ItemAchadoController.cs
	namespace

 	
Api


 
.

 
Controllers

 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class  
ItemAchadoController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IItemAchadoService +
itemAchadoService, =
;= >
private 
readonly 
IMapper  
mapper! '
;' (
public  
ItemAchadoController #
(# $
IItemAchadoService$ 6
itemAchadoService7 H
,H I
IMapperJ Q
mapperR X
)X Y
{ 	
this 
. 
itemAchadoService "
=# $
itemAchadoService% 6
;6 7
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
BuscarAchado )
() *
long* .
id/ 1
)1 2
{ 	
try 
{ 

ItemAchado 
achado !
=" #
itemAchadoService$ 5
.5 6
Buscar6 <
(< =
id= ?
)? @
;@ A
return 
Ok 
( 
achado  
)  !
;! "
}   
catch!! 
(!! 
	Exception!! 
e!! 
)!! 
{"" 
return## 

BadRequest## !
(##! "
e##" #
)### $
;##$ %
}$$ 
}%% 	
[,, 	
HttpPut,,	 
],, 
public-- 
IActionResult-- 
	Atualizar-- &
(--& '
[--' (
FromBody--( 0
]--0 1

ItemAchado--1 ;

itemAchado--< F
)--F G
{.. 	
try// 
{00 
itemAchadoService11 !
.11! "
	Atualizar11" +
(11+ ,

itemAchado11, 6
)116 7
;117 8
return22 
Ok22 
(22 
new22 
RequestResponse22 -
(22- .
)22. /
{220 1
message222 9
=22: ;
$str22< Y
,22Y Z
status22[ a
=22b c
$str22d i
}22j k
)22k l
;22l m
}33 
catch44 
(44 
	Exception44 
ex44 
)44  
{55 
return66 

BadRequest66 !
(66! "
new66" %
RequestResponse66& 5
(665 6
)666 7
{668 9
message66: A
=66B C
ex66D F
.66F G
Message66G N
,66N O
status66P V
=66W X
$str66Y ^
}66_ `
)66` a
;66a b
}77 
}88 	
[:: 	

HttpDelete::	 
(:: 
$str:: 
):: 
]:: 
public;; 
IActionResult;; 
Excluir;; $
(;;$ %
long;;% )
id;;* ,
);;, -
{<< 	
try== 
{>> 
itemAchadoService?? !
.??! "
Deletar??" )
(??) *
id??* ,
)??, -
;??- .
return@@ 
Ok@@ 
(@@ 
new@@ 
RequestResponse@@ -
(@@- .
)@@. /
{@@0 1
message@@2 9
=@@: ;
$str@@< W
,@@W X
status@@Y _
=@@` a
$str@@b g
}@@h i
)@@i j
;@@j k
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 

BadRequestDD !
(DD! "
newDD" %
RequestResponseDD& 5
(DD5 6
)DD6 7
{DD8 9
messageDD: A
=DDB C
exDDD F
.DDF G
MessageDDG N
,DDN O
statusDDP V
=DDW X
$strDDY ^
}DD_ `
)DD` a
;DDa b
}EE 
}FF 	
[HH 	
HttpPostHH	 
]HH 
publicII 
IActionResultII 
SalvarII #
(II# $
[II$ %
FromBodyII% -
]II- .

ItemAchadoII. 8

itemAchadoII9 C
)IIC D
{JJ 	
tryKK 
{LL 
itemAchadoServiceMM !
.MM! "
InserirMM" )
(MM) *

itemAchadoMM* 4
)MM4 5
;MM5 6
returnNN 
OkNN 
(NN 
newNN 
RequestResponseNN -
(NN- .
)NN. /
{NN0 1
messageNN2 9
=NN: ;
$strNN< Y
,NNY Z
statusNN[ a
=NNb c
$strNNd i
}NNj k
)NNk l
;NNl m
}OO 
catchPP 
(PP 
	ExceptionPP 
ePP 
)PP 
{QQ 
returnRR 

BadRequestRR !
(RR! "
eRR" #
)RR# $
;RR$ %
}SS 
}TT 	
[VV 	
HttpGetVV	 
(VV 
$strVV 
)VV 
]VV  
publicWW 
IActionResultWW #
BuscarRegiaoItemPerdidoWW 4
(WW4 5
longWW5 9
idWW: <
,WW< =
[WW> ?
FromServicesWW? K
]WWK L
IRegiaoServiceWWM [
regiaoServiceWW\ i
)WWi j
{XX 	
tryYY 
{ZZ 
Regiao[[ 
regiao[[ 
=[[ 
regiaoService[[  -
.[[- .
BuscarPorItemId[[. =
([[= >
id[[> @
)[[@ A
;[[A B
	RegiaoDto\\ 
dto\\ 
=\\ 
mapper\\  &
.\\& '
Map\\' *
<\\* +
	RegiaoDto\\+ 4
>\\4 5
(\\5 6
regiao\\6 <
)\\< =
;\\= >
return]] 
Ok]] 
(]] 
dto]] 
)]] 
;]] 
}^^ 
catch__ 
(__ 
	Exception__ 
e__ 
)__ 
{`` 
returnaa 

BadRequestaa !
(aa! "
eaa" #
)aa# $
;aa$ %
}bb 
}cc 	
[ee 	
HttpGetee	 
(ee 
$stree 
)ee 
]ee 
publicff 
IActionResultff  
BuscarTagItemPerdidoff 1
(ff1 2
longff2 6
idff7 9
,ff9 :
[ff; <
FromServicesff< H
]ffH I
ITagServiceffJ U

tagServiceffV `
)ff` a
{gg 	
tryhh 
{ii 
Listjj 
<jj 
Tagjj 
>jj 
tagsjj 
=jj  

tagServicejj! +
.jj+ ,
BuscarPorItemIdjj, ;
(jj; <
idjj< >
)jj> ?
;jj? @
Listkk 
<kk 
TagDtokk 
>kk 
dtoskk !
=kk" #
mapperkk$ *
.kk* +
Mapkk+ .
<kk. /
Listkk/ 3
<kk3 4
TagDtokk4 :
>kk: ;
>kk; <
(kk< =
tagskk= A
)kkA B
;kkB C
returnll 
Okll 
(ll 
dtosll 
)ll 
;ll  
}mm 
catchnn 
(nn 
	Exceptionnn 
enn 
)nn 
{oo 
returnpp 

BadRequestpp !
(pp! "
epp" #
)pp# $
;pp$ %
}qq 
}rr 	
}ss 
}tt Á?
=D:\git\Achei\backend\Api\Controllers\ItemPerdidoController.cs
	namespace

 	
Api


 
.

 
Controllers

 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class !
ItemPerdidoController &
:' (
ControllerBase) 7
{ 
private 
readonly 
IItemPerdidoService ,
itemPerdidoService- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public !
ItemPerdidoController $
($ %
IItemPerdidoService% 8
itemPerdidoService9 K
,K L
IMapperM T
mapperU [
)[ \
{ 	
this 
. 
itemPerdidoService #
=$ %
itemPerdidoService& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
BuscarPerdido *
(* +
long+ /
id0 2
)2 3
{ 	
try 
{ 
ItemPerdido 
perdido #
=$ %
itemPerdidoService& 8
.8 9
Buscar9 ?
(? @
id@ B
)B C
;C D
ItemPerdidoDto 
itemDto &
=' (
mapper) /
./ 0
Map0 3
<3 4
ItemPerdidoDto4 B
>B C
(C D
perdidoD K
)K L
;L M
return   
Ok   
(   
itemDto   !
)  ! "
;  " #
}!! 
catch"" 
("" 
	Exception"" 
e"" 
)"" 
{## 
return$$ 

BadRequest$$ !
($$! "
e$$" #
)$$# $
;$$$ %
}%% 
}&& 	
[-- 	
HttpPut--	 
]-- 
public.. 
IActionResult.. 
	Atualizar.. &
(..& '
[..' (
FromBody..( 0
]..0 1
ItemPerdido..1 <
itemPerdido..= H
)..H I
{// 	
try00 
{11 
itemPerdidoService22 "
.22" #
	Atualizar22# ,
(22, -
itemPerdido22- 8
)228 9
;229 :
return33 
Ok33 
(33 
new33 
RequestResponse33 -
(33- .
)33. /
{330 1
message332 9
=33: ;
$str33< Y
,33Y Z
status33[ a
=33b c
$str33d i
}33j k
)33k l
;33l m
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
return77 

BadRequest77 !
(77! "
new77" %
RequestResponse77& 5
(775 6
)776 7
{778 9
message77: A
=77B C
ex77D F
.77F G
Message77G N
,77N O
status77P V
=77W X
$str77Y ^
}77_ `
)77` a
;77a b
}88 
}99 	
[;; 	

HttpDelete;;	 
(;; 
$str;; 
);; 
];; 
public<< 
IActionResult<< 
Excluir<< $
(<<$ %
long<<% )
id<<* ,
)<<, -
{== 	
try>> 
{?? 
itemPerdidoService@@ "
.@@" #
Deletar@@# *
(@@* +
id@@+ -
)@@- .
;@@. /
returnAA 
OkAA 
(AA 
newAA 
RequestResponseAA -
(AA- .
)AA. /
{AA0 1
messageAA2 9
=AA: ;
$strAA< W
,AAW X
statusAAY _
=AA` a
$strAAb g
}AAh i
)AAi j
;AAj k
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 

BadRequestEE !
(EE! "
newEE" %
RequestResponseEE& 5
(EE5 6
)EE6 7
{EE8 9
messageEE: A
=EEB C
exEED F
.EEF G
MessageEEG N
,EEN O
statusEEP V
=EEW X
$strEEY ^
}EE_ `
)EE` a
;EEa b
}FF 
}GG 	
[II 	
HttpGetII	 
(II 
$strII 
)II 
]II  
publicJJ 
IActionResultJJ #
BuscarRegiaoItemPerdidoJJ 4
(JJ4 5
longJJ5 9
idJJ: <
,JJ< =
[JJ> ?
FromServicesJJ? K
]JJK L
IRegiaoServiceJJM [
regiaoServiceJJ\ i
)JJi j
{KK 	
tryLL 
{MM 
RegiaoNN 
regiaoNN 
=NN 
regiaoServiceNN  -
.NN- .
BuscarPorItemIdNN. =
(NN= >
idNN> @
)NN@ A
;NNA B
	RegiaoDtoOO 
dtoOO 
=OO 
mapperOO  &
.OO& '
MapOO' *
<OO* +
	RegiaoDtoOO+ 4
>OO4 5
(OO5 6
regiaoOO6 <
)OO< =
;OO= >
returnPP 
OkPP 
(PP 
dtoPP 
)PP 
;PP 
}QQ 
catchRR 
(RR 
	ExceptionRR 
eRR 
)RR 
{SS 
returnTT 

BadRequestTT !
(TT! "
eTT" #
)TT# $
;TT$ %
}UU 
}VV 	
[XX 	
HttpGetXX	 
(XX 
$strXX 
)XX 
]XX 
publicYY 
IActionResultYY  
BuscarTagItemPerdidoYY 1
(YY1 2
longYY2 6
idYY7 9
,YY9 :
[YY; <
FromServicesYY< H
]YYH I
ITagServiceYYJ U

tagServiceYYV `
)YY` a
{ZZ 	
try[[ 
{\\ 
List]] 
<]] 
Tag]] 
>]] 
tags]] 
=]]  

tagService]]! +
.]]+ ,
BuscarPorItemId]], ;
(]]; <
id]]< >
)]]> ?
;]]? @
List^^ 
<^^ 
TagDto^^ 
>^^ 
dtos^^ !
=^^" #
mapper^^$ *
.^^* +
Map^^+ .
<^^. /
List^^/ 3
<^^3 4
TagDto^^4 :
>^^: ;
>^^; <
(^^< =
tags^^= A
)^^A B
;^^B C
return__ 
Ok__ 
(__ 
dtos__ 
)__ 
;__  
}`` 
catchaa 
(aa 
	Exceptionaa 
eaa 
)aa 
{bb 
returncc 

BadRequestcc !
(cc! "
ecc" #
)cc# $
;cc$ %
}dd 
}ee 	
[gg 	
HttpPostgg	 
]gg 
publichh 
IActionResulthh 
Salvarhh #
(hh# $
[hh$ %
FromBodyhh% -
]hh- .
ItemPerdidohh. 9
itemPerdidohh: E
)hhE F
{ii 	
tryjj 
{kk 
itemPerdidoServicell "
.ll" #
Inserirll# *
(ll* +
itemPerdidoll+ 6
)ll6 7
;ll7 8
returnmm 
Okmm 
(mm 
newmm 
RequestResponsemm -
(mm- .
)mm. /
{mm0 1
messagemm2 9
=mm: ;
$strmm< Y
,mmY Z
statusmm[ a
=mmb c
$strmmd i
}mmj k
)mmk l
;mml m
}nn 
catchoo 
(oo 
	Exceptionoo 
eoo 
)oo 
{pp 
returnqq 

BadRequestqq !
(qq! "
eqq" #
)qq# $
;qq$ %
}rr 
}ss 	
}tt 
}uu Ú
8D:\git\Achei\backend\Api\Controllers\RegiaoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
RegiaoController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IRegiaoService '
regiaoService( 5
;5 6
private 
readonly 
IMapper  
mapper! '
;' (
public 
RegiaoController 
(  
IRegiaoService  .
regiaoService/ <
,< =
IMapper> E
mapperF L
)L M
{ 	
this 
. 
regiaoService 
=  
regiaoService! .
;. /
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
GetById $
($ %
long% )
id* ,
), -
{ 	
try 
{   
Regiao!! 
tag!! 
=!! 
this!! !
.!!! "
regiaoService!!" /
.!!/ 0
Buscar!!0 6
(!!6 7
id!!7 9
)!!9 :
;!!: ;
TagDto"" 
dto"" 
="" 
mapper"" #
.""# $
Map""$ '
<""' (
TagDto""( .
>"". /
(""/ 0
tag""0 3
)""3 4
;""4 5
return## 
Ok## 
(## 
dto## 
)## 
;## 
}$$ 
catch%% 
(%% 
	Exception%% 
e%% 
)%% 
{&& 
return'' 

BadRequest'' !
(''! "
e''" #
)''# $
;''$ %
}(( 
})) 	
}** 
}++ ˙
8D:\git\Achei\backend\Api\Controllers\StatusController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
StatusController !
:" #
ControllerBase$ 2
{ 
[		 	
HttpGet			 
(		 
)		 
]		 
public

 
IActionResult

 
Get

  
(

  !
)

! "
{ 	
return 
Ok 
( 
$str (
)( )
;) *
} 	
} 
} –
5D:\git\Achei\backend\Api\Controllers\TagController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
TagController 
:  
ControllerBase! /
{ 
private 
readonly 
ITagService $

tagService% /
;/ 0
private 
readonly 
IMapper  
mapper! '
;' (
public 
TagController 
( 
ITagService (

tagService) 3
,3 4
IMapper5 <
mapper= C
)C D
{ 	
this 
. 

tagService 
= 

tagService (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
GetTag #
(# $
long$ (
id) +
)+ ,
{ 	
try 
{ 
Tag 
tag 
= 
this 
. 

tagService )
.) *
Buscar* 0
(0 1
id1 3
)3 4
;4 5
TagDto   
dto   
=   
mapper   #
.  # $
Map  $ '
<  ' (
TagDto  ( .
>  . /
(  / 0
tag  0 3
)  3 4
;  4 5
return!! 
Ok!! 
(!! 
dto!! 
)!! 
;!! 
}"" 
catch## 
(## 
	Exception## 
e## 
)## 
{$$ 
return%% 

BadRequest%% !
(%%! "
e%%" #
)%%# $
;%%$ %
}&& 
}'' 	
}(( 
})) Á?
9D:\git\Achei\backend\Api\Controllers\UsuarioController.cs
	namespace		 	
Api		
 
.		 
Controllers		 
{

 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UsuarioController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUsuarioService (
usuarioService) 7
;7 8
public 
UsuarioController  
(  !
IUsuarioService! 0
usuarioService1 ?
)? @
{ 	
this 
. 
usuarioService 
=  !
usuarioService" 0
;0 1
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	
	Authorize	 
( 
$str 
) 
] 
public 
IActionResult 
Get  
(  !
long! %
id& (
)( )
{ 	
try 
{   
Usuario!! 
usuario!! 
=!!  !
usuarioService!!" 0
.!!0 1
Buscar!!1 7
(!!7 8
id!!8 :
)!!: ;
;!!; <
if"" 
("" 
usuario"" 
!="" 
null"" #
)""# $
{## 
return$$ 
Ok$$ 
($$ 
usuario$$ %
)$$% &
;$$& '
}%% 
else&& 
{'' 
return(( 
NotFound(( #
(((# $
$str(($ K
)((K L
;((L M
})) 
}** 
catch++ 
(++ 
	Exception++ 
ex++ 
)++  
{,, 
return-- 

BadRequest-- !
(--! "
ex--" $
.--$ %
Message--% ,
)--, -
;--- .
}.. 
}// 	
[66 	
HttpPost66	 
]66 
public77 
IActionResult77 
Post77 !
(77! "
[77" #
FromBody77# +
]77+ ,
Usuario77, 3
usuario774 ;
)77; <
{88 	
try99 
{:: 
Usuario;; 
user;; 
=;; 
usuarioService;; -
.<< 
Buscar<< 
(<< 
_usuario<< $
=><<% '
_usuario<<( 0
.<<0 1
Email<<1 6
==<<7 9
usuario<<: A
.<<A B
Email<<B G
)<<G H
.== 
SingleOrDefault== $
(==$ %
)==% &
;==& '
if?? 
(?? 
user?? 
!=?? 
null??  
)??  !
{@@ 
returnAA 

BadRequestAA %
(AA% &
newAA& )
{AA* +
messageAA, 3
=AA4 5
$strAA6 n
}AAo p
)AAp q
;AAq r
}BB 
usuarioServiceDD 
.DD 
InserirDD &
(DD& '
usuarioDD' .
)DD. /
;DD/ 0
returnEE 
OkEE 
(EE 
newEE 
RequestResponseEE -
(EE- .
)EE. /
{EE0 1
messageEE2 9
=EE: ;
$strEE< X
,EEX Y
statusEEZ `
=EEa b
$strEEc h
,EEh i
dataEEj n
=EEo p
usuarioEEq x
}EEy z
)EEz {
;EE{ |
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
returnII 

BadRequestII !
(II! "
newII" %
RequestResponseII& 5
(II5 6
)II6 7
{II8 9
messageII: A
=IIB C
exIID F
.IIF G
MessageIIG N
,IIN O
statusIIP V
=IIW X
$strIIY ^
}II_ `
)II` a
;IIa b
}JJ 
}KK 	
[RR 	
HttpPutRR	 
]RR 
[SS 	
	AuthorizeSS	 
(SS 
$strSS 
)SS 
]SS 
publicTT 
IActionResultTT 
	AtualizarTT &
(TT& '
[TT' (
FromBodyTT( 0
]TT0 1
UsuarioTT1 8
usuarioTT9 @
)TT@ A
{UU 	
tryVV 
{WW 
usuarioServiceXX 
.XX 
	AtualizarXX (
(XX( )
usuarioXX) 0
)XX0 1
;XX1 2
returnYY 
OkYY 
(YY 
newYY 
RequestResponseYY -
(YY- .
)YY. /
{YY0 1
messageYY2 9
=YY: ;
$strYY< \
,YY\ ]
statusYY^ d
=YYe f
$strYYg l
}YYm n
)YYn o
;YYo p
}ZZ 
catch[[ 
([[ 
	Exception[[ 
ex[[ 
)[[  
{\\ 
return]] 

BadRequest]] !
(]]! "
new]]" %
RequestResponse]]& 5
(]]5 6
)]]6 7
{]]8 9
message]]: A
=]]B C
ex]]D F
.]]F G
Message]]G N
,]]N O
status]]P V
=]]W X
$str]]Y ^
}]]_ `
)]]` a
;]]a b
}^^ 
}__ 	
[ff 	

HttpDeleteff	 
(ff 
$strff 
)ff 
]ff 
[gg 	
	Authorizegg	 
(gg 
$strgg 
)gg 
]gg 
publichh 
IActionResulthh 
Deletehh #
(hh# $
longhh$ (
idhh) +
)hh+ ,
{ii 	
usuarioServicejj 
.jj 
Deletarjj "
(jj" #
idjj# %
)jj% &
;jj& '
returnkk 
Okkk 
(kk 
)kk 
;kk 
}ll 	
[nn 	
HttpGetnn	 
(nn 
$strnn +
)nn+ ,
]nn, -
publicoo 
IActionResultoo 
BuscarItensAchadosoo /
(oo/ 0
longoo0 4
	usuarioIdoo5 >
,oo> ?
[oo@ A
FromServicesooA M
]ooM N
IItemAchadoServiceooO a
itemAchadoServiceoob s
)oos t
{pp 	
tryqq 
{rr 
Listss 
<ss 

ItemAchadoss 
>ss  
perdidosss! )
=ss* +
itemAchadoServicess, =
.ss= >
BuscarPorIdUsuarioss> P
(ssP Q
	usuarioIdssQ Z
)ssZ [
;ss[ \
returntt 
Oktt 
(tt 
perdidostt "
)tt" #
;tt# $
}uu 
catchvv 
(vv 
	Exceptionvv 
evv 
)vv 
{ww 
returnxx 

BadRequestxx !
(xx! "
exx" #
)xx# $
;xx$ %
}yy 
}zz 	
[|| 	
HttpGet||	 
(|| 
$str|| ,
)||, -
]||- .
public}} 
IActionResult}} 
BuscarItensPerdidos}} 0
(}}0 1
long}}1 5
	usuarioId}}6 ?
,}}? @
[}}A B
FromServices}}B N
]}}N O
IItemPerdidoService}}P c
itemPerdidoService}}d v
)}}v w
{~~ 	
try 
{
ÄÄ 
List
ÅÅ 
<
ÅÅ 
ItemPerdido
ÅÅ  
>
ÅÅ  !
perdidos
ÅÅ" *
=
ÅÅ+ , 
itemPerdidoService
ÅÅ- ?
.
ÅÅ? @ 
BuscarPorIdUsuario
ÅÅ@ R
(
ÅÅR S
	usuarioId
ÅÅS \
)
ÅÅ\ ]
;
ÅÅ] ^
return
ÇÇ 
Ok
ÇÇ 
(
ÇÇ 
perdidos
ÇÇ "
)
ÇÇ" #
;
ÇÇ# $
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
e
ÑÑ 
)
ÑÑ 
{
ÖÖ 
return
ÜÜ 

BadRequest
ÜÜ !
(
ÜÜ! "
e
ÜÜ" #
)
ÜÜ# $
;
ÜÜ$ %
}
áá 
}
àà 	
}
ââ 
}ää ‚
#D:\git\Achei\backend\Api\Program.cs
	namespace 	
Api
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	 
CreateWebHostBuilder		  
(		  !
args		! %
)		% &
.		& '
Build		' ,
(		, -
)		- .
.		. /
Run		/ 2
(		2 3
)		3 4
;		4 5
}

 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
{ 	
return 
WebHost 
.  
CreateDefaultBuilder /
(/ 0
args0 4
)4 5
.5 6

UseStartup6 @
<@ A
StartupA H
>H I
(I J
)J K
;K L
} 	
} 
} Ø
+D:\git\Achei\backend\Api\RequestResponse.cs
	namespace 	
Api
 
{ 
public 

class 
RequestResponse  
{ 
public 
string 
message 
; 
public 
string 
status 
; 
public 
object 
data 
; 
} 
}		 û&
#D:\git\Achei\backend\Api\Session.cs
	namespace 	
Api
 
{ 
public 

static 
class 
Session 
{ 
private		 
static		 
readonly		 

Dictionary		  *
<		* +
string		+ 1
,		1 2
string		3 9
>		9 :
usuarios		; C
;		C D
static 
Session 
( 
) 
{ 	
usuarios 
= 
new 

Dictionary %
<% &
string& ,
,, -
string. 4
>4 5
(5 6
)6 7
;7 8
} 	
public 
static 
bool 
IsUsuarioLogado *
(* +
string+ 1
email2 7
)7 8
{ 	
try 
{ 
string 
banco 
= 
usuarios '
[' (
email( -
]- .
;. /
return 
! 
string 
. 
IsNullOrEmpty ,
(, -
banco- 2
)2 3
;3 4
} 
catch 
{ 
return 
false 
; 
} 
} 	
public 
static 
int (
GetQuantidadeUsuariosLogados 6
(6 7
string7 =
banco> C
)C D
{ 	
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
banco& +
)+ ,
), -
{   
return!! 
usuarios!! 
.!!  
Where!!  %
(!!% &
usuario!!& -
=>!!. 0
usuario!!1 8
.!!8 9
Value!!9 >
==!!? A
banco!!B G
)!!G H
.!!H I
Count!!I N
(!!N O
)!!O P
;!!P Q
}"" 
throw## 
new## 
	Exception## 
(##  
$str##  J
)##J K
;##K L
}$$ 	
public&& 
static&& 
void&& "
AdicionarSessaoUsuario&& 1
(&&1 2
string&&2 8
email&&9 >
,&&> ?
string&&@ F
banco&&G L
)&&L M
{'' 	
if(( 
((( 
string(( 
.(( 
IsNullOrEmpty(( $
((($ %
email((% *
)((* +
||((, .
string((/ 5
.((5 6
IsNullOrEmpty((6 C
(((C D
banco((D I
)((I J
)((J K
{)) 
if** 
(** 
string** 
.** 
IsNullOrEmpty** (
(**( )
email**) .
)**. /
)**/ 0
{++ 
throw,, 
new,, 
	Exception,, '
(,,' (
$str,,( Q
),,Q R
;,,R S
}-- 
if// 
(// 
string// 
.// 
IsNullOrEmpty// (
(//( )
banco//) .
)//. /
)/// 0
{00 
throw11 
new11 
	Exception11 '
(11' (
$str11( Q
)11Q R
;11R S
}22 
}33 
usuarios44 
.44 
Add44 
(44 
email44 
,44 
banco44  %
)44% &
;44& '
}55 	
public77 
static77 
string77  
BuscarBancoDoUsuario77 1
(771 2
string772 8
email779 >
)77> ?
{88 	
try99 
{:: 
string;; 
banco;; 
=;; 
usuarios;; '
[;;' (
email;;( -
];;- .
;;;. /
if<< 
(<< 
!<< 
string<< 
.<< 
IsNullOrEmpty<< )
(<<) *
banco<<* /
)<</ 0
)<<0 1
{== 
return>> 
banco>>  
;>>  !
}?? 
return@@ 
$str@@ 
;@@ 
}AA 
catchBB 
{CC 
returnDD 
$strDD 
;DD 
}EE 
}FF 	
publicHH 
staticHH 
voidHH 
FinalizarSessaoHH *
(HH* +
stringHH+ 1
tokenHH2 7
)HH7 8
{II 	
ifJJ 
(JJ 
!JJ 
usuariosJJ 
.JJ 
RemoveJJ  
(JJ  !
tokenJJ! &
)JJ& '
)JJ' (
{KK 
throwLL 
newLL 
	ExceptionLL #
(LL# $
$strLL$ K
+LLL M
tokenLLN S
+LLT U
$strMM 9
)MM9 :
;MM: ;
}NN 
}OO 	
}PP 
}QQ ¬Ä
#D:\git\Achei\backend\Api\Startup.cs
	namespace 	
Api
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public   
Startup   
(   
IConfiguration   %
configuration  & 3
)  3 4
{!! 	
Configuration"" 
="" 
configuration"" )
;"") *
ConnectionString$$ 
.$$ 
Server$$ #
=$$$ %
configuration$$& 3
.$$3 4
GetValue$$4 <
<$$< =
string$$= C
>$$C D
($$D E
$str$$E ^
)$$^ _
;$$_ `
ConnectionString%% 
.%% 
Database%% %
=%%& '
configuration%%( 5
.%%5 6
GetValue%%6 >
<%%> ?
string%%? E
>%%E F
(%%F G
$str%%G b
)%%b c
;%%c d
ConnectionString&& 
.&& 
UserId&& #
=&&$ %
configuration&&& 3
.&&3 4
GetValue&&4 <
<&&< =
string&&= C
>&&C D
(&&D E
$str&&E ^
)&&^ _
;&&_ `
ConnectionString'' 
.'' 
Password'' %
=''& '
configuration''( 5
.''5 6
GetValue''6 >
<''> ?
string''? E
>''E F
(''F G
$str''G b
)''b c
;''c d
}(( 	
public++ 
void++ 
ConfigureServices++ %
(++% &
IServiceCollection++& 8
services++9 A
)++A B
{,, 	
services-- 
.-- 
AddCors-- 
(-- 
)-- 
;-- 
services.. 
... 
AddOData.. 
(.. 
).. 
;..  
services// 
.// 
AddMvc// 
(// 
)// 
.// #
SetCompatibilityVersion// 5
(//5 6 
CompatibilityVersion//6 J
.//J K
Version_2_2//K V
)//V W
;//W X
services11 
.11 
	AddScoped11 
(11 
typeof11 %
(11% &
ICrudService11& 2
<112 3
>113 4
)114 5
,115 6
typeof117 =
(11= >
CrudService11> I
<11I J
>11J K
)11K L
)11L M
;11M N
services22 
.22 
	AddScoped22 
(22 
typeof22 %
(22% & 
IAutenticacaoService22& :
)22: ;
,22; <
typeof22= C
(22C D
AutenticacaoService22D W
)22W X
)22X Y
;22Y Z
services33 
.33 
	AddScoped33 
(33 
typeof33 %
(33% &
IUsuarioService33& 5
)335 6
,336 7
typeof338 >
(33> ?
UsuarioService33? M
)33M N
)33N O
;33O P
services44 
.44 
	AddScoped44 
(44 
typeof44 %
(44% &
IItemAchadoService44& 8
)448 9
,449 :
typeof44; A
(44A B
ItemAchadoService44B S
)44S T
)44T U
;44U V
services55 
.55 
	AddScoped55 
(55 
typeof55 %
(55% &
IItemPerdidoService55& 9
)559 :
,55: ;
typeof55< B
(55B C
ItemPerdidoService55C U
)55U V
)55V W
;55W X
services66 
.66 
	AddScoped66 
(66 
typeof66 %
(66% &
IRegiaoService66& 4
)664 5
,665 6
typeof667 =
(66= >
RegiaoService66> K
)66K L
)66L M
;66M N
services77 
.77 
	AddScoped77 
(77 
typeof77 %
(77% &
ITagService77& 1
)771 2
,772 3
typeof774 :
(77: ;

TagService77; E
)77E F
)77F G
;77G H
services99 
.99 
Scan99 
(99 
scan99 
=>99 !
scan99" &
.99& '
FromCallingAssembly99' :
(99: ;
)99; <
.99< =

AddClasses99= G
(99G H
)99H I
.99I J
AsMatchingInterface99J ]
(99] ^
)99^ _
)99_ `
;99` a
services;; 
.;; 
AddSingleton;; !
<;;! " 
IHttpContextAccessor;;" 6
,;;6 7
HttpContextAccessor;;8 K
>;;K L
(;;L M
);;M N
;;;N O
services<< 
.<< 
AddSingleton<< !
<<<! "!
IAuthorizationHandler<<" 7
,<<7 8
AuthorizeHandle<<9 H
><<H I
(<<I J
)<<J K
;<<K L
services>> 
.>> 
AddDbContext>> !
<>>! " 
ApplicationDbContext>>" 6
>>>6 7
(>>7 8
)>>8 9
;>>9 :
varAA 
mappingConfigAA 
=AA 
newAA  #
MapperConfigurationAA$ 7
(AA7 8
mcAA8 :
=>AA; =
{BB 
mcCC 
.CC 
	CreateMapCC 
<CC 
TagCC  
,CC  !
TagDtoCC" (
>CC( )
(CC) *
)CC* +
;CC+ ,
mcDD 
.DD 
	CreateMapDD 
<DD 
ItemDD !
,DD! "
TagDtoDD# )
>DD) *
(DD* +
)DD+ ,
;DD, -
mcEE 
.EE 
	CreateMapEE 
<EE 
ItemPerdidoEE (
,EE( )
ItemPerdidoDtoEE* 8
>EE8 9
(EE9 :
)EE: ;
;EE; <
mcFF 
.FF 
	CreateMapFF 
<FF 

ItemAchadoFF '
,FF' (
ItemAchadoDtoFF) 6
>FF6 7
(FF7 8
)FF8 9
;FF9 :
mcGG 
.GG 
	CreateMapGG 
<GG 
RegiaoGG #
,GG# $
	RegiaoDtoGG% .
>GG. /
(GG/ 0
)GG0 1
;GG1 2
}HH 
)HH 
;HH 
IMapperJJ 
mapperJJ 
=JJ 
mappingConfigJJ *
.JJ* +
CreateMapperJJ+ 7
(JJ7 8
)JJ8 9
;JJ9 :
servicesKK 
.KK 
AddSingletonKK !
(KK! "
mapperKK" (
)KK( )
;KK) *#
ConfigureAuthenticationMM #
(MM# $
servicesMM$ ,
)MM, -
;MM- .
servicesPP 
.PP 
AddSwaggerGenPP "
(PP" #
cPP# $
=>PP% '
{QQ 
cRR 
.RR 

SwaggerDocRR 
(RR 
$strRR !
,RR! "
newRR# &
InfoRR' +
{RR, -
TitleRR. 3
=RR4 5
$strRR6 >
,RR> ?
VersionRR@ G
=RRH I
$strRRJ N
}RRO P
)RRP Q
;RRQ R
stringTT 
xmlFileTT 
=TT  
$"TT! #
{TT# $
AssemblyTT$ ,
.TT, - 
GetExecutingAssemblyTT- A
(TTA B
)TTB C
.TTC D
GetNameTTD K
(TTK L
)TTL M
.TTM N
NameTTN R
}TTR S
.xmlTTS W
"TTW X
;TTX Y
stringUU 
xmlPathUU 
=UU  
PathUU! %
.UU% &
CombineUU& -
(UU- .

AppContextUU. 8
.UU8 9
BaseDirectoryUU9 F
,UUF G
xmlFileUUH O
)UUO P
;UUP Q
cVV 
.VV 
IncludeXmlCommentsVV $
(VV$ %
xmlPathVV% ,
)VV, -
;VV- .
}WW 
)WW 
;WW 
}YY 	
public\\ 
void\\ 
	Configure\\ 
(\\ 
IApplicationBuilder\\ 1
app\\2 5
,\\5 6
IHostingEnvironment\\7 J
env\\K N
)\\N O
{]] 	
app^^ 
.^^ 
Use^^ 
(^^ 
async^^ 
(^^ 
ctx^^ 
,^^ 
next^^  $
)^^$ %
=>^^& (
{__ 
await`` 
next`` 
(`` 
)`` 
;`` 
ifaa 
(aa 
ctxaa 
.aa 
Responseaa  
.aa  !

StatusCodeaa! +
==aa, .
$numaa/ 2
)aa2 3
{bb 
ctxcc 
.cc 
Responsecc  
.cc  !
ContentLengthcc! .
=cc/ 0
$numcc1 2
;cc2 3
}dd 
}ee 
)ee 
;ee 
ifgg 
(gg 
envgg 
.gg 
IsDevelopmentgg !
(gg! "
)gg" #
)gg# $
{hh 
appii 
.ii %
UseDeveloperExceptionPageii -
(ii- .
)ii. /
;ii/ 0
appjj 
.jj 
UseCorsjj 
(jj 
builderjj #
=>jj$ &
builderjj' .
.jj. /
WithOriginsjj/ :
(jj: ;
$strjj; R
)jjR S
.kk 
AllowAnyHeaderkk 
(kk  
)kk  !
.ll 
AllowAnyMethodll 
(ll  
)ll  !
)ll! "
;ll" #
}mm 
elsenn 
{oo 
apppp 
.pp 
UseHstspp 
(pp 
)pp 
;pp 
}qq 
apptt 
.tt 

UseSwaggertt 
(tt 
)tt 
;tt 
appxx 
.xx 
UseSwaggerUIxx 
(xx 
cxx 
=>xx !
{yy 
czz 
.zz 
SwaggerEndpointzz !
(zz! "
$strzz" <
,zz< =
$strzz> L
)zzL M
;zzM N
}{{ 
){{ 
;{{ 
UpdateDatabase}} 
(}} 
app}} 
)}} 
;}}  
app~~ 
.~~ 
UseHttpsRedirection~~ #
(~~# $
)~~$ %
;~~% &
app 
. 
UseMvc 
( 
routerBuilder $
=>% '
{
ÄÄ 
routerBuilder
ÅÅ 
.
ÅÅ '
EnableDependencyInjection
ÅÅ 7
(
ÅÅ7 8
)
ÅÅ8 9
;
ÅÅ9 :
routerBuilder
ÇÇ 
.
ÇÇ 
Expand
ÇÇ $
(
ÇÇ$ %
)
ÇÇ% &
.
ÇÇ& '
Filter
ÇÇ' -
(
ÇÇ- .
)
ÇÇ. /
.
ÇÇ/ 0
Count
ÇÇ0 5
(
ÇÇ5 6
)
ÇÇ6 7
.
ÇÇ7 8
OrderBy
ÇÇ8 ?
(
ÇÇ? @
)
ÇÇ@ A
;
ÇÇA B
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
private
ÜÜ 
void
ÜÜ 
UpdateDatabase
ÜÜ #
(
ÜÜ# $!
IApplicationBuilder
ÜÜ$ 7
app
ÜÜ8 ;
)
ÜÜ; <
{
áá 	
using
àà 
(
àà 
IServiceScope
àà  
serviceScope
àà! -
=
àà. /
app
àà0 3
.
àà3 4!
ApplicationServices
àà4 G
.
ààG H 
GetRequiredService
ààH Z
<
ààZ ["
IServiceScopeFactory
àà[ o
>
àào p
(
ààp q
)
ààq r
.
ààr s
CreateScope
ààs ~
(
àà~ 
)àà Ä
)ààÄ Å
{
ââ 
using
ää 
(
ää "
ApplicationDbContext
ää +
context
ää, 3
=
ää4 5
serviceScope
ää6 B
.
ääB C
ServiceProvider
ääC R
.
ääR S

GetService
ääS ]
<
ää] ^"
ApplicationDbContext
ää^ r
>
äär s
(
ääs t
)
äät u
)
ääu v
{
ãã 
context
åå 
.
åå 
Database
åå $
.
åå$ %
Migrate
åå% ,
(
åå, -
)
åå- .
;
åå. /
}
çç 
}
éé 
}
èè 	
private
ëë 
void
ëë %
ConfigureAuthentication
ëë ,
(
ëë, - 
IServiceCollection
ëë- ?
services
ëë@ H
)
ëëH I
{
íí 	#
SigningConfigurations
ìì !#
signingConfigurations
ìì" 7
=
ìì8 9
new
ìì: =#
SigningConfigurations
ìì> S
(
ììS T
)
ììT U
;
ììU V
services
îî 
.
îî 
AddSingleton
îî !
(
îî! "#
signingConfigurations
îî" 7
)
îî7 8
;
îî8 9!
TokenConfigurations
ññ !
tokenConfigurations
ññ  3
=
ññ4 5
new
ññ6 9!
TokenConfigurations
ññ: M
(
ññM N
)
ññN O
;
ññO P
new
óó /
!ConfigureFromConfigurationOptions
óó 1
<
óó1 2!
TokenConfigurations
óó2 E
>
óóE F
(
óóF G
Configuration
òò 
.
òò 

GetSection
òò (
(
òò( )
$str
òò) >
)
òò> ?
)
òò? @
.
ôô 
	Configure
ôô 
(
ôô !
tokenConfigurations
ôô 2
)
ôô2 3
;
ôô3 4
services
öö 
.
öö 
AddSingleton
öö !
(
öö! "!
tokenConfigurations
öö" 5
)
öö5 6
;
öö6 7
services
ùù 
.
ùù 
AddAuthentication
ùù &
(
ùù& '
authOptions
ùù' 2
=>
ùù3 5
{
ûû 
authOptions
üü 
.
üü '
DefaultAuthenticateScheme
üü 5
=
üü6 7
JwtBearerDefaults
üü8 I
.
üüI J"
AuthenticationScheme
üüJ ^
;
üü^ _
authOptions
†† 
.
†† $
DefaultChallengeScheme
†† 2
=
††3 4
JwtBearerDefaults
††5 F
.
††F G"
AuthenticationScheme
††G [
;
††[ \
}
°° 
)
°° 
.
°° 
AddJwtBearer
°° 
(
°° 
bearerOptions
°° )
=>
°°* ,
{
¢¢ 
	Microsoft
££ 
.
££ 
IdentityModel
££ '
.
££' (
Tokens
££( .
.
££. /'
TokenValidationParameters
££/ H
paramsValidation
££I Y
=
££Z [
bearerOptions
££\ i
.
££i j(
TokenValidationParameters££j É
;££É Ñ
paramsValidation
§§  
.
§§  !
IssuerSigningKey
§§! 1
=
§§2 3#
signingConfigurations
§§4 I
.
§§I J
Key
§§J M
;
§§M N
paramsValidation
••  
.
••  !
ValidAudience
••! .
=
••/ 0!
tokenConfigurations
••1 D
.
••D E
Audience
••E M
;
••M N
paramsValidation
¶¶  
.
¶¶  !
ValidIssuer
¶¶! ,
=
¶¶- .!
tokenConfigurations
¶¶/ B
.
¶¶B C
Issuer
¶¶C I
;
¶¶I J
paramsValidation
©©  
.
©©  !&
ValidateIssuerSigningKey
©©! 9
=
©©: ;
true
©©< @
;
©©@ A
paramsValidation
¨¨  
.
¨¨  !
ValidateLifetime
¨¨! 1
=
¨¨2 3
true
¨¨4 8
;
¨¨8 9
paramsValidation
±±  
.
±±  !
	ClockSkew
±±! *
=
±±+ ,
TimeSpan
±±- 5
.
±±5 6
Zero
±±6 :
;
±±: ;
}
≤≤ 
)
≤≤ 
;
≤≤ 
services
∂∂ 
.
∂∂ 
AddAuthorization
∂∂ %
(
∂∂% &
auth
∂∂& *
=>
∂∂+ -
{
∑∑ 
auth
∏∏ 
.
∏∏ 
	AddPolicy
∏∏ 
(
∏∏ 
$str
∏∏ '
,
∏∏' (
new
∏∏) ,(
AuthorizationPolicyBuilder
∏∏- G
(
∏∏G H
)
∏∏H I
.
ππ &
AddAuthenticationSchemes
ππ -
(
ππ- .
JwtBearerDefaults
ππ. ?
.
ππ? @"
AuthenticationScheme
ππ@ T
)
ππT U
.
∫∫ &
RequireAuthenticatedUser
∫∫ -
(
∫∫- .
)
∫∫. /
.
∫∫/ 0
Build
∫∫0 5
(
∫∫5 6
)
∫∫6 7
)
∫∫7 8
;
∫∫8 9
}
ªª 
)
ªª 
;
ªª 
}
ºº 	
}
ΩΩ 
}ææ Ó

7D:\git\Achei\backend\Api\Token\SigningConfigurations.cs
	namespace 	
Api
 
. 
Token 
{ 
public 

class !
SigningConfigurations &
{ 
public 
SecurityKey 
Key 
{  
get! $
;$ %
}& '
public		 
SigningCredentials		 !
SigningCredentials		" 4
{		5 6
get		7 :
;		: ;
}		< =
public !
SigningConfigurations $
($ %
)% &
{ 	
using 
( $
RSACryptoServiceProvider +
provider, 4
=5 6
new7 :$
RSACryptoServiceProvider; S
(S T
$numT X
)X Y
)Y Z
{ 
Key 
= 
new 
RsaSecurityKey (
(( )
provider) 1
.1 2
ExportParameters2 B
(B C
trueC G
)G H
)H I
;I J
} 
SigningCredentials 
=  
new! $
SigningCredentials% 7
(7 8
Key 
, 
SecurityAlgorithms '
.' (
RsaSha256Signature( :
): ;
;; <
} 	
} 
} Õ
5D:\git\Achei\backend\Api\Token\TokenConfigurations.cs
	namespace 	
Api
 
. 
Token 
{ 
public 

class 
TokenConfigurations $
{ 
public		 
string		 
Audience		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Issuer

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
Seconds 
{ 
get  
;  !
set" %
;% &
}' (
} 
} 