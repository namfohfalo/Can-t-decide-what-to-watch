(defrule init-system
?k <-   (start)
=>
        (assert (question "Do you want to start?" "yes"))
        (retract ?k)
)

(defrule movie-television
?k <-   (yes)
        (not (exists (yes used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Movie" "Television"))
        (retract ?k)
        (assert (yes used))

)


; Television branch
(defrule television-rule
?k <-   (Television)
        (not (exists (Television used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Comedy" "Action" "Drama"))
        (retract ?k)
        (assert (Television used))
)
;; Comedy branch
(defrule comedy-tele
		(Television used)
?k <-   (Comedy)
        (not (exists (Comedy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Live Action" "Animated"))
        (retract ?k)
        (assert (Comedy used))
)
;;; Live-action comedy
(defrule live-action-comedy
		(Comedy used)
		(Television used)
?k <-   (Live Action)
        (not (exists (Live Action used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Workplace comedy" "Family based comedy" "Friends hanging out"))
        (retract ?k)
        (assert (Live Action used))
)

;;;; Workplace comedy
(defrule workplace-comedy
		(Comedy used)
		(Television used)
?k <-   (Workplace comedy)
        (not (exists (Workplace comedy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What kind of workplace comedy you'd like to see?" "American" "British"))
        (retract ?k)
        (assert (Workplace comedy used))
)

;;;;; American comedy workplace
(defrule american-comedy
		(Comedy used)
		(Television used)
?k <-   (American )
        (not (exists (American  used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What's the most interesting to you?" "One man comedy writing team" "Two best friends work at a hospital" "Pub owners get caught in various antics" "Local government" "Relatable story of dysfunctional workplaces"))
        (retract ?k)
        (assert (American  used))
)

;;;;; British comedy workplace
(defrule british-comedy
		(Comedy used)
		(Television used)
?k <-   (British )
        (not (exists (British  used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What's the most interesting to you?" "Socially awkward IT specialists" "Relatable story of dysfunctional workplaces"))
        (retract ?k)
        (assert (British  used))
)

;;;; Family based comedy
(defrule family-comedy
		(Comedy used)
		(Television used)
?k <-   (Family based comedy)
        (not (exists (Family based comedy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "A suburban middle child growing up" "A rich family deals with their wealth falling apart"))
        (retract ?k)
        (assert (Family based comedy used))
)

;;;; Friends hanging out
(defrule friends-comedy
		(Comedy used)
		(Television used)
?k <-   (Friends hanging out)
        (not (exists (Friends hanging out used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "70's stoners" "A men tells his children about his various youthful exploits" "An ex-cult member goes to New York and tries to make it"))
        (retract ?k)
        (assert (Friends hanging out used))
)


;;; Animated
(defrule animated-comedy
		(Comedy used)
		(Television used)
?k <-   (Animated)
        (not (exists (Animated used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Adult" "Children"))
        (retract ?k)
        (assert (Animated used))
)

;;;; Adult
(defrule adult-tele
		(Comedy used)
		(Television used)
?k <-   (Adult)
        (not (exists (Adult used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Old school Halo machinima" "Parody of the super-spy genre" "Very unlucky family tries to keep their burger joint in shape"))
        (retract ?k)
        (assert (Adult used))
)

;;;; Child
(defrule child-tele
		(Comedy used)
		(Television used)
?k <-   (Children)
        (not (exists (Children used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Chaotic toons do shenanigans" "Cleverly written show featuring two young geniuses building contraptions"))
        (retract ?k)
        (assert (Children used))
)


;; Action branch
(defrule action-tele
		(Television used)
?k <-   (Action)
        (not (exists (Action used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Anime" "Live Action"))
        (retract ?k)
        (assert (Action used))
)

;;; Comics branch

(defrule live-comics
		(Action used)
		(Television used)
?k <-   (Live Action)
        (not (exists (Live Action used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "Do you like comics?" "Marvel" "Sci-fi and Fantasy" "DC"))
        (retract ?k)
        (assert (Live Action used))
)

;;;; DC
(defrule dc
		(Action used)
		(Television used)
?k <-   (DC)
        (not (exists (DC used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "If Batman fought with bows" "Guy goes fast"))
        (retract ?k)
        (assert (DC used))
)

;;;; Marvel
(defrule marvel
		(Action used)
		(Television used)
?k <-   (Marvel)
        (not (exists (Marvel used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "Super strong detective with traumatic past" "Blind lawyer fights crime with his super senses" "Ex-con cleans up Harlem from local ganglords"))
        (retract ?k)
        (assert (Marvel used))
)

;;;; Sci fi and fantasy
(defrule scifi-fantasy
		(Action used)
		(Television used)
?k <-   (Sci-fi and Fantasy)
        (not (exists (Sci-fi and Fantasy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Sci-Fi" "Fantasy"))
        (retract ?k)
        (assert (Sci-fi and Fantasy used))
)

;;;;; Sci fi
(defrule sci-fi
		(Action used)
		(Television used)
?k <-   (Sci-Fi)
        (not (exists (Sci-Fi used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "Superhero-esque mutants fight crime" "Nuclear apocalypse" "People fight crime with help of pervasive surveillance"))
        (retract ?k)
        (assert (Sci-Fi used))
)

;;;;;; Nuclear

(defrule nuclear
		(Action used)
		(Television used)
?k <-   (Nuclear apocalypse)
        (not (exists (Nuclear apocalypse used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What type of nuclear apocalypse you prefer?" "Surviving generations after apocalypse" "Surviving immediately after apocalypse"))
        (retract ?k)
        (assert (Nuclear apocalypse used))
)

;;;;; Fantasy
(defrule fantasy
		(Action used)
		(Television used)
?k <-   (Fantasy)
        (not (exists (Fantasy used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "Two brothers hunt monsters and demons" "A retelling of Arthurian legend" "Musical fairy tale satire"))
        (retract ?k)
        (assert (Fantasy used))
)


;;; Anime branch
(defrule anime-branch
		(Action used)
		(Television used)
?k <-   (Anime)
        (not (exists (Anime used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "A high-schooler finds a book that kills anyone whose name is in it" "American anime about girls going to school to fight monsters" "Japanese schoolgirl gets sent to Japan with a demon" "The son of Satan decides to fight demons as an exorcist" "A country kid moves to Tokyo and becomes involved with the local street politics"))
        (retract ?k)
        (assert (Anime used))
)

;; Drama branch
(defrule drama
		(Television used)
?k <-   (Drama)
        (not (exists (Drama used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you want?" "Crime" "Mindfuckery" "None of the above"))
        (retract ?k)
        (assert (Drama used))
)

;;; Crime branch
(defrule crime
		(Television used)
?k <-   (Crime)
        (not (exists (Crime used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What kind of crime would you like?" "Good Guys" "Bad Guys"))
        (retract ?k)
        (assert (Crime used))
)

;;;; Good guys branch
(defrule good-guys
		(Crime used)
		(Television used)
?k <-   (Good Guys)
        (not (exists (Good Guys used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds the most interesting to you?" "Modern British Sherlock Holmes" "FBI detectives tracking serial killers"))
        (retract ?k)
        (assert (Good Guys used))
)

;;;; Bad guys branch
(defrule bad-guys
		(Crime used)
		(Television used)
?k <-   (Bad Guys)
        (not (exists (Bad Guys used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What kind of bad guys do you like?" "Cartel" "Biker Gang" "Meth Cooks"))
        (retract ?k)
        (assert (Bad Guys used))
)

;;; Mindfuckery
(defrule mindfuckery
		(Crime used)
		(Television used)
?k <-   (Mindfuckery)
        (not (exists (Mindfuckery used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What kind of mindfuckery?" "Classic sci-fi serial featuring short, ponderous stories" "Modern Twilight Zone with an emphasis on technology" "Surreal 90's mystery produced by David Lynch"))
        (retract ?k)
        (assert (Mindfuckery used))
)

;;; None of the above
(defrule none-of-the-above
		(Crime used)
		(Television used)
?k <-   (None of the above)
        (not (exists (None of the above used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What sounds more interesting?" "Kids lose their friend to an unearthly creature and track him down" "Backstabbing senator claws his way through politics"))
        (retract ?k)
        (assert (None of the above used))
)
