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
template([mi, papa, se, llama, s(_), odia, s(_),pero,le,gusta,s(_)],['Me','gustaria','pasar','tiempo','con','alguién','que','se','llame',0,'odie',1,'y','que','le','guste',2],[4,6,10]).
template([mi, abuelo, s(_),trabajaba, de,s(_),en,una,empresa,llamada,s(_)],['El','trabajo','de',0,'como',1,'debio','ser','extremadamente','dificil','especialmente','en','la','empresa',2],[2,5,10]).
template([yo,s(_),soy,estudiante,de,s(_),en,la, universidad,s(_)],['Espero',0,'que','algun','dia','salgas','de','estudiar',1,'en','el',2,'para','que','trabajes'],[1,5,10]).
template([el,maestro,s(_),imparte,la,materia,de,s(_),en,la, universidad,s(_)],['Estoy','segura','de','el','maestro',0,'sabe','impartir','la','materia','de',2,'sobre','todo','si','la','da','en','el',3],[2,8,11]).
template([mi,tio, s(_), es,papa,de,mi,primo,s(_),y, es, esposo, de, mi, tia, s(_)],['Estoy','segura','de','que','tanto','tu','tio',0,'su','esposa',2,'y','tu','primo',1,'forman','una','familia','feliz'],[2,8,15]).
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

%pregunta algo que eliza crea
template([do,you,believe,in,s(_)],[flagBelieves],[4]).

%pregunta algo que eliza piense acerca de los humanos
template([crees,que,los,humanos,somos,s(_)],[flagHumans],[5]).

template([eliza,juguemos,akinator],[flagAkinator],[0]).
template([ficticio],[fictionalChar],[0]).
template([real],[realChar],[0]).

%pregunta a eliza quien es tu familar dependiendo como te llames
template([eliza,quien, es,padre,de,s(_)],[flagFather],[5]).
template([eliza,quien, es,madre,de,s(_)],[flagMother],[5]).
template([eliza,quien, es,el,esposo,de,s(_)],[flagHusband],[6]).
template([eliza,quien, es,la,esposa,de,s(_)],[flagWife],[6]).
template([eliza,quienes,son,los,hermanos,de,s(_)],[flagSibling],[6]).
template([eliza,quienes,son,los,abuelos,de,s(_)],[flagGrand],[6]).
template([eliza,quienes,son,los,tios,de,s(_)],[flagUncle],[6]).
template([eliza,quienes,son,los,sobrinos,de,s(_)],[flagNephews],[6]).
template([eliza,quienes,son,los,nietos,de,s(_)],[flagGrandSon],[6]).
template([eliza,quienes,son,los,primos,de,s(_)],[flagCousin],[6]).
template([eliza,quienes,son,los,hijos,de,s(_)],[flagSon],[6]).
template([eliza,quienes,son,los,suegros,de,s(_)],[flagFatheInLaw],[6]).
template([eliza,quienes,son,los,cunados,de,s(_)],[flagBrotherInLaw],[6]).
template([eliza,quienes,son,los,yernos,de,s(_)],[flagSonInLaw],[6]).
template([eliza,quienes,son,los,tios,politicos,de,s(_)],[flagUncleInLaw],[7]).
template([eliza,quienes,son,los,sobrinos,politicos,de,s(_)],[flagNephewInLaw],[7]).

template([eliza,s(_),y,s(_),son,parientes],[flagPar],[1,3]).
template([eliza,s(_),es,el,padre,de,s(_)],[flagIsFather],[1,6]).
template([eliza,s(_),es,la,madre,de,s(_)],[flagIsMother],[1,6]).
template([eliza,s(_),es,hermano,de,s(_)],[flagIsSibling],[1,5]).
template([eliza,s(_),es,hermana,de,s(_)],[flagIsSibling],[1,5]).
template([eliza,s(_),es,abuelo,de,s(_)],[flagIsGrand],[1,5]).
template([eliza,s(_),es,abuela,de,s(_)],[flagIsGrand],[1,5]).
template([eliza,s(_),es,tio,de,s(_)],[flagIsUncle],[1,5]).
template([eliza,s(_),es,tia,de,s(_)],[flagIsUncle],[1,5]).
template([eliza,s(_),es,sobrino,de,s(_)],[flagIsNephew],[1,5]).
template([eliza,s(_),es,sobrina,de,s(_)],[flagIsNephew],[1,5]).
template([eliza,s(_),es,primo,de,s(_)],[flagIsCousin],[1,5]).
template([eliza,s(_),es,prima,de,s(_)],[flagIsCousin],[1,5]).
template([eliza,s(_),es,suegro,de,s(_)],[flagIsFatherInLaw],[1,5]).
template([eliza,s(_),es,suegra,de,s(_)],[flagIsFatherInLaw],[1,5]).
template([eliza,s(_),es,cunado,de,s(_)],[flagIsBrotherInLaw],[1,5]).
template([eliza,s(_),es,cunada,de,s(_)],[flagIsBrotherInLaw],[1,5]).
template([eliza,s(_),es,yerno,de,s(_)],[flagIsSonInLaw],[1,5]).
template([eliza,s(_),es,nuera,de,s(_)],[flagIsSonInLaw],[1,5]).
template([eliza,s(_),es,hijo,de,s(_)],[flagIsSon],[1,5]).
template([eliza,s(_),es,hija,de,s(_)],[flagIsSon],[1,5]).
template([eliza,s(_),es,nieto,de,s(_)],[flagIsGrandSon],[1,5]).
template([eliza,s(_),es,nieta,de,s(_)],[flagIsGrandSon],[1,5]).
template([eliza,s(_),es,esposo,de,s(_)],[flagIsHusband],[1,5]).
template([eliza,s(_),es,esposa,de,s(_)],[flagIsWife],[1,5]).
template([eliza,s(_),es,tio,politico,de,s(_)],[flagIsUncleInLaw],[1,6]).
template([eliza,s(_),es,tia,politica,de,s(_)],[flagIsUncleInLaw],[1,6]).
template([eliza,s(_),es,sobrino,politico,de,s(_)],[flagIsNephewInLaw],[1,6]).
template([eliza,s(_),es,sobrina,politica,de,s(_)],[flagIsNephewInLaw],[1,6]).

%sistema experto medico
template([eliza,que,medicamento,debo,tomar,si,tengo,la,enfermedad,de,s(_)],[flagMedicine],[10]).
template([eliza,que,medicamento,debe,tomar,s(_),si,tiene,la,enfermedad,de,s(_)],[flagMedicineTwo],[5,11]).
template([eliza, si,tengo,s(_),que,medicamento,debo,tomar],[flagMedicine],[3]).
template([eliza, si,s(_),tiene,s(_),que,medicamento,debe,tomar],[flagMedicineTwo],[2,4]).
template([eliza,si, tengo,sintoma,de,s(_),que,medicamento,debo,tomar],[flagMedicineSymptom],[5]).
template([eliza,si,s(_), tiene,sintoma,de,s(_),que,medicamento,debe,tomar],[flagMedicineSymptomTwo],[2,6]).
template([eliza,si,tengo,s(_),con, cual, especialista,debo,acudir],[flagSpecialist],[3]).
template([eliza,si,s(_),tiene,s(_),con, cual, especialista,debe,acudir],[flagSpecialistTwo],[2,4]).
template([eliza,si,tengo,la,enfermedad,de,la,s(_),que,especialista,me,atiende,y,que,medicina,me,recetan],[flagSpecialistRecipe],[7]).
template([eliza,si,s(_),tiene,la,enfermedad,de,la,s(_),que,especialista,le,atiende,y,que,medicina,le,recetan],[flagSpecialistRecipeTwo],[2,8]).
template([eliza, que, especialista,puede,atender,el,sintoma,de,s(_)],[flagSymptomSpecialist],[8]).
template([eliza,que,probabilidad,hay,de,que,tenga,la,enfermedad,de,s(_),si,tengo,los,siguientes,sintomas,s(_),s(_),s(_),s(_),s(_)],[flagProbability],[10,16,17,18,19,20]).
template([eliza,cuales,son,las,principales,causas,del,s(_)],[flagCauses],[7]).
template([eliza,que,enfermedad,tengo,si,tengo,los,siguientes,sintomas,s(_),s(_),s(_),s(_),s(_)],[flagSickness],[9,10,11,12,13]).

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

%familia
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
padrede(miguel,magali).
padrede(miguel,jonnhy).
padrede(sergio,alex).
padrede(sergio,checo).
padrede(jaime,isacc).
padrede(raul,joyce).
padrede(raul,ashley).
padrede(enrique,carlitos).
padrede(fernando,jennifer).
padrede(fernando,axelito).
padrede(martin,jonathan).
padrede(martin,hector).
padrede(martin,jorge).
padrede(jonathan,ian).

madrede(angelina,marisolita).
madrede(jennifer,alan).
madrede(mary,axelito).
madrede(mary,jennifer).
madrede(genoveva,isacc).
madrede(dolores,checo).
madrede(dolores,alex).
madrede(evelia,jonnhy).
madrede(evelia,magali).
madrede(magali,thiago).
madrede(magali,mateo).
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
esposode(miguel,evelia).
esposode(sergio,dolores).
esposode(jaime, genoveva).
esposode(fernando,mary).
esposode(ruben,martha).


% Reglas para determinar parentescos
hermanode(X,Y):-padrede(W,X),padrede(W,Y),\+Y==X.
abuelode(X,Y):- padrede(X,Z),padrede(Z,Y); padrede(X,Z),madrede(Z,Y); madrede(X, Z), madrede(Z,Y);madrede(X,Z),padrede(Z,Y).
hijode(X,Y):- padrede(Y,X);madrede(Y,X).
tiode(X,Y):- hermanode(X,Z),padrede(Z,Y); hermanode(X,Z),madrede(Z,Y);primode(X,Z),padrede(Z,Y);primode(X,Z),madrede(Z,Y);tiopoliticode(X,Y).
nietode(X,Y):- abuelode(Y,X).
primode(X,Y):- padrede(Z,X),padrede(W,Y),hermanode(Z,W);madrede(Z,X),padrede(W,Y),hermanode(Z,W);padrede(Z,X),madrede(W,Y),hermanode(Z,W);madrede(Z,X),madrede(W,Y),hermanode(Z,W). 
sobrinode(X,Y):-tiode(Y,X).
suegrode(X,Y):-padrede(X,Z),esposode(Z,Y);madrede(X,Z),esposode(Z,Y);padrede(X,Z),esposode(Y,Z);madrede(X,Z),esposode(Y,Z).
cunadode(X,Y):-hermanode(X,Z),esposode(Z,Y);hermanode(X,Z),esposode(Y,Z).
yernode(X,Y):-suegrode(Y,X).
tiopoliticode(X,Y):-esposode(X,Z),hermanode(Z,W),madrede(W,Y);esposode(X,Z),hermanode(Z,W),padrede(W,Y);esposode(Z,X),hermanode(Z,W),padrede(W,Y);esposode(Z,X),hermanode(Z,W),madrede(W,Y).
sobrinopoliticode(X,Y):-tiopoliticode(Y,X).

fatherof(X,Y,R):-padrede(X,Y), R = ['El','padre','de',Y,'es',X].
motherof(X,Y,R):-madrede(X,Y), R = ['La','madre','de',Y,'es',X].

husbandof(X,Y,R):-esposode(X,Y), R =['El','esposo','de',Y,'es',X].
wifeof(X,Y,R):-esposode(Y,X), R=['La','esposa','de',Y,'es',X].

siblingof(X,Y,R):-findall(X,hermanode(X,Y), Hermanos),atomic_list_concat(Hermanos,', ',HermanosStr),
format(atom(R),'L@s/El/la herman@(s) de ~w son: ~w. ',[Y, HermanosStr]).

grandfatherof(X,Y,R):-findall(X,abuelode(X,Y),Abuelos),atomic_list_concat(Abuelos,', ',AbuelosStr),
format(atom(R),'Los	abuelos de ~w son: ~w.', [Y, AbuelosStr]).

uncleof(X,Y,R):-findall(X,tiode(X,Y),Tios),atomic_list_concat(Tios,', ',TiosStr),
format(atom(R),'Los tios de ~w son: ~w.',[Y,TiosStr]).

nephewof(X,Y,R):-findall(X,sobrinode(X,Y),Sobrinos),atomic_list_concat(Sobrinos,', ',SobrinosStr),
format(atom(R),'Los sobrinos de ~w son: ~w.',[Y,SobrinosStr]).

grandsonof(X,Y,R):-findall(X,nietode(X,Y),Nietos),atomic_list_concat(Nietos,', ',NietosStr),
format(atom(R),'Los nietos de ~w son: ~w.',[Y,NietosStr]).

cousinof(X,Y,R):-findall(X,primode(X,Y),Cousins),atomic_list_concat(Cousins,',',CousinsStr),
format(atom(R),'Los primos de ~w son: ~w.',[Y,CousinsStr]).

sonof(X,Y,R):-findall(X,hijode(X,Y),Hijos),atomic_list_concat(Hijos,', ',HijosStr),
format(atom(R),'Los hijos de ~w son: ~w.',[Y,HijosStr]).

fatherinlawof(X,Y,R):-findall(X,suegrode(X,Y),Suegros),atomic_list_concat(Suegros,', ',SuegrosStr),
format(atom(R),'Los suegros de ~w son: ~w.',[Y,SuegrosStr]).

soninlawof(X,Y,R):-findall(X,yernode(X,Y),Yernos),atomic_list_concat(Yernos,', ',YernosStr),
format(atom(R),'Los yernos de ~w son: ~w.',[Y,YernosStr]).

uncleinlawof(X,Y,R):-findall(X,tiopoliticode(X,Y),TiosPoliticos),atomic_list_concat(TiosPoliticos,', ',TiosPoliticosStr),
format(atom(R),'Los tios politicos de ~w son: ~w.',[Y,TiosPoliticosStr]).

brotherinlawof(X,Y,R):-findall(X,cunadode(X,Y),Cunados),atomic_list_concat(Cunados,', ',CunadosStr),
format(atom(R),'Los cuñados de ~w son: ~w.',[Y,CunadosStr]).

nephewinlawof(X,Y,R):-findall(X,sobrinopoliticode(X,Y),SobrinosPoliticos),atomic_list_concat(SobrinosPoliticos,', ',SobrinosPoliticosStr),
format(atom(R),'Los sobrinos politicos de ~w son: ~w.',[Y,SobrinosPoliticosStr]).

parientof(X,Y,R):-(padrede(X,Y);madrede(X,Y);hermanode(X,Y);abuelode(X,Y);nietode(X,Y);primode(X,Y);tiode(X,Y);primode(X,Y);sobrinode(X,Y);hijode(X,Y);esposode(X,Y);suegrode(X,Y);cunadode(X,Y);yernode(X,Y);esposode(Y,X)),R = ['Si',X,'es','pariente','de',Y].
parientof(X,Y,R):- (\+padrede(X,Y);\+madrede(X,Y);\+hermanode(X,Y);\+abuelode(X,Y);\+nietode(X,Y);\+primode(X,Y);\+tiode(X,Y);\+primode(X,Y);\+sobrinode(X,Y);\+hijode(X,Y);\+esposode(X,Y);\+cunadode(X,Y);\+yernode(X,Y);\+esposode(Y,X)),R = ['No',X,'no','es','pariente','de',Y].

isfatherof(X,Y,R):-padrede(X,Y), R=['Si',X,'es','padre','de',Y].
isfatherof(X,Y,R):- \+padrede(X,Y), R=['No',X,'no','es','padre','de',Y].

ismotherof(X,Y,R):-madrede(X,Y), R=['Si',X,'es','madre','de',Y].
ismotherof(X,Y,R):- \+madrede(X,Y), R=['No',X,'no','es','madre','de',Y].

issiblingof(X,Y,R):-hermanode(X,Y),R=['Si',X,'es','herman@','de',Y].
issiblingof(X,Y,R):- \+hermanode(X,Y),R=['No',X,'no','es','herman@','de',Y].

isgrandfatherof(X,Y,R):-abuelode(X,Y),R=['Si',X,'es','abuel@','de',Y].
isgrandfatherof(X,Y,R):- \+abuelode(X,Y),R=['No',X,'no','es','abuel@','de',Y].

isuncleof(X,Y,R):-tiode(X,Y),R=['Si',X,'es','ti@','de',Y].
isuncleof(X,Y,R):- \+tiode(X,Y),R=['No',X,'no','es','ti@','de',Y].

isnephewof(X,Y,R):-sobrinode(X,Y),R=['Si',X,'es','sobrin@','de',Y].
isnephewof(X,Y,R):- \+sobrinode(X,Y),R=['No',X,'no','es','sobrin@','de',Y].

iscousinof(X,Y,R):-primode(X,Y),R=['Si',X,'es','prim@','de',Y].
iscousinof(X,Y,R):- \+primode(X,Y),R=['No',X,'no','es','prim@','de',Y].

isfatherinlawof(X,Y,R):-suegrode(X,Y),R=['Si',X,'es','suegr@','de',Y].
isfatherinlawof(X,Y,R):- \+suegrode(X,Y),R=['No',X,'no','es','suegr@','de',Y].

isbrotherinlawof(X,Y,R):-cunadode(X,Y),R=['Si',X,'es','cuñad@','de',Y].
isbrotherinlawof(X,Y,R):- \+cunadode(X,Y),R=['No',X,'no','es','cuñad@','de',Y].

issoninlawof(X,Y,R):-yernode(X,Y),R=['Si',X,'es','yerno/nuera','de',Y].
issoninlawof(X,Y,R):- \+yernode(X,Y),R=['No',X,'no','es','yerno/nuera','de',Y].

ishusbandof(X,Y,R):-esposode(X,Y), R=['Si',X,'es','esposo','de',Y].
ishusbandof(X,Y,R):- \+esposode(X,Y);\+esposode(Y,X), R=['No',X,'no','es','esposo','de',Y].

iswifeof(X,Y,R):-esposode(Y,X), R=['Si',X,'es','esposa','de',Y].
iswifeof(X,Y,R):- \+esposode(Y,X), R=['No',X,'no','es','esposa','de',Y].

issonof(X,Y,R):-padrede(Y,X),R = ['Si',X,'es','hijo','de',Y].
issonof(X,Y,R):- \+padrede(Y,X),R = ['No',X,'no','es','hijo','de',Y].

isgrandsonof(X,Y,R):-nietode(X,Y),R = ['Si',X,'es','nieto','de',Y].
isgrandsonof(X,Y,R):- \+nietode(X,Y),R = ['No',X,'no','es','nieto','de',Y].

isnephewinlawof(X,Y,R):-sobrinopoliticode(X,Y),R = ['Si',X,'es','sobrino','politico','de',Y].
isnephewinlawof(X,Y,R):- \+sobrinopoliticode(X,Y),R = ['No',X,'no','sobrino','politico','de',Y].

real(stanlee).
real(steveditko).
real(jackkirby).
real(jonathanhickman).
real(chrisclaremont).
real(alanmoore).
real(jmdematteis).
real(danslott).
real(alexross).
real(alewing).

ficticio(peterparker).
ficticio(milesmorales).
ficticio(jackpower).
ficticio(alexpower).
ficticio(tonystark).
ficticio(rhodes).
ficticio(thor).
ficticio(betaraybill).
ficticio(blackpanther).
ficticio(odin).
ficticio(zeus).
ficticio(hercules).
ficticio(dannyrand).
ficticio(steverogers).
ficticio(falcon).
ficticio(wintersoldier).
ficticio(matthewmurdock).
ficticio(hulk).
ficticio(reedrichards).
ficticio(jonnhystorm).
ficticio(bengrimm).
ficticio(franklinrichards).
ficticio(charlesxavier).
ficticio(sentry).
ficticio(wolverine).
ficticio(gambit).
ficticio(wadewilson).
ficticio(scottsummers).
ficticio(nightcrawler).
ficticio(cable).
ficticio(colossus).
ficticio(bestia).
ficticio(stephenstrange).
ficticio(clintbarton).
ficticio(hankpym).
ficticio(scottlang).
ficticio(peterquill).
ficticio(rocketracoon).
ficticio(drax).
ficticio(groot).
ficticio(craneorojo).
ficticio(baronzemo).
ficticio(bullseye).
ficticio(venom).
ficticio(carnage).
ficticio(duendeverde).
ficticio(lagarto).
ficticio(droctopus).
ficticio(rhino).
ficticio(electro).
ficticio(drdoom).
ficticio(hombretopo).
ficticio(galactus).
ficticio(onslaught).
ficticio(apocalipsis).
ficticio(mrsynister).
ficticio(magneto).
ficticio(thanos).
ficticio(surtur).
ficticio(loki).
ficticio(mephisto).
ficticio(nightmare).
ficticio(agamotto).
ficticio(dormammu).
ficticio(ghostrider).
ficticio(owenreece).
ficticio(katiepower).
ficticio(juliepower).
ficticio(scarletwitch).
ficticio(storm).
ficticio(jeangrey).
ficticio(rogue).
ficticio(emmafrost).
ficticio(susanstorm).
ficticio(blackwidow).
ficticio(gamora).
ficticio(nebula).
ficticio(valeriarichards).
ficticio(americachavez).
ficticio(hela).
ficticio(blackcat).
ficticio(intermediario).
ficticio(silversurfer).
ficticio(terrax).
ficticio(caos).
ficticio(orden).
ficticio(muerte).
ficticio(arishem).
ficticio(exitar).
ficticio(ashema).
ficticio(scathan).
ficticio(tiamut).
ficticio(amor).
ficticio(odio).
ficticio(abraxas).
ficticio(abominacion).
ficticio(adamwarlock).
ficticio(eternidad).
ficticio(infinito).
ficticio(tribunalviviente).
ficticio(kubik).
ficticio(kosmos).
ficticio(kobik).
ficticio(shaperofworlds).
ficticio(firstfirmament).
ficticio(cronos).
ficticio(entropia).
ficticio(eon).
ficticio(protegido).
ficticio(chaosking).
ficticio(oblivion).
ficticio(beyonder).
ficticio(uatu).
ficticio(ego).
ficticio(neverqueen).
ficticio(phoenixforce).
ficticio(toba).
ficticio(toaa).

hombre(stanlee).
hombre(steveditko).
hombre(jackkirby).
hombre(jonathanhickman).
hombre(chrisclaremont).
hombre(alanmoore).
hombre(jmdematteis).
hombre(danslott).
hombre(alexross).
hombre(alewing).

hombre(peterparker).
hombre(milesmorales).
hombre(jackpower).
hombre(alexpower).
hombre(tonystark).
hombre(rhodes).
hombre(thor).
hombre(betaraybill).
hombre(blackpanther).
hombre(galactus).
hombre(silversurfer).
hombre(terrax).
hombre(odin).
hombre(loki).
hombre(zeus).
hombre(hercules).
hombre(dannyrand).
hombre(steverogers).
hombre(falcon).
hombre(wintersoldier).
hombre(matthewmurdock).
hombre(hulk).
hombre(reedrichards).
hombre(jonnhystorm).
hombre(bengrimm).
hombre(franklinrichards).
hombre(charlesxavier).
hombre(sentry).
hombre(wolverine).
hombre(gambit).
hombre(wadewilson).
hombre(scottsummers).
hombre(nightcrawler).
hombre(cable).
hombre(colossus).
hombre(bestia).
hombre(stephenstrange).
hombre(clintbarton).
hombre(hankpym).
hombre(scottlang).
hombre(peterquill).
hombre(rocketracoon).
hombre(drax).
hombre(groot).
hombre(craneorojo).
hombre(baronzemo).
hombre(bullseye).
hombre(venom).
hombre(carnage).
hombre(duendeverde).
hombre(lagarto).
hombre(droctopus).
hombre(rhino).
hombre(electro).
hombre(drdoom).
hombre(hombretopo).
hombre(onslaught).
hombre(apocalipsis).
hombre(mrsynister).
hombre(magneto).
hombre(thanos).
hombre(surtur).
hombre(mephisto).
hombre(nightmare).
hombre(agamotto).
hombre(dormammu).
hombre(ghostrider).
hombre(owenreece).
hombre(abominacion).
hombre(adamwarlock).

mujer(katiepower).
mujer(juliepower).
mujer(scarletwitch).
mujer(storm).
mujer(jeangrey).
mujer(rogue).
mujer(emmafrost).
mujer(susanstorm).
mujer(blackwidow).
mujer(gamora).
mujer(nebula).
mujer(valeriarichards).
mujer(americachavez).
mujer(hela).
mujer(blackcat).

entidad(intermediario).
entidad(caos).
entidad(orden).
entidad(muerte).
entidad(arishem).
entidad(exitar).
entidad(ashema).
entidad(scathan).
entidad(tiamut).
entidad(amor).
entidad(odio).
entidad(abraxas).
entidad(eternidad).
entidad(infinito).
entidad(tribunalviviente).
entidad(kubik).
entidad(kosmos).
entidad(kobik).
entidad(shaperofworlds).
entidad(firstfirmament).
entidad(cronos).
entidad(entropia).
entidad(eon).
entidad(protegido).
entidad(chaosking).
entidad(oblivion).
entidad(beyonder).
entidad(uatu).
entidad(ego).
entidad(neverqueen).
entidad(phoenixforce).
entidad(toba).
entidad(toaa).

escritor(stanlee).
escritor(jackkirby).
escritor(steveditko).
escritor(jmdematteis).
escritor(chrisclaremont).
escritor(jonathanhickman).
escritor(danslott).
escritor(alanmoore).
escritor(alewing).

creador(stanlee).
creador(jackkirby).
creador(steveditko).

escritor4F(jonathanhickman).
escritor4F(chrisclaremont).
escritorSW2015(jonathanhickman).
escritorIH(alewing).
escritorSM(danslott).

britanico(chrisclaremont).
britanico(alewing).

nacio1950(chrisclaremont).
nacio1953(jmdematteis).

dibujante(alexross).

heroe(peterparker).
heroe(milesmorales).
heroe(alexpower).
heroe(jackpower).
heroe(tonystark).
heroe(rhodes).
heroe(blackpanther).
heroe(thor).
heroe(betaraybill).
heroe(odin).
heroe(zeus).
heroe(hercules).
heroe(dannyrand).
heroe(steverogers).
heroe(falcon).
heroe(wintersoldier).
heroe(matthewmurdock).
heroe(hulk).
heroe(reedrichards).
heroe(jonnhystorm).
heroe(bengrimm).
heroe(franklinrichards).
heroe(charlesxavier).
heroe(sentry).
heroe(wolverine).
heroe(gambit).
heroe(wadewilson).
heroe(scottsummers).
heroe(nightcrawler).
heroe(cable).
heroe(colossus).
heroe(bestia).
heroe(stephenstrange).
heroe(hankpym).
heroe(scottlang).
heroe(rocketracoon).
heroe(drax).
heroe(groot).
heroe(peterquill).
heroe(clintbarton).
heroe(juliepower).
heroe(katiepower).
heroe(scarletwitch).
heroe(storm).
heroe(jeangrey).
heroe(rogue).
heroe(emmafrost).
heroe(susanstorm).
heroe(gamora).
heroe(nebula).
heroe(valeriarichards).
heroe(americachavez).
heroe(blackwidow).

villano(baronzemo).
villano(craneorojo).
villano(bullseye).
villano(venom).
villano(carnage).
villano(duendeverde).
villano(lagarto).
villano(droctopus).
villano(rhino).
villano(electro).
villano(drdoom).
villano(hombretopo).
villano(galactus).
villano(onslaught).
villano(apocalipsis).
villano(mrsynister).
villano(magneto).
villano(thanos).
villano(surtur).
villano(loki).
villano(mephisto).
villano(nightmare).
villano(agamotto).
villano(dormammu).
villano(ghostrider).
villano(owenreece).
villano(abominacion).
villano(adamwarlock).
villano(blackcat).
villano(hela).

encarnacaos(caos).
encarnaorden(orden).
encarnamuerte(muerte).
encarnaamor(amor).
encarnaodio(odio).
encarnatiempo(eternidad).
encarnatiempo(firstfirmament).
encarnalineatemporal(cronos).
encarnalineatemporal(entropia).
encarnavacio(oblivion).
encarnaposibilidades(neverqueen).
encarnavida(phoenixforce).
encarnavacio(abraxas).
encarnaespacio(infinito).
encarnadualidades(intermediario).

celestial(arishem).
celestial(exitar).
celestial(ashema).
celestial(scathan).
celestial(tiamut).

cubocosmico(kubik).
cubocosmico(kosmos).
cubocosmico(kobik).
cubocosmico(shaperofworlds).

primercosmos(firstfirmament).
septimocosmos(eternidad).

hijoeternidad(entropia).
hijoeternidad(eon).

planetaviviente(ego).
ciclope(eon).
aspectooblivion(chaosking).
supremo(toba).
supremo(toaa).
odio(toba).
amor(toaa).

juezsupremo(tribunalviviente).
vigilante(uatu).
vigilante(matthewmurdock).

verde(abraxas).
verde(scathan).
verde(hulk).
verde(gamora).
azul(exitar).
azul(kobik).
azul(nightcrawler).
azul(bestia).
rojo(arishem).
rojo(craneorojo).
rojo(carnage).
morado(ashema).
morado(galactus).
amarillo(tiamut).
amarillo(kosmos).
rosa(kubik).
blanco(shaperofworlds).
rubio(sentry).
negro(venom).


poderes(peterparker).
poderes(milesmorales).
poderes(alexpower).
poderes(jackpower).
poderes(tonystark).
poderes(rhodes).
poderes(blackpanther).
poderes(thor).
poderes(betaraybill).
poderes(odin).
poderes(zeus).
poderes(hercules).
poderes(dannyrand).
poderes(steverogers).
poderes(falcon).
poderes(wintersoldier).
poderes(matthewmurdock).
poderes(hulk).
poderes(reedrichards).
poderes(jonnhystorm).
poderes(bengrimm).
poderes(franklinrichards).
poderes(charlesxavier).
poderes(sentry).
poderes(wolverine).
poderes(gambit).
poderes(wadewilson).
poderes(scottsummers).
poderes(nightcrawler).
poderes(cable).
poderes(colossus).
poderes(bestia).
poderes(stephenstrange).
poderes(hankpym).
poderes(scottlang).
poderes(rocketracoon).
poderes(drax).
poderes(groot).
poderes(peterquill).
poderes(craneorojo).
poderes(bullseye).
poderes(venom).
poderes(carnage).
poderes(duendeverde).
poderes(lagarto).
poderes(droctopus).
poderes(rhino).
poderes(electro).
poderes(drdoom).
poderes(hombretopo).
poderes(galactus).
poderes(onslaught).
poderes(apocalipsis).
poderes(mrsynister).
poderes(magneto).
poderes(thanos).
poderes(surtur).
poderes(loki).
poderes(mephisto).
poderes(nightmare).
poderes(agamotto).
poderes(dormammu).
poderes(ghostrider).
poderes(owenreece).
poderes(abominacion).
poderes(adamwarlock).
poderes(juliepower).
poderes(katiepower).
poderes(scarletwitch).
poderes(storm).
poderes(jeangrey).
poderes(rogue).
poderes(emmafrost).
poderes(susanstorm).
poderes(gamora).
poderes(nebula).
poderes(valeriarichards).
poderes(americachavez).

sinpoderes(clintbarton).
sinpoderes(baronzemo).
sinpoderes(blackwidow).

alien(thor).
alien(betaraybill).
alien(odin).
alien(zeus).
alien(hercules).
alien(venom).
alien(carnage).

dios(thor).
dios(betaraybill).
dios(odin).
dios(zeus).
dios(hercules).
dios(apocalipsis).
diosrayo(zeus).
diosamuerte(hela).

estudiante(peterparker).
estudiante(milesmorales).
estudiante(jackpower).
estudiante(alexpower).
estudiante(juliepower).
estudiante(katiepower).

usaarmadura(tonystark).
usaarmadura(rhodes).
usaarmadura(drdoom).

mordidoarana(peterparker).
mordidoarana(milesmorales).

reywakanda(blackpanther).

miembro4F(jonnhystorm).
miembro4F(reedrichards).
miembro4F(bengrimm).
miembro4F(susanstorm).

miembroXMen(charlesxavier).
miembroXMen(wolverine).
miembroXMen(wadewilson).
miembroXMen(gambit).
miembroXMen(scottsummers).
miembroXMen(nightcrawler).
miembroXMen(cable).
miembroXMen(bestia).
miembroXMen(colossus).
miembroXMen(storm).
miembroXMen(rogue).
miembroXMen(jeangrey).
miembroXMen(emmafrost).

miembroPP(jackpower).
miembroPP(alexpower).
miembroPP(juliepower).
miembroPP(katiepower).

trajeazulrojo(peterparker).
trajenegro(milesmorales).
trajeblanco(alexpower).
trajeazul(jackpower).
trajerojo(juliepower).
trajerojo(scarletwitch).
trajeamarillo(katiepower).
trajenegro(blackcat).
trajeblanco(beyonder).

usamartillo(thor).
usamartillo(betaraybill).
usaescudo(steverogers).
usacartas(gambit).
usasillaruedas(charlesxavier).
usatrajehalcon(falcon).
usabrazometalico(wintersoldier).
usatrajeverde(duendeverde).
usabombas(duendeverde).
usapistola(peterquill).
usaarcoyflecha(clintbarton).
usamagia(scarletwitch).
usatelepatia(jeangrey).

padrethor(odin).

antmanoriginal(hankpym).
antman(scottlang).
antman(hankpym).

participoWWII(steverogers).
participoWWII(wintersoldier).

cientifico(hulk).
cientifico(reedrichards).

regenerarcuerpo(wolverine).
regenerarcuerpo(wadewilson).

puedeestirarcuerpo(reedrichards).
encendercuerpo(jonnhystorm).
ciego(matthewmurdock).
cuerpometalico(colossus).
esqueletometalico(wolverine).
rayoslaser(scottsummers).
puedeteletransportarse(nightcrawler).
hechicerosupremo(stephenstrange).

artistamarcial(dannyrand).
punohierro(dannyrand).

tienebrazosmecanicos(droctopus).
tienecancer(wadewilson).

hijoreed(franklinrichards).
hijoscott(cable).
hijareed(valeriarichards).
hijozeus(hercules).

asemejasuperman(sentry).
aparienciahumana(thor).

miembroGOTG(rocketracoon).
miembroGOTG(drax).
miembroGOTG(groot).
miembroGOTG(peterquill).
miembroGOTG(gamora).
miembroGOTG(nebula).

enemigo4F(galactus).
enemigo4F(drdoom).
enemigo4F(hombretopo).

enemigoXMen(onslaught).
enemigoXMen(mrsynister).
enemigoXMen(apocalipsis).
enemigoXMen(magneto).

esmapache(rocketracoon).
esdestructor(drax).
esungroot(groot).
esunlagarto(lagarto).
esunrinoceronte(rhino).

enemigoCA(baronzemo).
enemigoCA(craneorojo).
enemigoDD(bullseye).

enemigoSM(venom).
enemigoSM(carnage).
enemigoSM(duendeverde).
enemigoSM(lagarto).
enemigoSM(rhino).
enemigoSM(electro).
enemigoSM(droctopus).
enemigoSM(blackcat).

enemigoThor(surtur).
enemigoThor(loki).

enemigoStrange(mephisto).
enemigoStrange(nightmare).
enemigoStrange(dormammu).
enemigoStrange(agamotto).

enemigoHulk(abominacion).
enemigoGOTG(adamwarlock).

controlaelectricidad(electro).
clonamutantes(mrsynister).
controlamagnetismo(magneto).
controlamagnetismo(onslaught).
controlaclima(storm).
copiapoderes(rogue).
copiapoderes(protegido).
controlahielo(emmafrost).

dictador(drdoom).
vivebajotierra(hombretopo).
comeplanetas(galactus).
grande(onslaught).
amamuerte(thanos).
provocoRagnarok(surtur).
hermanoThor(loki).
habitainfierno(mephisto).
controlasuenos(nightmare).
pareceoruga(agamotto).
habitadimensionoscura(dormammu).
secuazMephisto(ghostrider).
hombremolecula(owenreece).
robot(nebula).
sernexus(americachavez).
espiarusa(blackwidow).

playakinator():-writeln('¿Tu personaje es real o ficticio?').
	
yesrealcharacter(Reales,R1):-writeln('¿Tu personaje es hombre o mujer?'),read(X),replace0(Reales,X,NewList,R1).

norealcharacter(Ficticios,R1):-writeln('¿Tu personaje es hombre, mujer o entidad?'),read(X),replace0(Ficticios,X,NewList,R1).

getrealcharacters(RCharacters,R1):-writeln('¿Tu personaje es dibujante o escritor?'),read(X),replace0(RCharacters,X,NewList,R1).

getfictionalcharacters(FCharacters,R1):-writeln('¿Tu personaje es heroe o villano?'),read(X),replace0(FCharacters,X,NewList,R1).

enfermedad(lupus).
enfermedad(cancerdepiel).
enfermedad(bocio).

sintomade(fatiga,bocio).
sintomade(hinchazonenelcuello,bocio).
sintomade(tos,bocio).
sintomade(ronquidos,bocio).
sintomade(dificultadpararespirar,bocio).
sintomade(dificultadparacomer,bocio).

sintomade(fatiga,lupus).
sintomade(erupcioncutanea,lupus).
sintomade(dolorcabeza,lupus).
sintomade(fiebre,lupus).
sintomade(artritis,lupus).
sintomade(sarpullido,lupus).
sintomade(problemasrenales,lupus).
sintomade(problemascardiacos,lupus).
sintomade(problemasneurologicos,lupus).
sintomade(problemasrespiratorios,lupus).

sintomade(llagas,cancerdepiel).
sintomade(protuberancias,cancerdepiel).
sintomade(marcas,cancerdepiel).
sintomade(imperfecciones,cancerdepiel).
sintomade(dolor,cancerdepiel).
sintomade(picazon,cancerdepiel).
sintomade(bultos,cancerdepiel).

causade(exposicionalsol,cancerdepiel).
causade(antecedentes,cancerdepiel).
causade(exposicionaproductos-quimicos,cancerdepiel).
causade(cabinasbronceadoras,cancerdepiel).
causade(inflamacionesgraveenlapiel,cancerdepiel).
causade(xerodermapigmentoso,cancerdepiel).
causade(sindromedelnevus,cancerdepiel).

causade(antecedentes,lupus).
causade(genes,lupus).
causade(cambioshormonales,lupus).
causade(medicamentos,lupus).
causade(mononucleosis,lupus).
causade(luzuv,lupus).

causade(metabolismo,bocio).
causade(temperaturacorporal,bocio).
causade(frecuenciacardiaca,bocio).
causade(presionarterial,bocio).
causade(interaccionehormonales,bocio).
causade(crecimientoinfancia,bocio).

medicamentode(hidroxicloroquina,lupus).
medicamentode(esteroides,lupus).
medicamentode(ibuprofeno,lupus).
medicamentode(naproxeno,lupus).
medicamentode(indometacina,lupus).
medicamentode(nabumetona,lupus).
medicamentode(celecoxib,lupus).

medicamentode(suplementoyodo,bocio).
medicamentode(antitiroideos,bocio).
medicamentode(yodoradioactivo,bocio).
medicamentode(extirpacionquirurgica,bocio).
medicamentode(homeopaticos,bocio).
medicamentode(tiroxina,bocio).
medicamentode(metimazol,bocio).

medicamentode(quimioterapia,cancerdepiel).
medicamentode(cirugia,cancerdepiel).
medicamentode(cirugiamohs,cancerdepiel).

especialistade(oncologo,cancerdepiel).
especialistade(dermatooncologo,cancerdepiel).
especialistade(cirujanooncologo,cancerdepiel).
especialistade(cirujanoplastico,cancerdepiel).
especialistade(dermatologo,cancerdepiel).

especialistade(dermatologo,lupus).
especialistade(cardiologo,lupus).
especialistade(nefrologo,lupus).
especialistade(neurologo,lupus).
especialistade(gastroenterologo,lupus).
especialistade(neumologo,lupus).
especialistade(perinatologo,lupus).

especialistade(endocrinologo,bocio).
especialistade(cirujanogeneral,bocio).
especialistade(otorrinolaringologo,bocio).

buscarenfermedad([],E,0).
buscarenfermedad(X,E,1):-sintomade(X,E).
buscarenfermedad([X|Xs],E,P):-enfermedad(E),buscarenfermedad(X,E,S1),buscarenfermedad(Xs,E,S2),P is S1+S2.

cantSint(E,C):-findall(X,sintomade(X,E),L),length(L,R),C is R.

diagnostico([X|Xs],E,K):-buscarenfermedad([X|Xs],E,P),cantSint(E,T),K is P*100/T.

recetade(M,S):-sintomade(S,Z),medicinade(M,Z).

atiendeespecialista(E,S):-sintomade(S,Z),especialistade(E,Z).

mereceta(Es,M,E):-medicinade(M,E),sintomade(S,E),atiendeespecialista(Es,S).

getmedicine(X,R):-findall(Y,medicamentode(Y,X),Medicamentos),atomic_list_concat(Medicamentos,', ',MedicamentosStr),
format(atom(R),'Algunos de los medicamentos para tratar el ~w incluyen ~w por mencionar algunos.',[X,MedicamentosStr]).

getmedicinetwo(X,Y,R):-findall(Z,medicamentode(Z,Y),Medicamentos),atomic_list_concat(Medicamentos,', ',MedicamentosStr),
format(atom(R),'Algunos de los medicamentos que ~w podria consumir para tratar el ~w incluyen ~w por mencionar algunos.',[X,Y,MedicamentosStr]).

getmedicinesymptom(X,R):-findall(Y,recetade(Y,X),Medicamentos),atomic_list_concat(Medicamentos,', ',MedicamentosStr),
format(atom(R),'Algunos de los medicamentos para tratar el sintoma de la ~w incluyen ~w.',[X,MedicamentosStr]).

getmedicinesymptomtwo(X,Y,R):-findall(Z,recetade(Z,Y),Medicamentos),atomic_list_concat(Medicamentos,', ',MedicamentosStr),
format(atom(R),'Algunos de los medicamentos que ~w podria tomar para tratar el sintoma de la ~w incluyen ~w.',[X,Y,MedicamentosStr]).

getspecialist(X,R):-findall(Y,especialistade(Y,X),Especialistas),atomic_list_concat(Especialistas,', ',EspecialistasStr),
format(atom(R),'Algunos especialistas que podrian ayudar a tratar la enfermedad de ~w son: ~w.',[X,EspecialistasStr]).

getspecialisttwo(X,Y,R):-findall(Z,especialistade(Z,Y),Especialistas),atomic_list_concat(Especialistas,', ',EspecialistasStr),
format(atom(R),'Algunos especialistas que podrian ayudar a ~w tratar la enfermedad de ~w son: ~w.',[X,Y,EspecialistasStr]).

getspecialistrecipe(X,R):-findall(E,mereceta(E,M,X),Especialistas),atomic_list_concat(Especialistas,', ',EspecialistasStr),
findall(M,mereceta(E,M,X),Medicinas),atomic_list_concat(Medicinas,', ',MedicinasStr),format(atom(R),'Algunos especialistas 
que pueden tratar la enfermedad de ~w son ~w y podrian recetar las siguientes medicinas ~w',[X,EspecialistasStr,MedicinasStr]).

getspecialistrecipetwo(X,Y,R):-findall(E,mereceta(E,M,Y),Especialistas),atomic_list_concat(Especialistas,', ',EspecialistasStr),
findall(M,mereceta(E,M,Y),Medicinas),atomic_list_concat(Medicinas,', ',MedicinasStr),format(atom(R),'Algunos especialistas 
que pueden ayudarle a ~w a tratar la enfermedad de ~w son ~w y podrian recetar las siguientes medicinas ~w',[X,Y,EspecialistasStr,MedicinasStr]).

getprobability(X,Y,R):-diagnostico(Y,X,K),format(atom(R),'La probabilidad de tener la enfermedad de ~w es de ~w por ciento de acuerdo con los sintomas',[X,K]).

getcauses(X,R):-findall(Y,causade(Y,X),Causas),atomic_list_concat(Causas,', ',CausasStr),format(atom(R),'Las principales causas por las cuales alguien puede presentar 
~w incluyen aunque no se limitan a ~w.',[X,CausasStr]).

getsymptomspecialist(S,R):-findall(E,atiendeespecialista(E,S),Especialistas),atomic_list_concat(Especialistas,', ',EspecialistasStr),
format(atom(R),'Algunos especialistas que pueden ayudar a tratar el sintoma de ~w incluyen aunque no se limitan a ~w.',[S,EspecialistasStr]).

getsickness(List,R):-buscarenfermedad(List,E,P),format(atom(R),'De acuerdo con los sintomas la enfermedad mas probable a tener es ~w',[E]).

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

replace0([], _, _, Resp, R):-append(Resp, [], R),!.


replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagSymptomSpecialist,
	getsymptomspecialist(Atom,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagCauses,
	getcauses(Atom,R).

replace0([I,J,K,L,M],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(K,Input,Atom2),
	nth0(L,Input,Atom3),
	nth0(M,Input,Atom4),
	nth0(0,Resp,X),
	X == flagSickness,
	getsickness([Atom,Atom1,Atom2,Atom3,Atom4],R).

replace0([I,J,K,L,M,N],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(K,Input,Atom2),
	nth0(L,Input,Atom3),
	nth0(M,Input,Atom4),
	nth0(N,Input,Atom5),
	nth0(0,Resp,X),
	X == flagProbability,
	getprobability(Atom,[Atom1,Atom2,Atom3,Atom4,Atom5],R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagSpecialistRecipe,
	getspecialistrecipe(Atom,R).

replace0([I,J],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(0,Resp,X),
	X == flagSpecialistRecipeTwo,
	getspecialistrecipetwo(Atom,Atom1,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagSpecialist,
	getspecialist(Atom,R).

replace0([I,J],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(0,Resp,X),
	X == flagSpecialistTwo,
	getspecialisttwo(Atom,Atom1,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagMedicineSymptom,
	getmedicinesymptom(Atom,R).

replace0([I,J],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(0,Resp,X),
	X == flagMedicineSymptomTwo,
	getmedicinesymptomtwo(Atom,Atom1,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(0,Resp,X),
	X == flagMedicine,
	getmedicine(Atom,R).

replace0([I,J],Input,_,Resp,R):-
	nth0(I,Input,Atom),
	nth0(J,Input,Atom1),
	nth0(0,Resp,X),
	X == flagMedicineTwo,
	getmedicinetwo(Atom,Atom1,R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Resp, X),
	X == flagAkinator,
	playakinator().

replace0([],X,NewL,R):-
	R = ['Lista completada'],writeln(NewL).

replace0([L|List],X,NewList,R):-
	X == hombre,
	hombre(L),
	append(NewList,[L],NewL),
	replace0(List,X,NewL,R).

replace0([L|List],X,NewList,R):-
	X == mujer,
	mujer(L),
	append(NewList,[L],NewL),
	replace0(List,X,NewL,R).

replace0([L|List],X,NewList,R):-
	X == entidad,
	entidad(L),
	append(NewList,[L],NewL),
	replace0(List,X,NewL,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Resp,X),
	findall(Y,ficticio(Y),Ficticios),
	X == fictionalChar,	
	norealcharacter(Ficticios,R).

replace0([I|_],Input,_,Resp,R):-
	nth0(I,Resp,X),
	findall(Y,real(Y),Reales),
	X == realChar,
	yesrealcharacter(Reales,R).

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

%Eliza guesses who your husband is
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagHusband,
	husbandof(_,Atom,R).

%Eliza guesses who your wife is
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagWife,
	wifeof(_,Atom,R).

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

%Eliza guesses who your nephews are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagNephews,
	nephewof(_,Atom,R).

% Eliza guesses who your grandsons are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagGrandSon,
	grandsonof(_,Atom,R).

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

% Eliza guesses who your parents in law are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagFatheInLaw,
	fatherinlawof(_,Atom,R).

% Eliza guesses who your brothers in law are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagBrotherInLaw,
	brotherinlawof(_,Atom,R).

% Eliza guesses who your sons in law are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagSonInLaw,
	soninlawof(_,Atom,R).

% Eliza guesses who your uncles in law are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagUncleInLaw,
	uncleinlawof(_,Atom,R).

% Eliza guesses who your nephews in law are
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagNephewInLaw,
	nephewinlawof(_,Atom,R).

%Eliza guesses if two persons are parients
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagPar,
	parientof(Atom,Atom1,R).

%Eliza guesses if person1 is father of person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsFather,
	isfatherof(Atom,Atom1,R).	

%Eliza guesses if person1 is mother of person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsMother,
	ismotherof(Atom,Atom1,R).

%Eliza guesses if person1 is sibling to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsSibling,
	issiblingof(Atom,Atom1,R).

%Eliza guesses if person1 is grandfather to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsGrand,
	isgrandfatherof(Atom,Atom1,R).

%Eliza guesses if person1 is uncle to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsUncle,
	isuncleof(Atom,Atom1,R).

%Eliza guesses if person1 is nephew to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsNephew,
	isnephewof(Atom,Atom1,R).

%Eliza guesses if person1 is cousin to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsCousin,
	iscousinof(Atom,Atom1,R).

%Eliza guesses if person1 is father in law to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsFatherInLaw,
	isfatherinlawof(Atom,Atom1,R).

%Eliza guesses if person1 is brother in law to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsBrotherInLaw,
	isbrotherinlawof(Atom,Atom1,R).

%Eliza guesses if person1 is son in law to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsSonInLaw,
	issoninlawof(Atom,Atom1,R).

%Eliza guesses if person1 is uncle in law to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsUncleInLaw,
	isuncleinlawof(Atom,Atom1,R).

%Eliza guesses if person1 is nephew in law to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsNephewInLaw,
	isnephewinlawof(Atom,Atom1,R).

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

%Eliza guesses if person1 is husband to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsHusband,
	ishusbandof(Atom,Atom1,R).

%Eliza guesses if person1 is wife to person2
replace0([I,J], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(J, Input, Atom1),
	nth0(0, Resp, X),
	X == flagIsWife,
	iswifeof(Atom,Atom1,R).


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
