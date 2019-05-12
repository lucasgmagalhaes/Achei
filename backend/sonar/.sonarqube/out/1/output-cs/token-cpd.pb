Ê
FE:\Git\Achei\backend\Exceptions\Entity\EntityAlreadyExistsException.cs
	namespace 	

Exceptions
 
. 
Entity 
{ 
[		 
Serializable		 
]		 
public

 

class

 (
EntityAlreadyExistsException

 -
:

. /
	Exception

0 9
{ 
public (
EntityAlreadyExistsException +
(+ ,
), -
{. /
}0 1
public (
EntityAlreadyExistsException +
(+ ,
string, 2
message3 :
): ;
:< =
base> B
(B C
messageC J
)J K
{L M
}N O
public (
EntityAlreadyExistsException +
(+ ,
string, 2
message3 :
,: ;
System< B
.B C
	ExceptionC L
innerM R
)R S
:T U
baseV Z
(Z [
message[ b
,b c
innerd i
)i j
{k l
}m n
	protected (
EntityAlreadyExistsException .
(. /
SerializationInfo/ @
infoA E
,E F
StreamingContextG W
contextX _
)_ `
:a b
basec g
(g h
infoh l
,l m
contextn u
)u v
{w x
}y z
} 
} ¬
AE:\Git\Achei\backend\Exceptions\Entity\EntityNotFoundException.cs
	namespace 	

Exceptions
 
. 
Entity 
{ 
[		 
Serializable		 
]		 
public

 

class

 #
EntityNotFoundException

 (
:

) *
	Exception

+ 4
{ 
public #
EntityNotFoundException &
(& '
)' (
{) *
}+ ,
public #
EntityNotFoundException &
(& '
string' -
message. 5
)5 6
:7 8
base9 =
(= >
message> E
)E F
{G H
}I J
public #
EntityNotFoundException &
(& '
string' -
message. 5
,5 6
System7 =
.= >
	Exception> G
innerH M
)M N
:O P
baseQ U
(U V
messageV ]
,] ^
inner_ d
)d e
{f g
}h i
	protected #
EntityNotFoundException )
() *
SerializationInfo* ;
info< @
,@ A
StreamingContextB R
contextS Z
)Z [
:\ ]
base^ b
(b c
infoc g
,g h
contexti p
)p q
{r s
}t u
} 
} 