
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

    
(defrule init-system
?k <-   (start)
=>
        (assert (question "Do you want to start?" "yes"))
        (retract ?k)
)
