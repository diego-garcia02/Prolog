padre(roberto).
madre(marbella).
primo(oscar).
primo(axel).
prima(isabella).
tia(martha).
tia(angelina).
tia(marisol).
tio(fideladhemir).
tio(miguel).
tio(sergio).
tio(jaime).
tio(enrique).
tio(raul).
tio(martin).
tio(antonio).
tio(fernando).
hermano(diego).
hermano(fernando).
hermano(sergio).
hermano(miguel).
hermano(martin).
hermano(roberto).
hermano(enrique).
hermano(raul).
hermano(jaime).
hermano(antonio).
hermano(oscar).
hermano(axel).
hermano(fideladhemir).
hermana(karen).
hermana(martha).
hermana(angelina).
hermana(marisol).
hermana(marbella).
hermana(marisol).
hijo(fideladhemir).
hijo(diego).
hijo(oscar).
hijo(axel).
hijo(roberto).
hijo(enrique).
hijo(antonio).
hijo(martin).
hijo(jaime).
hijo(miguel).
hijo(sergio).
hijo(raul).
hijo(fernando).
hija(karen).
hija(marisol).
hija(marbella).
hija(angelina).
hija(martha).
padrede(fidel, marbella).
padrede(fidel, marisol).
padrede(fidel, fideladhemir).
padrede(josecarmen, roberto).
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
padrede(roberto,diego).
madrede(hermila, marbella).
madrede(hermila, marisol).
madrede(hermila, fideladhemir).
madrede(diego, marbella).
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
hermanode(roberto, miguel).
hermanode(roberto, sergio).
hermanode(roberto, jaime).
hermanode(roberto, martin).
hermanode(roberto, enrique).
hermanode(roberto, raul).
hermanode(roberto, antonio).
hermanode(roberto, fernando).
hermanade(roberto, martha).
hermanade(roberto, angelina).
hermanade(marbella, marisol).
hermanode(marbella, fideladhemir).
hermanade(diego, karen).
abuelode(X,Y):- padrede(X, Z),padrede(Z, Y); madrede(X, Z), madrede(Z,Y).
hermanode(X,Y):- padrede(Z, X), padrede(Z, Y); madrede(W, X), madrede(W,X).
tiode(X,Y):- hermanode(X, padrede(Z,Y)); hermanode(X, madrede(Z,Y)); hermanade(X, padrede(Z,Y)); hermanade(X, madrede(Z,Y))
hijode(X,Y):- padrede(Y,X).
