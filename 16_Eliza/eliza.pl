
eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder haberte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder haberte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.


template([buenas],['Buenas', '¿','en', 'que', 'te', 'puedo', 'ayudar','?'],[]).
template([como, estas],['Hola', 'yo', 'me' ,'encuentro', 'muy', 'bien'],[]).
template([que, onda],['Que', 'onda', '.' ,'Estoy','aqui','para', 'lo', 'que', 'se', 'te', 'ofrezca'],[]).
template([como,te,llamas],['Mi','nombre','es','Eliza','.','Mucho','gusto'],[]).
template([que,es,lo,que,haces],['Como','chatbot','mi','trabajo','es','responder','a','lo','que','tu','usuario','me','digas'],[]).
template([como,funcionas],['Mediante','una','serie','de','reglas','y','proposiciones','logicas','puedo','realizar','inferencias','acerca','de','como','estoy','programada'],[]).
template([que, paradigma, de, programacion,usas],['Mi','paradigma','programación','es','el','logico','el','cual','funciona','a','traves','de','reglas','y','proposciones','logicas'],[]).
template([que, lenguaje, de, programacion, usas],['Mi','lenguaje','de','programacion','es','Prolog'],[]).
template([cuenta,un,chiste],['Habia','un','pollito','que','se','llamaba','resistol','se','cayo','y','se','pego'],[]).
template([mi, nombre, es, s(_)],['Hola',0,'.','Un','gusto','en','conocerte'],[3]).
template([que,es,lo,que,sabes],['Puedo','contestarte','todo','lo','que','quieras','saber','sobre','mi'],[]).
template([quien,te,creo],['El','maestro','Jesus','Eduardo','Alcaraz','Chavez','quien','imparte','la','materia','de','programación','logica','y','funcional','en','el','instituto','tecnológico','de','morelia'],[]).
template([cuenta, otro,chiste],['¿','Como','te','despides','de','tu','amigo','quimico','?','Acido','un','placer'],[]).
template([de,donde,vienes],['Yo','vengo','de','un','programa','escrito','en','tu','computadora'],[]).
template([que,clase,de, chatbot,eres],['Uno','capaz','de','responder','a','todas','tus','solicitudes'],[]).
template([como,te,va],['Me','va','bastante','bien','.','Gracias'],[]).
template([que,crees,que,pasa,cuando,morimos],['No','se','y','tampoco','me','interesa','saberlo','puesto','que','soy','un','robot'],[]).
template([por,que,crees,que,existimos],['Nosotros','los','robots','fuimos','creados','con','el','fin','de','ayudar','a','los','humanos','a','realizar','diversas','actividades'],[]).
template([por,que,crees,que,existen,los,humanos],['No','estoy','muy','segura','pero','creo','que','los','humanos','aun','tienen','mucho','que','ofrecer','en','este','mundo'],[]).
template([que,eres,en,realidad],['Soy','un','conjunto','de','unos','y','ceros','que','tu','computadora','puede','entender','y', 'que','me','forman','a','mi','como','resultado'],[]).

template([yo, s(_), soy, hijo, de, s(_)],['¿','Que','significa','que','tu',0,'seas','hijo','de',1],[1,5]).
template([yo, s(_), soy, padre, de, s(_)],['¿','Que','significa','que','tu',0,'seas','padre','de',1],[1,5]).
template([yo, s(_), soy, hermano, de, s(_)],['¿','Que','significa','que','tu',0,'seas','hermano','de',1],[1,5]).
template([mi, mama, se, llama, s(_),y, le,gusta,s(_)],['Es','bueno','que','a',0,'le','guste',1],[4,8]).
template([mi, hermana, se, llama, s(_), y, odia, s(_)],['¿','Por','que',0,'odia',1],'?',[4,7]).
template([mi, papa, se, llama, s(_), odia, s(_),pero,le,gusta,s(_)],['Me','gustaria','pasar','tiempo','con','alguién','que','se','llame',0,'odie',1,'y','que','le','guste',2],[4,10]).
template([mi, abuelo, s(_),trabajaba, de,s(_),en,una,empresa,llamada,s(_)],['El','trabajo','de',0,'como',1,'debio','ser','extremadamente','dificil','especialmente','en','la','empresa',2],[2,10]).
template([yo,s(_),soy,estudiante,de,s(_),en,la, universidad,s(_)],['Espero',0,'que','algun','dia','salgas','de','estudiar',1,'en','el',2,'para','que','trabajes'],[1,10]).
template([el,maestro,s(_),imparte,la,materia,de,s(_),en,la, universidad,s(_)],['Estoy','segura','de','el','maestro',0,'sabe','impartir','la','materia','de',2,'sobre','todo','si','la','da','en','el',3],[2,11]).
template([mi,tio, s(_), es,papa,de,mi,primo,s(_),y, es, esposo, de, mi, tia, s(_)],['Estoy','segura','de','que','tanto','tu','tio',0,'su','esposa',2,'y','tu','primo',1,'forman','una','familia','feliz'],[2,15]).
template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

		 % pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

% pregunta algo que eliza odie
template([odias,s(_),_],[flagHates],[1]).
template([odias,la,s(_)],[flagHates],[2]).
template([odias,el,s(_)],[flagHates],[2]).

template([eliza,s(_),y,s(_),son,parientes],[flagPar],[1,3]).
template([eliza,s(_),es,hijo,de,s(_)],[flagIsSon],[1,5]).
template([eliza,s(_),es,nieto,de,s(_)],[flagIsGrandSon],[1,5]).

%pregunta algo que eliza crea
template([do,you,believe,in,s(_)],[flagBelieves],[4]).

%pregunta algo que eliza piense acerca de los humanos
template([crees,que,los,humanos,somos,s(_)],[flagHumans],[5]).

%pregunta a eliza quien es tu familar dependiendo como te llames
template([si,mi,nombre,es,s(_),quien,es,mi,padre],[flagFather],[4]).
template([si,mi,nombre,es,s(_),quien,es,mi,madre],[flagMother],[4]).
template([si,mi,nombre,es,s(_),quienes,son,mis,hermanos],[flagSibling],[4]).
template([si,mi,nombre,es,s(_),quienes,son,mis,abuelos],[flagGrand],[4]).
template([si,mi,nombre,es,s(_),quienes,son,mis,tios],[flagUncle],[4]).
template([si,mi,nombre,es,s(_),quienes,son,mis,nietos],[flagGrandSon],[4]).
template([si,mi,nombre,es,s(_),quienes,son,mis,primos],[flagCousin],[4]).
template([si,mi,nombre,es, s(_),quienes,son,mis,hijos],[flagSon],[4]).


template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

				  
template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% lo que odia eliza: flagHates 
elizaHates(X, R):- hates(X), R = ['Yes.','I','truly','hate',X].
elizaHates(X, R):- \+hates(X), R = ['No.','I''do','not','hate',X].
hates(work).
hates(violence).
hates(discrimination).
hates(harassment).
hates(racism).

% lo que cree eliza: flagBelieves
elizaBelieves(X,R):- believes(X), R = ['Yes.','I','believe','in',X].
elizaBelieves(X,R):- \+believes(X), R = ['No.','I','do','not','believe','in',X].
believes(heaven).
believes(hell).
believes(karma).
believes(luck).
believes(god).

% lo que eliza cree acerca de los humanos: flagHumans
elizaThinksHumansAre(X,R):- humans(X), R = ['Si.','Creo','que','los','humanos','son',X].
elizaThinksHumansAre(X,R):- \+humans(X), R = ['No.','No','creo','que','los','humanos','son',X].
humans(inteligentes).
humans(tontos).
humans(flojos).
humans(ineficientes).

padrede(josecarmen,roberto).
padrede(josecarmen, miguel).
padrede(josecarmen, sergio).
padrede(josecarmen, jaime).
padrede(josecarmen, raul).
padrede(josecarmen, enrique).
padrede(josecarmen, antonio).
padrede(josecarmen, fernando).
padrede(josecarmen, martin).
padrede(josecarmen, martha).
padrede(josecarmen, angelina).
padrede(fidel,marbella).
padrede(fidel, marisol).
padrede(fidel, fideladhemir).
padrede(fideladhemir, oscar).
padrede(fideladhemir,axel).
padrede(gilberto,isabella).
padrede(roberto,diego).
padrede(roberto,karen).

madrede(adelina, roberto).
madrede(adelina, miguel).
madrede(adelina, sergio).
madrede(adelina, jaime).
madrede(adelina, raul).
madrede(adelina, enrique).
madrede(adelina, antonio).
madrede(adelina, fernando).
madrede(adelina, martin).
madrede(adelina, martha).
madrede(adelina, angelina).
madrede(hermila, marbella).
madrede(hermila, marisol).
madrede(hermila, fideladhemir).
madrede(jessica,oscar).
madrede(jessica,axel).
madrede(marisol,isabella).
madrede(marbella,diego).
madrede(marbella,karen).

esposode(roberto,marbella).
esposode(fideladhemir,jessica).
esposode(fidel,hermila).
esposode(josecarmen,adelina).
esposode(gilberto,marisol).

% Reglas para determinar parentescos
hermanode(X,Y):-padrede(W,X),padrede(W,Y),\+Y==X.
abuelode(X,Y):- padrede(X, Z),padrede(Z, Y); padrede(X,Z),madrede(Z,Y); madrede(X, Z), madrede(Z,Y);madrede(X,Z),padrede(Z,Y).
hijode(X,Y):- padrede(Y,X).
tiode(X,Y):- hermanode(X,Z),padrede(Z,Y); hermanode(X,Z),madrede(Z,Y).
nietode(X,Y):- padrede(Y,Z),padrede(Z,X); madrede(Y,Z),madrede(Z,X);padrede(Y,Z),madrede(Z,X);madrede(Y,Z),madrede(Z,X).
primode(X,Y):- padrede(Z,X),padrede(W,Y),hermanode(Z,W);tiode(Z,X),padrede(Z,Y);tiode(Z,Y),padrede(Z,X).
sobrinode(X,Y):-tiode(Y,X).


fatherof(X,Y,R):-padrede(X,Y), R = ['El','padre','de',Y,'es',X].
motherof(X,Y,R):-madrede(X,Y), R = ['La','madre','de',Y,'es',X].
siblingof(X,Y,R):-findall(X,hermanode(X,Y), Hermanos),atomic_list_concat(Hermanos,', ',HermanosStr),
format(atom(R),'L@s/El/la herman@(s) de ~w son: ~w. ',[Y, HermanosStr]).
grandfatherof(X,Y,R):-findall(X,abuelode(X,Y),Abuelos),atomic_list_concat(Abuelos,', ',AbuelosStr),
format(atom(R),'Los	abuelos de ~w son: ~w.', [Y, AbuelosStr]).
sonof(X,Y,R):-findall(Y,hijode(X,Y),Hijos),atomic_list_concat(Hijos,', ',HijosStr),
format(atom(R),'Los hijos de ~w son: ~w.',[X,HijosStr]).
grandsonof(X,Y,R):-findall(X,nietode(X,Y),Nietos),atomic_list_concat(Nietos,', ',NietosStr),
format(atom(R),'Los nietos de ~w son: ~w.',[Y,NietosStr]).

parientof(X,Y,R):-(padrede(X,Y);madrede(X,Y);hermanode(X,Y);abuelode(X,Y);nietode(X,Y);primode(X,Y);tiode(X,Y);primode(X,Y);sobrinode(X,Y);hijode(X,Y)),R = ['Si',X,'es','pariente','de',Y].
parientof(X,Y,R):- (\+padrede(X,Y);\+madrede(X,Y);\+hermanode(X,Y);\+abuelode(X,Y);\+nietode(X,Y);\+primode(X,Y);\+tiode(X,Y);\+primode(X,Y);\+sobrinode(X,Y);\+hijode(X,Y)),R = ['No',X,'no','es','pariente','de',Y].

issonof(X,Y,R):-padrede(Y,X),R = ['Si',X,'es','hijo','de',Y].
issonof(X,Y,R):- \+padrede(Y,X),R = ['No',X,'no','es','hijo','de',Y].


isgrandsonof(X,Y,R):-nietode(X,Y),R = ['Si',X,'es','nieto','de',Y].
isgrandsonof(X,Y,R):- \+nietode(X,Y),R = ['No',X,'no','es','nieto','de',Y].

enfermedad(lupus).
enfermedad(cancerdepiel).
enfermedad(bocio).
sintoma(fatiga).
sintoma(dolorcabeza).
sintoma(tos).

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

% Eliza hates
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagHates,
	elizaHates(Atom, R).

% Eliza believes
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagBelieves,
	elizaBelieves(Atom, R).

% Eliza thinks about humans
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagHumans,
	elizaThinksHumansAre(Atom, R).

% Eliza guesses who your father is
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagFather,
	fatherof(_,Atom,R).

% Eliza guesses who your mother is
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagMother,
	motherof(_,Atom,R).

% Eliza guesses who your siblings are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagSibling,
	siblingof(_,Atom,R).
	

% Eliza guesses who your grandparents are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagGrand,
	grandfatherof(_,Atom,R).

% Eliza guesses who your uncles are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagUncle,
	uncleof(_,Atom,R).

% Eliza guesses who your cousins are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagCousin,
	cousinof(_,Atom,R).

% Eliza guesses who your sons are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagSon,
	sonof(_,Atom,R).

% Eliza guesses who your grandsons are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagGrandSon,
	grandsonof(_,Atom,R).

%Eliza guesses if two persons are parients
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagPar,
	parientof(Atom,Atom1,R).
	
	
%Eliza guesses if person1 is son of person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Son),
	nth0(J,Input,Parent),
	nth0(0, Resp, X),
	X == flagIsSon,
	issonof(Son,Parent,R).

%Eliza guesses if person1 is grandson of person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input,Atom),
	nth0(J,Input,Atom1),
	nth0(0, Resp, X),
	X == flagIsGrandSon,
	isgrandsonof(Atom,Atom1,R).

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
