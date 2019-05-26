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
} ®
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
abstract 
ActionResult $
Get% (
(( )
)) *
;* +
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
abstract 
ActionResult $
Get% (
(( )
long) -
id. 0
)0 1
;1 2
[ 	
HttpPut	 
] 
public 
abstract 
ActionResult $
Put% (
(( )
[) *
FromBody* 2
]2 3
T3 4
entity5 ;
); <
;< =
[&& 	
HttpPost&&	 
]&& 
public'' 
abstract'' 
ActionResult'' $
Post''% )
('') *
[''* +
FromBody''+ 3
]''3 4
T''4 5
entidade''6 >
)''> ?
;''? @
[.. 	

HttpDelete..	 
(.. 
$str.. 
).. 
].. 
public// 
abstract// 
ActionResult// $
Delete//% +
(//+ ,
long//, 0
id//1 3
)//3 4
;//4 5
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
}`` ⁄=
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
public 
ActionResult 
BuscarAchado (
(( )
long) -
id. 0
)0 1
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
public-- 
ActionResult-- 
	Atualizar-- %
(--% &
[--& '
FromBody--' /
]--/ 0

ItemAchado--0 :

itemAchado--; E
)--E F
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
public;; 
ActionResult;; 
Excluir;; #
(;;# $
long;;$ (
id;;) +
);;+ ,
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
publicII 
ActionResultII 
SalvarII "
(II" #
[II# $
FromBodyII$ ,
]II, -

ItemAchadoII- 7

itemAchadoII8 B
)IIB C
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
publicWW 
ActionResultWW #
BuscarRegiaoItemPerdidoWW 3
(WW3 4
longWW4 8
idWW9 ;
,WW; <
[WW= >
FromServicesWW> J
]WWJ K
IRegiaoServiceWWL Z
regiaoServiceWW[ h
)WWh i
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
publicff 
ActionResultff  
BuscarTagItemPerdidoff 0
(ff0 1
longff1 5
idff6 8
,ff8 9
[ff: ;
FromServicesff; G
]ffG H
ITagServiceffI T

tagServiceffU _
)ff_ `
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
}tt ¯J
=D:\git\Achei\backend\Api\Controllers\ItemPerdidoController.cs
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
class !
ItemPerdidoController &
:' (
ControllerBase) 7
{ 
private 
readonly 
IItemPerdidoService ,
itemPerdidoService- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public !
ItemPerdidoController $
($ %
IItemPerdidoService% 8
itemPerdidoService9 K
,K L
IMapperM T
mapperU [
)[ \
{ 	
this 
. 
itemPerdidoService #
=$ %
itemPerdidoService& 8
;8 9
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
BuscarPerdido )
() *
long* .
id/ 1
)1 2
{ 	
try 
{ 
if   
(   
id   
<=   
$num   
)   
{!! 
return"" 

BadRequest"" %
(""% &
$str""& 3
)""3 4
;""4 5
}## 
ItemPerdido%% 
perdido%% #
=%%$ %
itemPerdidoService%%& 8
.%%8 9
Buscar%%9 ?
(%%? @
id%%@ B
)%%B C
;%%C D
if'' 
('' 
perdido'' 
=='' 
null'' #
)''# $
{(( 
return)) 
NotFound)) #
())# $
$str))$ 5
)))5 6
;))6 7
}** 
ItemPerdidoDto,, 
itemDto,, &
=,,' (
mapper,,) /
.,,/ 0
Map,,0 3
<,,3 4
ItemPerdidoDto,,4 B
>,,B C
(,,C D
perdido,,D K
),,K L
;,,L M
return-- 
Ok-- 
(-- 
itemDto-- !
)--! "
;--" #
}.. 
catch// 
(// 
	Exception// 
e// 
)// 
{00 
return11 

StatusCode11 !
(11! "
StatusCodes11" -
.11- .(
Status500InternalServerError11. J
,11J K
e11L M
)11M N
;11N O
}22 
}33 	
[:: 	
HttpPut::	 
]:: 
public;; 
ActionResult;; 
	Atualizar;; %
(;;% &
[;;& '
FromBody;;' /
];;/ 0
ItemPerdido;;0 ;
itemPerdido;;< G
);;G H
{<< 	
try== 
{>> 
if?? 
(?? 
itemPerdido?? 
==??  "
null??# '
)??' (
{@@ 
returnAA 

BadRequestAA %
(AA% &
$strAA& :
)AA: ;
;AA; <
}BB 
itemPerdidoServiceDD "
.DD" #
	AtualizarDD# ,
(DD, -
itemPerdidoDD- 8
)DD8 9
;DD9 :
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
$strEE< Y
,EEY Z
statusEE[ a
=EEb c
$strEEd i
}EEj k
)EEk l
;EEl m
}FF 
catchGG 
(GG #
EntityNotFoundExceptionGG *
exGG+ -
)GG- .
{HH 
returnII 
NotFoundII 
(II  
exII  "
.II" #
MessageII# *
)II* +
;II+ ,
}JJ 
catchKK 
(KK 
	ExceptionKK 
exKK 
)KK  
{LL 
returnMM 

StatusCodeMM !
(MM! "
StatusCodesMM" -
.MM- .(
Status500InternalServerErrorMM. J
,MMJ K
exMML N
)MMN O
;MMO P
}NN 
}OO 	
[QQ 	

HttpDeleteQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
publicRR 
ActionResultRR 
ExcluirRR #
(RR# $
longRR$ (
idRR) +
)RR+ ,
{SS 	
tryTT 
{UU 
ifVV 
(VV 
idVV 
<=VV 
$numVV 
)VV 
{WW 
returnXX 

BadRequestXX %
(XX% &
$strXX& 3
)XX3 4
;XX4 5
}YY 
itemPerdidoService[[ "
.[[" #
Deletar[[# *
([[* +
id[[+ -
)[[- .
;[[. /
return\\ 
Ok\\ 
(\\ 
new\\ 
RequestResponse\\ -
(\\- .
)\\. /
{\\0 1
message\\2 9
=\\: ;
$str\\< W
,\\W X
status\\Y _
=\\` a
$str\\b g
}\\h i
)\\i j
;\\j k
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
return`` 

StatusCode`` !
(``! "
StatusCodes``" -
.``- .(
Status500InternalServerError``. J
,``J K
ex``L N
)``N O
;``O P
}aa 
}bb 	
[dd 	
HttpGetdd	 
(dd 
$strdd 
)dd 
]dd  
publicee 
ActionResultee #
BuscarRegiaoItemPerdidoee 3
(ee3 4
longee4 8
idee9 ;
,ee; <
[ee= >
FromServicesee> J
]eeJ K
IRegiaoServiceeeL Z
regiaoServiceee[ h
)eeh i
{ff 	
trygg 
{hh 
Regiaoii 
regiaoii 
=ii 
regiaoServiceii  -
.ii- .
BuscarPorItemIdii. =
(ii= >
idii> @
)ii@ A
;iiA B
	RegiaoDtojj 
dtojj 
=jj 
mapperjj  &
.jj& '
Mapjj' *
<jj* +
	RegiaoDtojj+ 4
>jj4 5
(jj5 6
regiaojj6 <
)jj< =
;jj= >
returnkk 
Okkk 
(kk 
dtokk 
)kk 
;kk 
}ll 
catchmm 
(mm 
	Exceptionmm 
emm 
)mm 
{nn 
returnoo 

StatusCodeoo !
(oo! "
StatusCodesoo" -
.oo- .(
Status500InternalServerErroroo. J
,ooJ K
eooL M
)ooM N
;ooN O
}pp 
}qq 	
[ss 	
HttpGetss	 
(ss 
$strss 
)ss 
]ss 
publictt 
ActionResulttt  
BuscarTagItemPerdidott 0
(tt0 1
longtt1 5
idtt6 8
,tt8 9
[tt: ;
FromServicestt; G
]ttG H
ITagServicettI T

tagServicettU _
)tt_ `
{uu 	
tryvv 
{ww 
Listxx 
<xx 
Tagxx 
>xx 
tagsxx 
=xx  

tagServicexx! +
.xx+ ,
BuscarPorItemIdxx, ;
(xx; <
idxx< >
)xx> ?
;xx? @
Listyy 
<yy 
TagDtoyy 
>yy 
dtosyy !
=yy" #
mapperyy$ *
.yy* +
Mapyy+ .
<yy. /
Listyy/ 3
<yy3 4
TagDtoyy4 :
>yy: ;
>yy; <
(yy< =
tagsyy= A
)yyA B
;yyB C
returnzz 
Okzz 
(zz 
dtoszz 
)zz 
;zz  
}{{ 
catch|| 
(|| 
	Exception|| 
e|| 
)|| 
{}} 
return~~ 

StatusCode~~ !
(~~! "
StatusCodes~~" -
.~~- .(
Status500InternalServerError~~. J
,~~J K
e~~L M
)~~M N
;~~N O
} 
}
ÄÄ 	
[
ÇÇ 	
HttpPost
ÇÇ	 
]
ÇÇ 
public
ÉÉ 
ActionResult
ÉÉ 
Salvar
ÉÉ "
(
ÉÉ" #
[
ÉÉ# $
FromBody
ÉÉ$ ,
]
ÉÉ, -
ItemPerdido
ÉÉ- 8
itemPerdido
ÉÉ9 D
)
ÉÉD E
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ  
itemPerdidoService
áá "
.
áá" #
Inserir
áá# *
(
áá* +
itemPerdido
áá+ 6
)
áá6 7
;
áá7 8
return
àà 
Ok
àà 
(
àà 
new
àà 
RequestResponse
àà -
(
àà- .
)
àà. /
{
àà0 1
message
àà2 9
=
àà: ;
$str
àà< Y
,
ààY Z
status
àà[ a
=
ààb c
$str
ààd i
}
ààj k
)
ààk l
;
ààl m
}
ââ 
catch
ää 
(
ää 
	Exception
ää 
e
ää 
)
ää 
{
ãã 
return
åå 

StatusCode
åå !
(
åå! "
StatusCodes
åå" -
.
åå- .*
Status500InternalServerError
åå. J
,
ååJ K
e
ååL M
)
ååM N
;
ååN O
}
çç 
}
éé 	
}
èè 
}êê –
8D:\git\Achei\backend\Api\Controllers\RegiaoController.cs
	namespace 	
Api
 
. 
Controllers 
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
RegiaoController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IRegiaoService '
regiaoService( 5
;5 6
private 
readonly 
IMapper  
mapper! '
;' (
public 
RegiaoController 
(  
IRegiaoService  .
regiaoService/ <
,< =
IMapper> E
mapperF L
)L M
{ 	
this 
. 
regiaoService 
=  
regiaoService! .
;. /
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
GetById #
(# $
long$ (
id) +
)+ ,
{ 	
try 
{ 
Regiao 
tag 
= 
regiaoService *
.* +
Buscar+ 1
(1 2
id2 4
)4 5
;5 6
TagDto 
dto 
= 
mapper #
.# $
Map$ '
<' (
TagDto( .
>. /
(/ 0
tag0 3
)3 4
;4 5
return 
Ok 
( 
dto 
) 
; 
} 
catch   
(   
	Exception   
e   
)   
{!! 
return"" 

BadRequest"" !
(""! "
e""" #
)""# $
;""$ %
}## 
}$$ 	
}%% 
}&& ˘
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
 
ActionResult

 
Get

 
(

  
)

  !
{ 	
return 
Ok 
( 
$str (
)( )
;) *
} 	
} 
} Æ
5D:\git\Achei\backend\Api\Controllers\TagController.cs
	namespace 	
Api
 
. 
Controllers 
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
TagController 
:  
ControllerBase! /
{ 
private 
readonly 
ITagService $

tagService% /
;/ 0
private 
readonly 
IMapper  
mapper! '
;' (
public 
TagController 
( 
ITagService (

tagService) 3
,3 4
IMapper5 <
mapper= C
)C D
{ 	
this 
. 

tagService 
= 

tagService (
;( )
this 
. 
mapper 
= 
mapper  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
GetTag "
(" #
long# '
id( *
)* +
{ 	
try 
{ 
Tag 
tag 
= 

tagService $
.$ %
Buscar% +
(+ ,
id, .
). /
;/ 0
TagDto 
dto 
= 
mapper #
.# $
Map$ '
<' (
TagDto( .
>. /
(/ 0
tag0 3
)3 4
;4 5
return 
Ok 
( 
dto 
) 
; 
} 
catch 
( 
	Exception 
e 
) 
{   
return!! 

BadRequest!! !
(!!! "
e!!" #
)!!# $
;!!$ %
}"" 
}## 	
}$$ 
}%% ·?
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
public 
ActionResult 
Get 
(  
long  $
id% '
)' (
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
public77 
ActionResult77 
Post77  
(77  !
[77! "
FromBody77" *
]77* +
Usuario77+ 2
usuario773 :
)77: ;
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
publicTT 
ActionResultTT 
	AtualizarTT %
(TT% &
[TT& '
FromBodyTT' /
]TT/ 0
UsuarioTT0 7
usuarioTT8 ?
)TT? @
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
publichh 
ActionResulthh 
Deletehh "
(hh" #
longhh# '
idhh( *
)hh* +
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
publicoo 
ActionResultoo 
BuscarItensAchadosoo .
(oo. /
longoo/ 3
	usuarioIdoo4 =
,oo= >
[oo? @
FromServicesoo@ L
]ooL M
IItemAchadoServiceooN `
itemAchadoServiceooa r
)oor s
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
public}} 
ActionResult}} 
BuscarItensPerdidos}} /
(}}/ 0
long}}0 4
	usuarioId}}5 >
,}}> ?
[}}@ A
FromServices}}A M
]}}M N
IItemPerdidoService}}O b
itemPerdidoService}}c u
)}}u v
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
}ää ¸
"D:\git\Achei\backend\Api\Mapper.cs
	namespace 	
Api
 
{ 
public 

static 
class 

Mapeamento "
{		 
public

 
static

 
IMapper

 
Criar

 #
(

# $
)

$ %
{ 	
MapperConfiguration 
mappingConfig  -
=. /
new0 3
MapperConfiguration4 G
(G H
mcH J
=>K M
{ 
mc 
. 
	CreateMap 
< 
Tag  
,  !
TagDto" (
>( )
() *
)* +
;+ ,
mc 
. 
	CreateMap 
< 
Item !
,! "
TagDto# )
>) *
(* +
)+ ,
;, -
mc 
. 
	CreateMap 
< 
ItemPerdido (
,( )
ItemPerdidoDto* 8
>8 9
(9 :
): ;
;; <
mc 
. 
	CreateMap 
< 

ItemAchado '
,' (
ItemAchadoDto) 6
>6 7
(7 8
)8 9
;9 :
mc 
. 
	CreateMap 
< 
Regiao #
,# $
	RegiaoDto% .
>. /
(/ 0
)0 1
;1 2
} 
) 
; 
return 
mappingConfig  
.  !
CreateMapper! -
(- .
). /
;/ 0
} 	
} 
} ‚
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
}QQ ¥|
#D:\git\Achei\backend\Api\Startup.cs
	namespace 	
Api
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
ConnectionString!! 
.!! 
Server!! #
=!!$ %
configuration!!& 3
.!!3 4
GetValue!!4 <
<!!< =
string!!= C
>!!C D
(!!D E
$str!!E ^
)!!^ _
;!!_ `
ConnectionString"" 
."" 
Database"" %
=""& '
configuration""( 5
.""5 6
GetValue""6 >
<""> ?
string""? E
>""E F
(""F G
$str""G b
)""b c
;""c d
ConnectionString## 
.## 
UserId## #
=##$ %
configuration##& 3
.##3 4
GetValue##4 <
<##< =
string##= C
>##C D
(##D E
$str##E ^
)##^ _
;##_ `
ConnectionString$$ 
.$$ 
Password$$ %
=$$& '
configuration$$( 5
.$$5 6
GetValue$$6 >
<$$> ?
string$$? E
>$$E F
($$F G
$str$$G b
)$$b c
;$$c d
}%% 	
public(( 
void(( 
ConfigureServices(( %
(((% &
IServiceCollection((& 8
services((9 A
)((A B
{)) 	
services** 
.** 
AddCors** 
(** 
)** 
;** 
services++ 
.++ 
AddOData++ 
(++ 
)++ 
;++  
services,, 
.,, 
AddMvc,, 
(,, 
),, 
.,, #
SetCompatibilityVersion,, 5
(,,5 6 
CompatibilityVersion,,6 J
.,,J K
Version_2_2,,K V
),,V W
;,,W X
services.. 
... 
	AddScoped.. 
(.. 
typeof.. %
(..% &
ICrudService..& 2
<..2 3
>..3 4
)..4 5
,..5 6
typeof..7 =
(..= >
CrudService..> I
<..I J
>..J K
)..K L
)..L M
;..M N
services// 
.// 
	AddScoped// 
(// 
typeof// %
(//% & 
IAutenticacaoService//& :
)//: ;
,//; <
typeof//= C
(//C D
AutenticacaoService//D W
)//W X
)//X Y
;//Y Z
services00 
.00 
	AddScoped00 
(00 
typeof00 %
(00% &
IUsuarioService00& 5
)005 6
,006 7
typeof008 >
(00> ?
UsuarioService00? M
)00M N
)00N O
;00O P
services11 
.11 
	AddScoped11 
(11 
typeof11 %
(11% &
IItemAchadoService11& 8
)118 9
,119 :
typeof11; A
(11A B
ItemAchadoService11B S
)11S T
)11T U
;11U V
services22 
.22 
	AddScoped22 
(22 
typeof22 %
(22% &
IItemPerdidoService22& 9
)229 :
,22: ;
typeof22< B
(22B C
ItemPerdidoService22C U
)22U V
)22V W
;22W X
services33 
.33 
	AddScoped33 
(33 
typeof33 %
(33% &
IRegiaoService33& 4
)334 5
,335 6
typeof337 =
(33= >
RegiaoService33> K
)33K L
)33L M
;33M N
services44 
.44 
	AddScoped44 
(44 
typeof44 %
(44% &
ITagService44& 1
)441 2
,442 3
typeof444 :
(44: ;

TagService44; E
)44E F
)44F G
;44G H
services66 
.66 
Scan66 
(66 
scan66 
=>66 !
scan66" &
.66& '
FromCallingAssembly66' :
(66: ;
)66; <
.66< =

AddClasses66= G
(66G H
)66H I
.66I J
AsMatchingInterface66J ]
(66] ^
)66^ _
)66_ `
;66` a
services88 
.88 
AddSingleton88 !
<88! " 
IHttpContextAccessor88" 6
,886 7
HttpContextAccessor888 K
>88K L
(88L M
)88M N
;88N O
services99 
.99 
AddSingleton99 !
<99! "!
IAuthorizationHandler99" 7
,997 8
AuthorizeHandle999 H
>99H I
(99I J
)99J K
;99K L
services;; 
.;; 
AddDbContext;; !
<;;! " 
ApplicationDbContext;;" 6
>;;6 7
(;;7 8
);;8 9
;;;9 :
services== 
.== 
AddSingleton== !
(==! "

Mapeamento==" ,
.==, -
Criar==- 2
(==2 3
)==3 4
)==4 5
;==5 6#
ConfigureAuthentication?? #
(??# $
services??$ ,
)??, -
;??- .
servicesAA 
.AA 
AddSwaggerGenAA "
(AA" #
cAA# $
=>AA% '
{BB 
cCC 
.CC 

SwaggerDocCC 
(CC 
$strCC !
,CC! "
newDD 
InfoDD 
{EE 
TitleFF 
=FF 
$strFF  +
,FF+ ,
VersionGG 
=GG  !
$strGG" &
,GG& '
DescriptionHH #
=HH$ %
$strHH& [
,HH[ \
ContactII 
=II  !
newII" %
ContactII& -
{JJ 
NameKK  
=KK! "
$strKK# 0
,KK0 1
UrlLL 
=LL  !
$strLL" L
}MM 
}NN 
)NN 
;NN 
stringPP 
caminhoAplicacaoPP '
=PP( )
PlatformServicesPP* :
.PP: ;
DefaultPP; B
.PPB C
ApplicationPPC N
.PPN O
ApplicationBasePathPPO b
;PPb c
stringQQ 
nomeAplicacaoQQ $
=QQ% &
PlatformServicesQQ' 7
.QQ7 8
DefaultQQ8 ?
.QQ? @
ApplicationQQ@ K
.QQK L
ApplicationNameQQL [
;QQ[ \
stringRR 
caminhoXmlDocRR $
=RR% &
PathSS 
.SS 
CombineSS  
(SS  !
caminhoAplicacaoSS! 1
,SS1 2
$"SS3 5
{SS5 6
nomeAplicacaoSS6 C
}SSC D
.xmlSSD H
"SSH I
)SSI J
;SSJ K
cUU 
.UU 
IncludeXmlCommentsUU $
(UU$ %
caminhoXmlDocUU% 2
)UU2 3
;UU3 4
}VV 
)VV 
;VV 
}XX 	
public[[ 
void[[ 
	Configure[[ 
([[ 
IApplicationBuilder[[ 1
app[[2 5
,[[5 6
IHostingEnvironment[[7 J
env[[K N
)[[N O
{\\ 	
app]] 
.]] 
Use]] 
(]] 
async]] 
(]] 
ctx]] 
,]] 
next]]  $
)]]$ %
=>]]& (
{^^ 
await__ 
next__ 
(__ 
)__ 
;__ 
if`` 
(`` 
ctx`` 
.`` 
Response``  
.``  !

StatusCode``! +
==``, .
$num``/ 2
)``2 3
{aa 
ctxbb 
.bb 
Responsebb  
.bb  !
ContentLengthbb! .
=bb/ 0
$numbb1 2
;bb2 3
}cc 
}dd 
)dd 
;dd 
ifff 
(ff 
envff 
.ff 
IsDevelopmentff !
(ff! "
)ff" #
)ff# $
{gg 
apphh 
.hh %
UseDeveloperExceptionPagehh -
(hh- .
)hh. /
;hh/ 0
appii 
.ii 
UseCorsii 
(ii 
builderii #
=>ii$ &
builderii' .
.ii. /
WithOriginsii/ :
(ii: ;
$strii; R
)iiR S
.jj 
AllowAnyHeaderjj 
(jj  
)jj  !
.kk 
AllowAnyMethodkk 
(kk  
)kk  !
)kk! "
;kk" #
}ll 
elsemm 
{nn 
appoo 
.oo 
UseHstsoo 
(oo 
)oo 
;oo 
}pp 
ConfigureSwaggerrr 
(rr 
apprr  
)rr  !
;rr! "
UpdateDatabasess 
(ss 
appss 
)ss 
;ss  
appuu 
.uu 
UseHttpsRedirectionuu #
(uu# $
)uu$ %
;uu% &
appvv 
.vv 
UseMvcvv 
(vv 
routerBuildervv $
=>vv% '
{ww 
routerBuilderxx 
.xx %
EnableDependencyInjectionxx 7
(xx7 8
)xx8 9
;xx9 :
routerBuilderyy 
.yy 
Expandyy $
(yy$ %
)yy% &
.yy& '
Filteryy' -
(yy- .
)yy. /
.yy/ 0
Countyy0 5
(yy5 6
)yy6 7
.yy7 8
OrderByyy8 ?
(yy? @
)yy@ A
;yyA B
}zz 
)zz 
;zz 
}{{ 	
private}} 
void}} 
ConfigureSwagger}} %
(}}% &
IApplicationBuilder}}& 9
app}}: =
)}}= >
{~~ 	
app 
. 

UseSwagger 
( 
) 
; 
app
ÄÄ 
.
ÄÄ 
UseSwaggerUI
ÄÄ 
(
ÄÄ 
c
ÄÄ 
=>
ÄÄ !
{
ÅÅ 
c
ÇÇ 
.
ÇÇ 
SwaggerEndpoint
ÇÇ !
(
ÇÇ! "
$str
ÇÇ" <
,
ÇÇ< =
$str
ÇÇ> I
)
ÇÇI J
;
ÇÇJ K
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
ßß  
.
ßß  !&
ValidateIssuerSigningKey
ßß! 9
=
ßß: ;
true
ßß< @
;
ßß@ A
paramsValidation
®®  
.
®®  !
ValidateLifetime
®®! 1
=
®®2 3
true
®®4 8
;
®®8 9
paramsValidation
©©  
.
©©  !
	ClockSkew
©©! *
=
©©+ ,
TimeSpan
©©- 5
.
©©5 6
Zero
©©6 :
;
©©: ;
}
™™ 
)
™™ 
;
™™ 
services
¨¨ 
.
¨¨ 
AddAuthorization
¨¨ %
(
¨¨% &
auth
¨¨& *
=>
¨¨+ -
{
≠≠ 
auth
ÆÆ 
.
ÆÆ 
	AddPolicy
ÆÆ 
(
ÆÆ 
$str
ÆÆ '
,
ÆÆ' (
new
ÆÆ) ,(
AuthorizationPolicyBuilder
ÆÆ- G
(
ÆÆG H
)
ÆÆH I
.
ØØ &
AddAuthenticationSchemes
ØØ -
(
ØØ- .
JwtBearerDefaults
ØØ. ?
.
ØØ? @"
AuthenticationScheme
ØØ@ T
)
ØØT U
.
∞∞ &
RequireAuthenticatedUser
∞∞ -
(
∞∞- .
)
∞∞. /
.
∞∞/ 0
Build
∞∞0 5
(
∞∞5 6
)
∞∞6 7
)
∞∞7 8
;
∞∞8 9
}
±± 
)
±± 
;
±± 
}
≤≤ 	
}
≥≥ 
}¥¥ Ó

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