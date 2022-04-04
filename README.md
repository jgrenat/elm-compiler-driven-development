# Compiler Driven Development avec Elm !

<img src="./resources/elm-logo.svg" alt="" role="presentation" width="150" height="150" />

Bienvenue dans notre workshop pour découvrir le langage Elm et un nouveau paradigme de programmation : 
laisser le compilateur vous dire quoi faire !

Mais d'abord, commençons par installer Elm :

## Installation de Elm

Deux méthodes pour installer Elm. Vous pouvez soit le télécharger et l'installer [depuis cette page](https://guide.elm-lang.org/install/elm.html) du guide officiel, soit utiliser `npm` avec la commande suivante :

```
npm install --global elm
```

## Installer le support Elm pour votre éditeur

Maintenant que Elm est installé, vous pouvez configurer votre éditeur de texte pour la coloration syntaxique !

- [Atom](https://atom.io/packages/language-elm)
- [Emacs](https://github.com/jcollard/elm-mode)
- [Webstorm / IntelliJ](https://github.com/klazuka/intellij-elm)
- [Sublime Text](https://guide.elm-lang.org/install/editor.html)
- [Vim](https://github.com/ElmCast/elm-vim)
- [VS Code](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode)


## Récupérer l'atelier

Vous pouvez maintenant récupérer le code de cet atelier, soit [en téléchargeant l'archive](https://github.com/jgrenat/elm-compiler-driven-development/archive/master.zip), soit en le clonant :

```
git clone https://github.com/jgrenat/elm-compiler-driven-development.git
cd elm-compiler-driven-development
```

Une fois l'atelier récupéré par l'une de ces deux méthodes, vous pouvez lancer la commande suivante à la racine du projet :

```
elm reactor
```

Le rendu des exercices est disponible à l'adresse http://localhost:8000/src

## Déroulement de l'atelier

Chaque fichier représente un exercice. Vous pouvez commencer un exercice en l'ouvrant dans elm reactor, par exemple à 
l'adresse http://localhost:8000/src/Exercise010String.elm pour le premier. 

Ne soyez pas surpris si une erreur apparaît, c'est normal ! Lisez-la attentivement, le compilateur est votre mentor pour la corriger ! 💪

L'atelier a été pensé pour fonctionner avec ces erreurs telles qu'elles sont affichées par le compilateur. Si votre éditeur de texte vous affiche également les erreurs, sachez que celles de Elm Reactor sont plus détaillées et plus faciles à comprendre.

Une fois que le code compile, c'est que l'exercice est réussi, vous pouvez passer à l'exercice suivant ! 🎉

Une fois les exercices "simples" réussis, vous pouvez passer au niveau supérieur dans le dossier `Advanced`.
Vous utiliserez alors la même méthode pour développer de nouvelles fonctionnalités sur une application
existante : écrire un code provoquant une erreur de compilation et laisser le compilateur
vous guider. C'est un procédé très efficace quelle que soit la taille du projet sur lequel vous travaillez.
C'est ce qu'on appelle le _Compiler-Driven-Development_ !

## Vous êtes bloqué ?

Pas de panique, on est là pour vous aider ! Levez la main frénétiquement et on arrive ! 🙋‍♀️🙋‍♂️
