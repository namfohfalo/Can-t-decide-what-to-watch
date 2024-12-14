(defrule init-system
?k <-   (start)
=>
        (assert (question "Do you want to start?" "yes"))
        (retract ?k)
)

(defrule movie-television
?k <-   (Movie a Television)
        (not (exists (Movie a Television used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Movie" "Television"))
        (retract ?k)
        (assert (Movie a Television used))
)

(defrule comedy-action-drama
?k <-   (Comedy a Action a Drama)
        (not (exists (Komedia a Akcja a Dramat used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Comedy" "Action" "Drama"))
        (retract ?k)
        (assert (Komedia a Akcja a Dramat used))
)

(defrule none-mindfuckery-crime
?k <-   (None a Mindfuckery a Crime)
        (not (exists (Komedia a Akcja a Dramat used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Comedy" "Action" "Drama"))
        (retract ?k)
        (assert (Komedia a Akcja a Dramat used))
)

(defrule mindfuckery-types
?k <-   (mindfuckery-types)
        (not (exists (mindfuckery-types)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Backstabbing senator claws his way through politics" "Kids lose their friend to an unearthly creature and track him down"))
        (retract ?k)
        (assert (mindfuckery-types used))
)


(defrule like-comics
?k <-   (yes)
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "Do you like comics?" "DC" "Marvel" "Sci-fi a Fantasy"))
        (retract ?k)
        (assert (live-action used))
)
    
(defrule scifi-fantasy
?k <-   (Sci-fi a Fantasy)
        (not (exists (Sci-fi a Fantasy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Sci-Fi" "Fantasy"))
        (retract ?k)
        (assert (Sci-fi a Fantasy used))
)


(defrule fantasy
?k <-   (Fantasy)
        (not (exists (Fantasy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "Two brothers hunt monsters and demons" "A retelling of Arthurian legend" "Musical fairy tale satire"))
        (retract ?k)
        (assert (Fantasy used))
)