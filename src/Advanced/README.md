# Exercices avancés

Déjà là ? Vous avez été rapide ! Félicitation, vous avez terminé la première partie ! Maintenant, c'est à 
vous de jouer sur des applications plus conséquentes.

Cette fois-ci le code compile, vous pouvez donc lancer l'appli pour comprendre
sa logique.

Puis vous pourrez commencer à modifier le code en provoquant volontairement 
une erreur de compilation, grâce à quoi le compilateur pourra vous guider.
C'est une stratégie courante en Elm. 

## Dessine-moi un Orme

La première application est dans le fichier `Advanced/ExerciseDraw.elm`. Vous pouvez
y dessiner des segments en cliquant à deux endroits du cadre (on va concurrencer 
Photoshop bientôt !).

### Annuler la dernière action

On vous propose d'implémenter dans un premier temps un bouton pour annuler la dernière ligne tracée.

Vous pouvez ajouter le bouton suivant puis vous laisser guider par le compilateur.

```elm
Html.button
    [ onClick Cancel
    , style "font-size" "20pt"
    , style "margin" "5px"
    ]
    [ Html.text "Recommencer" ]
```

### Rejouer la dernière action annulée

Si l'utilisateur a annulé des lignes, faites apparaître un bouton "Rétablir". Lorsqu'on clique dessus,
on rajoute la dernière ligne annulée.

_Indication :_ il faudra probablement rajouter dans le `Model` une liste des lignes annulées...

**Attention**: si l'utilisateur annule une droite et en redessine une autre, la droite 
annulée est "perdue", on ne peut plus la rétablir.

## Jeu du Memory
La deuxième application est dans le fichier `Advanced/ExerciseMemoryGame.elm`.
Il s'agit d'un jeu de memory où il faut retrouver des paires d'animaux.

On vous propose d'implémenter deux nouvelles fonctionnalités à cette application.

L'une assez simple, l'autre beaucoup plus complexe.

### Rejouer
Une fois la partie terminée, on voudrait pouvoir relancer une nouvelle 
partie. Nous vous proposons d'insérer le bouton suivant pour qu'il
n'apparaisse qu'une fois la partie terminée.

```elm
Html.button
    [ onClick Restart
    , style "font-size" "20pt"
    , style "margin" "5px"
    ]
    [ Html.text "Recommencer" ]
```

Maintenant, vous devriez avoir une erreur de compilation... Laissez-vous
guider 😉 !

### Bombe !

On veut rajouter une bombe : lorsque le joueur clique dessus une première fois,
la bombe est amorcée. Si le joueur clique une seconde fois dessus, la partie
est perdue !

Voici l'emoji "bombe" que vous pouvez copier/coller : 💣 

Nous vous proposons de modifier le type `Card` de cette façon :

```elm
type Card
    = Card Emoji Instance
    | Bomb -- Bombe non amorcée
    | PrimedBomb -- Bombe amorcée
```

Et encore une fois, laissez-vous guider par le compilateur !