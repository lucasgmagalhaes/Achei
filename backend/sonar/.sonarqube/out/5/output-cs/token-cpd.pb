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
}tt ÀH
=D:\git\Achei\backend\Api\Controllers\ItemPerdidoController.cs
	namespace 	
Api
 
. 
Controllers 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class !
ItemPerdidoController &
:' (
ControllerBase) 7
{ 
private 
readonly 
IItemPerdidoService ,
itemPerdidoService- ?
;? @
private 
readonly 
IMapper  
mapper! '
;' (
public !
ItemPerdidoController $
($ %
IItemPerdidoService% 8
itemPerdidoService9 K
,K L
IMapperM T
mapperU [
)[ \
{ 	
this 
. 
itemPerdidoService #
=$ %
itemPerdidoService& 8
;8 9
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
public 
ActionResult 
BuscarPerdido )
() *
long* .
id/ 1
)1 2
{ 	
try 
{ 
if 
( 
id 
<= 
$num 
) 
{   
return!! 

BadRequest!! %
(!!% &
$str!!& 3
)!!3 4
;!!4 5
}"" 
ItemPerdido$$ 
perdido$$ #
=$$$ %
itemPerdidoService$$& 8
.$$8 9
Buscar$$9 ?
($$? @
id$$@ B
)$$B C
;$$C D
if&& 
(&& 
perdido&& 
==&& 
null&& #
)&&# $
{'' 
return(( 
NotFound(( #
(((# $
$str(($ 5
)((5 6
;((6 7
})) 
ItemPerdidoDto++ 
itemDto++ &
=++' (
mapper++) /
.++/ 0
Map++0 3
<++3 4
ItemPerdidoDto++4 B
>++B C
(++C D
perdido++D K
)++K L
;++L M
return,, 
Ok,, 
(,, 
itemDto,, !
),,! "
;,," #
}-- 
catch.. 
(.. 
	Exception.. 
e.. 
).. 
{// 
return00 

StatusCode00 !
(00! "
StatusCodes00" -
.00- .(
Status500InternalServerError00. J
,00J K
e00L M
)00M N
;00N O
}11 
}22 	
[99 	
HttpPut99	 
]99 
public:: 
ActionResult:: 
	Atualizar:: %
(::% &
[::& '
FromBody::' /
]::/ 0
ItemPerdido::0 ;
itemPerdido::< G
)::G H
{;; 	
try<< 
{== 
if>> 
(>> 
itemPerdido>> 
==>>  "
null>># '
)>>' (
{?? 
return@@ 

BadRequest@@ %
(@@% &
$str@@& :
)@@: ;
;@@; <
}AA 
itemPerdidoServiceCC "
.CC" #
	AtualizarCC# ,
(CC, -
itemPerdidoCC- 8
)CC8 9
;CC9 :
returnDD 
OkDD 
(DD 
newDD 
RequestResponseDD -
(DD- .
)DD. /
{DD0 1
messageDD2 9
=DD: ;
$strDD< Y
,DDY Z
statusDD[ a
=DDb c
$strDDd i
}DDj k
)DDk l
;DDl m
}EE 
catchFF 
(FF 
	ExceptionFF 
exFF 
)FF  
{GG 
returnHH 

StatusCodeHH !
(HH! "
StatusCodesHH" -
.HH- .(
Status500InternalServerErrorHH. J
,HHJ K
exHHL N
)HHN O
;HHO P
}II 
}JJ 	
[LL 	

HttpDeleteLL	 
(LL 
$strLL 
)LL 
]LL 
publicMM 
ActionResultMM 
ExcluirMM #
(MM# $
longMM$ (
idMM) +
)MM+ ,
{NN 	
tryOO 
{PP 
ifQQ 
(QQ 
idQQ 
<=QQ 
$numQQ 
)QQ 
{RR 
returnSS 

BadRequestSS %
(SS% &
$strSS& 3
)SS3 4
;SS4 5
}TT 
itemPerdidoServiceVV "
.VV" #
DeletarVV# *
(VV* +
idVV+ -
)VV- .
;VV. /
returnWW 
OkWW 
(WW 
newWW 
RequestResponseWW -
(WW- .
)WW. /
{WW0 1
messageWW2 9
=WW: ;
$strWW< W
,WWW X
statusWWY _
=WW` a
$strWWb g
}WWh i
)WWi j
;WWj k
}XX 
catchYY 
(YY 
	ExceptionYY 
exYY 
)YY  
{ZZ 
return[[ 

StatusCode[[ !
([[! "
StatusCodes[[" -
.[[- .(
Status500InternalServerError[[. J
,[[J K
ex[[L N
)[[N O
;[[O P
}\\ 
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ 
)__ 
]__  
public`` 
ActionResult`` #
BuscarRegiaoItemPerdido`` 3
(``3 4
long``4 8
id``9 ;
,``; <
[``= >
FromServices``> J
]``J K
IRegiaoService``L Z
regiaoService``[ h
)``h i
{aa 	
trybb 
{cc 
Regiaodd 
regiaodd 
=dd 
regiaoServicedd  -
.dd- .
BuscarPorItemIddd. =
(dd= >
iddd> @
)dd@ A
;ddA B
	RegiaoDtoee 
dtoee 
=ee 
mapperee  &
.ee& '
Mapee' *
<ee* +
	RegiaoDtoee+ 4
>ee4 5
(ee5 6
regiaoee6 <
)ee< =
;ee= >
returnff 
Okff 
(ff 
dtoff 
)ff 
;ff 
}gg 
catchhh 
(hh 
	Exceptionhh 
ehh 
)hh 
{ii 
returnjj 

StatusCodejj !
(jj! "
StatusCodesjj" -
.jj- .(
Status500InternalServerErrorjj. J
,jjJ K
ejjL M
)jjM N
;jjN O
}kk 
}ll 	
[nn 	
HttpGetnn	 
(nn 
$strnn 
)nn 
]nn 
publicoo 
ActionResultoo  
BuscarTagItemPerdidooo 0
(oo0 1
longoo1 5
idoo6 8
,oo8 9
[oo: ;
FromServicesoo; G
]ooG H
ITagServiceooI T

tagServiceooU _
)oo_ `
{pp 	
tryqq 
{rr 
Listss 
<ss 
Tagss 
>ss 
tagsss 
=ss  

tagServicess! +
.ss+ ,
BuscarPorItemIdss, ;
(ss; <
idss< >
)ss> ?
;ss? @
Listtt 
<tt 
TagDtott 
>tt 
dtostt !
=tt" #
mappertt$ *
.tt* +
Maptt+ .
<tt. /
Listtt/ 3
<tt3 4
TagDtott4 :
>tt: ;
>tt; <
(tt< =
tagstt= A
)ttA B
;ttB C
returnuu 
Okuu 
(uu 
dtosuu 
)uu 
;uu  
}vv 
catchww 
(ww 
	Exceptionww 
eww 
)ww 
{xx 
returnyy 

StatusCodeyy !
(yy! "
StatusCodesyy" -
.yy- .(
Status500InternalServerErroryy. J
,yyJ K
eyyL M
)yyM N
;yyN O
}zz 
}{{ 	
[}} 	
HttpPost}}	 
]}} 
public~~ 
ActionResult~~ 
Salvar~~ "
(~~" #
[~~# $
FromBody~~$ ,
]~~, -
ItemPerdido~~- 8
itemPerdido~~9 D
)~~D E
{ 	
try
ÄÄ 
{
ÅÅ  
itemPerdidoService
ÇÇ "
.
ÇÇ" #
Inserir
ÇÇ# *
(
ÇÇ* +
itemPerdido
ÇÇ+ 6
)
ÇÇ6 7
;
ÇÇ7 8
return
ÉÉ 
Ok
ÉÉ 
(
ÉÉ 
new
ÉÉ 
RequestResponse
ÉÉ -
(
ÉÉ- .
)
ÉÉ. /
{
ÉÉ0 1
message
ÉÉ2 9
=
ÉÉ: ;
$str
ÉÉ< Y
,
ÉÉY Z
status
ÉÉ[ a
=
ÉÉb c
$str
ÉÉd i
}
ÉÉj k
)
ÉÉk l
;
ÉÉl m
}
ÑÑ 
catch
ÖÖ 
(
ÖÖ 
	Exception
ÖÖ 
e
ÖÖ 
)
ÖÖ 
{
ÜÜ 
return
áá 

StatusCode
áá !
(
áá! "
StatusCodes
áá" -
.
áá- .*
Status500InternalServerError
áá. J
,
ááJ K
e
ááL M
)
ááM N
;
ááN O
}
àà 
}
ââ 	
}
ää 
}ãã –
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
}QQ –|
#D:\git\Achei\backend\Api\Startup.cs
	namespace 	
Api
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public!! 
Startup!! 
(!! 
IConfiguration!! %
configuration!!& 3
)!!3 4
{"" 	
Configuration## 
=## 
configuration## )
;##) *
ConnectionString%% 
.%% 
Server%% #
=%%$ %
configuration%%& 3
.%%3 4
GetValue%%4 <
<%%< =
string%%= C
>%%C D
(%%D E
$str%%E ^
)%%^ _
;%%_ `
ConnectionString&& 
.&& 
Database&& %
=&&& '
configuration&&( 5
.&&5 6
GetValue&&6 >
<&&> ?
string&&? E
>&&E F
(&&F G
$str&&G b
)&&b c
;&&c d
ConnectionString'' 
.'' 
UserId'' #
=''$ %
configuration''& 3
.''3 4
GetValue''4 <
<''< =
string''= C
>''C D
(''D E
$str''E ^
)''^ _
;''_ `
ConnectionString(( 
.(( 
Password(( %
=((& '
configuration((( 5
.((5 6
GetValue((6 >
<((> ?
string((? E
>((E F
(((F G
$str((G b
)((b c
;((c d
})) 	
public,, 
void,, 
ConfigureServices,, %
(,,% &
IServiceCollection,,& 8
services,,9 A
),,A B
{-- 	
services.. 
... 
AddCors.. 
(.. 
).. 
;.. 
services// 
.// 
AddOData// 
(// 
)// 
;//  
services00 
.00 
AddMvc00 
(00 
)00 
.00 #
SetCompatibilityVersion00 5
(005 6 
CompatibilityVersion006 J
.00J K
Version_2_200K V
)00V W
;00W X
services22 
.22 
	AddScoped22 
(22 
typeof22 %
(22% &
ICrudService22& 2
<222 3
>223 4
)224 5
,225 6
typeof227 =
(22= >
CrudService22> I
<22I J
>22J K
)22K L
)22L M
;22M N
services33 
.33 
	AddScoped33 
(33 
typeof33 %
(33% & 
IAutenticacaoService33& :
)33: ;
,33; <
typeof33= C
(33C D
AutenticacaoService33D W
)33W X
)33X Y
;33Y Z
services44 
.44 
	AddScoped44 
(44 
typeof44 %
(44% &
IUsuarioService44& 5
)445 6
,446 7
typeof448 >
(44> ?
UsuarioService44? M
)44M N
)44N O
;44O P
services55 
.55 
	AddScoped55 
(55 
typeof55 %
(55% &
IItemAchadoService55& 8
)558 9
,559 :
typeof55; A
(55A B
ItemAchadoService55B S
)55S T
)55T U
;55U V
services66 
.66 
	AddScoped66 
(66 
typeof66 %
(66% &
IItemPerdidoService66& 9
)669 :
,66: ;
typeof66< B
(66B C
ItemPerdidoService66C U
)66U V
)66V W
;66W X
services77 
.77 
	AddScoped77 
(77 
typeof77 %
(77% &
IRegiaoService77& 4
)774 5
,775 6
typeof777 =
(77= >
RegiaoService77> K
)77K L
)77L M
;77M N
services88 
.88 
	AddScoped88 
(88 
typeof88 %
(88% &
ITagService88& 1
)881 2
,882 3
typeof884 :
(88: ;

TagService88; E
)88E F
)88F G
;88G H
services:: 
.:: 
Scan:: 
(:: 
scan:: 
=>:: !
scan::" &
.::& '
FromCallingAssembly::' :
(::: ;
)::; <
.::< =

AddClasses::= G
(::G H
)::H I
.::I J
AsMatchingInterface::J ]
(::] ^
)::^ _
)::_ `
;::` a
services<< 
.<< 
AddSingleton<< !
<<<! " 
IHttpContextAccessor<<" 6
,<<6 7
HttpContextAccessor<<8 K
><<K L
(<<L M
)<<M N
;<<N O
services== 
.== 
AddSingleton== !
<==! "!
IAuthorizationHandler==" 7
,==7 8
AuthorizeHandle==9 H
>==H I
(==I J
)==J K
;==K L
services?? 
.?? 
AddDbContext?? !
<??! " 
ApplicationDbContext??" 6
>??6 7
(??7 8
)??8 9
;??9 :
servicesAA 
.AA 
AddSingletonAA !
(AA! "

MapeamentoAA" ,
.AA, -
CriarAA- 2
(AA2 3
)AA3 4
)AA4 5
;AA5 6#
ConfigureAuthenticationCC #
(CC# $
servicesCC$ ,
)CC, -
;CC- .
servicesEE 
.EE 
AddSwaggerGenEE "
(EE" #
cEE# $
=>EE% '
{FF 
cGG 
.GG 

SwaggerDocGG 
(GG 
$strGG !
,GG! "
newHH 
InfoHH 
{II 
TitleJJ 
=JJ 
$strJJ  +
,JJ+ ,
VersionKK 
=KK  !
$strKK" &
,KK& '
DescriptionLL #
=LL$ %
$strLL& [
,LL[ \
ContactMM 
=MM  !
newMM" %
ContactMM& -
{NN 
NameOO  
=OO! "
$strOO# 0
,OO0 1
UrlPP 
=PP  !
$strPP" L
}QQ 
}RR 
)RR 
;RR 
stringTT 
caminhoAplicacaoTT '
=TT( )
PlatformServicesTT* :
.TT: ;
DefaultTT; B
.TTB C
ApplicationTTC N
.TTN O
ApplicationBasePathTTO b
;TTb c
stringUU 
nomeAplicacaoUU $
=UU% &
PlatformServicesUU' 7
.UU7 8
DefaultUU8 ?
.UU? @
ApplicationUU@ K
.UUK L
ApplicationNameUUL [
;UU[ \
stringVV 
caminhoXmlDocVV $
=VV% &
PathWW 
.WW 
CombineWW  
(WW  !
caminhoAplicacaoWW! 1
,WW1 2
$"WW3 5
{WW5 6
nomeAplicacaoWW6 C
}WWC D
.xmlWWD H
"WWH I
)WWI J
;WWJ K
cYY 
.YY 
IncludeXmlCommentsYY $
(YY$ %
caminhoXmlDocYY% 2
)YY2 3
;YY3 4
}ZZ 
)ZZ 
;ZZ 
}\\ 	
public__ 
void__ 
	Configure__ 
(__ 
IApplicationBuilder__ 1
app__2 5
,__5 6
IHostingEnvironment__7 J
env__K N
)__N O
{`` 	
appaa 
.aa 
Useaa 
(aa 
asyncaa 
(aa 
ctxaa 
,aa 
nextaa  $
)aa$ %
=>aa& (
{bb 
awaitcc 
nextcc 
(cc 
)cc 
;cc 
ifdd 
(dd 
ctxdd 
.dd 
Responsedd  
.dd  !

StatusCodedd! +
==dd, .
$numdd/ 2
)dd2 3
{ee 
ctxff 
.ff 
Responseff  
.ff  !
ContentLengthff! .
=ff/ 0
$numff1 2
;ff2 3
}gg 
}hh 
)hh 
;hh 
ifjj 
(jj 
envjj 
.jj 
IsDevelopmentjj !
(jj! "
)jj" #
)jj# $
{kk 
appll 
.ll %
UseDeveloperExceptionPagell -
(ll- .
)ll. /
;ll/ 0
appmm 
.mm 
UseCorsmm 
(mm 
buildermm #
=>mm$ &
buildermm' .
.mm. /
WithOriginsmm/ :
(mm: ;
$strmm; R
)mmR S
.nn 
AllowAnyHeadernn 
(nn  
)nn  !
.oo 
AllowAnyMethodoo 
(oo  
)oo  !
)oo! "
;oo" #
}pp 
elseqq 
{rr 
appss 
.ss 
UseHstsss 
(ss 
)ss 
;ss 
}tt 
ConfigureSwaggervv 
(vv 
appvv  
)vv  !
;vv! "
UpdateDatabaseww 
(ww 
appww 
)ww 
;ww  
appyy 
.yy 
UseHttpsRedirectionyy #
(yy# $
)yy$ %
;yy% &
appzz 
.zz 
UseMvczz 
(zz 
routerBuilderzz $
=>zz% '
{{{ 
routerBuilder|| 
.|| %
EnableDependencyInjection|| 7
(||7 8
)||8 9
;||9 :
routerBuilder}} 
.}} 
Expand}} $
(}}$ %
)}}% &
.}}& '
Filter}}' -
(}}- .
)}}. /
.}}/ 0
Count}}0 5
(}}5 6
)}}6 7
.}}7 8
OrderBy}}8 ?
(}}? @
)}}@ A
;}}A B
}~~ 
)~~ 
;~~ 
} 	
private
ÅÅ 
void
ÅÅ 
ConfigureSwagger
ÅÅ %
(
ÅÅ% &!
IApplicationBuilder
ÅÅ& 9
app
ÅÅ: =
)
ÅÅ= >
{
ÇÇ 	
app
ÉÉ 
.
ÉÉ 

UseSwagger
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
app
ÑÑ 
.
ÑÑ 
UseSwaggerUI
ÑÑ 
(
ÑÑ 
c
ÑÑ 
=>
ÑÑ !
{
ÖÖ 
c
ÜÜ 
.
ÜÜ 
SwaggerEndpoint
ÜÜ !
(
ÜÜ! "
$str
ÜÜ" <
,
ÜÜ< =
$str
ÜÜ> I
)
ÜÜI J
;
ÜÜJ K
}
áá 
)
áá 
;
áá 
}
àà 	
private
ää 
void
ää 
UpdateDatabase
ää #
(
ää# $!
IApplicationBuilder
ää$ 7
app
ää8 ;
)
ää; <
{
ãã 	
using
åå 
(
åå 
IServiceScope
åå  
serviceScope
åå! -
=
åå. /
app
åå0 3
.
åå3 4!
ApplicationServices
åå4 G
.
ååG H 
GetRequiredService
ååH Z
<
ååZ ["
IServiceScopeFactory
åå[ o
>
ååo p
(
ååp q
)
ååq r
.
åår s
CreateScope
åås ~
(
åå~ 
)åå Ä
)ååÄ Å
{
çç 
using
éé 
(
éé "
ApplicationDbContext
éé +
context
éé, 3
=
éé4 5
serviceScope
éé6 B
.
ééB C
ServiceProvider
ééC R
.
ééR S

GetService
ééS ]
<
éé] ^"
ApplicationDbContext
éé^ r
>
éér s
(
éés t
)
éét u
)
ééu v
{
èè 
context
êê 
.
êê 
Database
êê $
.
êê$ %
Migrate
êê% ,
(
êê, -
)
êê- .
;
êê. /
}
ëë 
}
íí 
}
ìì 	
private
ïï 
void
ïï %
ConfigureAuthentication
ïï ,
(
ïï, - 
IServiceCollection
ïï- ?
services
ïï@ H
)
ïïH I
{
ññ 	#
SigningConfigurations
óó !#
signingConfigurations
óó" 7
=
óó8 9
new
óó: =#
SigningConfigurations
óó> S
(
óóS T
)
óóT U
;
óóU V
services
òò 
.
òò 
AddSingleton
òò !
(
òò! "#
signingConfigurations
òò" 7
)
òò7 8
;
òò8 9!
TokenConfigurations
öö !
tokenConfigurations
öö  3
=
öö4 5
new
öö6 9!
TokenConfigurations
öö: M
(
ööM N
)
ööN O
;
ööO P
new
õõ /
!ConfigureFromConfigurationOptions
õõ 1
<
õõ1 2!
TokenConfigurations
õõ2 E
>
õõE F
(
õõF G
Configuration
úú 
.
úú 

GetSection
úú (
(
úú( )
$str
úú) >
)
úú> ?
)
úú? @
.
ùù 
	Configure
ùù 
(
ùù !
tokenConfigurations
ùù 2
)
ùù2 3
;
ùù3 4
services
ûû 
.
ûû 
AddSingleton
ûû !
(
ûû! "!
tokenConfigurations
ûû" 5
)
ûû5 6
;
ûû6 7
services
°° 
.
°° 
AddAuthentication
°° &
(
°°& '
authOptions
°°' 2
=>
°°3 5
{
¢¢ 
authOptions
££ 
.
££ '
DefaultAuthenticateScheme
££ 5
=
££6 7
JwtBearerDefaults
££8 I
.
££I J"
AuthenticationScheme
££J ^
;
££^ _
authOptions
§§ 
.
§§ $
DefaultChallengeScheme
§§ 2
=
§§3 4
JwtBearerDefaults
§§5 F
.
§§F G"
AuthenticationScheme
§§G [
;
§§[ \
}
•• 
)
•• 
.
•• 
AddJwtBearer
•• 
(
•• 
bearerOptions
•• )
=>
••* ,
{
¶¶ 
	Microsoft
ßß 
.
ßß 
IdentityModel
ßß '
.
ßß' (
Tokens
ßß( .
.
ßß. /'
TokenValidationParameters
ßß/ H
paramsValidation
ßßI Y
=
ßßZ [
bearerOptions
ßß\ i
.
ßßi j(
TokenValidationParametersßßj É
;ßßÉ Ñ
paramsValidation
®®  
.
®®  !
IssuerSigningKey
®®! 1
=
®®2 3#
signingConfigurations
®®4 I
.
®®I J
Key
®®J M
;
®®M N
paramsValidation
©©  
.
©©  !
ValidAudience
©©! .
=
©©/ 0!
tokenConfigurations
©©1 D
.
©©D E
Audience
©©E M
;
©©M N
paramsValidation
™™  
.
™™  !
ValidIssuer
™™! ,
=
™™- .!
tokenConfigurations
™™/ B
.
™™B C
Issuer
™™C I
;
™™I J
paramsValidation
´´  
.
´´  !&
ValidateIssuerSigningKey
´´! 9
=
´´: ;
true
´´< @
;
´´@ A
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
≠≠  
.
≠≠  !
	ClockSkew
≠≠! *
=
≠≠+ ,
TimeSpan
≠≠- 5
.
≠≠5 6
Zero
≠≠6 :
;
≠≠: ;
}
ÆÆ 
)
ÆÆ 
;
ÆÆ 
services
∞∞ 
.
∞∞ 
AddAuthorization
∞∞ %
(
∞∞% &
auth
∞∞& *
=>
∞∞+ -
{
±± 
auth
≤≤ 
.
≤≤ 
	AddPolicy
≤≤ 
(
≤≤ 
$str
≤≤ '
,
≤≤' (
new
≤≤) ,(
AuthorizationPolicyBuilder
≤≤- G
(
≤≤G H
)
≤≤H I
.
≥≥ &
AddAuthenticationSchemes
≥≥ -
(
≥≥- .
JwtBearerDefaults
≥≥. ?
.
≥≥? @"
AuthenticationScheme
≥≥@ T
)
≥≥T U
.
¥¥ &
RequireAuthenticatedUser
¥¥ -
(
¥¥- .
)
¥¥. /
.
¥¥/ 0
Build
¥¥0 5
(
¥¥5 6
)
¥¥6 7
)
¥¥7 8
;
¥¥8 9
}
µµ 
)
µµ 
;
µµ 
}
∂∂ 	
}
∑∑ 
}∏∏ Ó

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