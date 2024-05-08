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
template([mi, nombre, es, s(_)],['Hola',0,'.','Un','gusto','en','conocerte'],[]).
template([que,es,lo,que,sabes],['Puedo','contestarte','todo','lo','que','quieras','saber','sobre','mi'],[]).
template([quien,te,creo],['El','maestro','Jesus','Eduardo','Alcaraz','Chavez','quien','imparte','la','materia','de','programación','logica','y','funcional','en','el','instituto','tecnológico','de','morelia'],[]).
template([cuenta, otro,chiste],['¿','Como','te','despides','de','tu','amigo','quimico','?','Acido','un','placer'],[]).
template([de,donde.vienes],['Yo','vengo','de','un','programa','escrito','en','tu','computadora'],[]).
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
template([mi, papa, se, llama, s(_), odia, s(_),pero,le,gusta,s(_)],['Me','gustaria','pasar','tiempo','con','alguién','que','odie',0,'y','que','le','guste',1],[4,10]).
template([mi, abuelo, s(_),trabajaba de,s(_),en,una,empresa,llamada,s(_)],['El','trabajo','de',0,'como',1,'debio','ser','extremadamente','dificil','especialmente','en','la','empresa',2],[2,10]).
template([yo,s(_),soy,estudiante,de,s(_),en s(_)],['Espero',0,'que','algun','dia','salgas','de','estudiar',1,'en','el',2,'para','que','trabajes'],[1,7]).
template([el,maestro,s(_),imparte,la,materia,de,s(_),en,s(_)],['Escuche','que','el','maestro',s(_)])

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