(defrule init-system
?k <-   (start)
=>
        (assert (question "Do you want to start?" "yes" "no"))
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

(defrule movie-television-no
?k <-   (no)
        (not (exists (no used)))
?q <-   (question $?a)
=>
        (retract ?q)
        (assert (question "What do you prefer?" "Movie" "Television"))
        (retract ?k)
        (assert (no used))

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
		(Drama used)
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
		(Drama used)
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

;;;;;;movies
(defrule movie-type
?k <- (Movie)
	(not (exists (Movie used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of movie?" "Timeless Classics" "Action" "Comedy" "Drama" "Horror" "Crime" "Documentaries"))
	(retract ?k)
	(assert (Movie used))
)

(defrule timeless-classics
(Movie used)
?k <- (Timeless Classics)
	(not (exists (Timeless Classics used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "Which timeless classic genre?" "Scientists create a cannon to send them to the moon" "A lawyer defends an innocent black man in the 1930's south" "A German expressionist film where an upper class man leads the lower class in revolt"))
	(retract ?k)
	(assert (Timeless Classics used))
)

(defrule action-type
(Movie used)
(not (exists (Crime used)))
?k <- (Action)
	(not (exists (Action used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of action?" "Martial Arts" "Serious" "Goofy"))
	(retract ?k)
	(assert (Action used))
)

(defrule martial-arts-type
(Movie used)
?k <- (Martial Arts)
	(not (exists (Martial Arts used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of martial arts?" "Realistic" "Tarantino directed revenge movie" "Special effects out the wazoo"))
	(retract ?k)
	(assert (Martial Arts used))
)

(defrule serious-type
(Movie used)
?k <- (Serious)
	(not (exists (Serious used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of serious?" "Comic book based" "Sci-fi"))
	(retract ?k)
	(assert (Serious used))
)

(defrule comic-book-based-type
(Movie used)
?k <- (Comic book based)
	(not (exists (Comic book based used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of comic book?" "Film Noir" "Ron Perlman in a shit ton of makeup"))
	(retract ?k)
	(assert (Comic book based used))
)

(defrule sci-fi-type
(Movie used)
?k <- (Sci-fi)
	(not (exists (Sci-fi used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of sci-fi?" "Cyberpunk cop in a huge city" "Asteroid apocalypse"))
	(retract ?k)
	(assert (Sci-fi used))
)

(defrule goofy-type
(Movie used)
?k <- (Goofy)
	(not (exists (Goofy used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "How goofy?" "British" "Not British"))
	(retract ?k)
	(assert (Goofy used))
)

(defrule not-british-type
(Goofy used)
(Movie used)
?k <- (Not British)
	(not (exists (Not British used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What do you prefer?" "Homage to the 80's" "Actually from the 80's" "Tarantino directed movie about people killing Nazis"))
	(retract ?k)
	(assert (Not British used))
)

(defrule comedy-types
(Movie used)
?k <- (Comedy)
	(not (exists (Comedy used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of comedy?" "Coen Brothers" "Tarantino" "Animated" "Live Action"))
	(retract ?k)
	(assert (Comedy used))
)

(defrule coen-brothers-types
(Movie used)
(Comedy used)
?k <- (Coen Brothers)
	(not (exists (Coen Brothers used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What Coen brothers movie?" "Greatest thing to happen to this earth. Go buy it on Amazon" "The Odyssey set in the depression era south" " Minnesotan banker tries to ransom his own wife"))
	(retract ?k)
	(assert (Coen Brothers used))
)

(defrule tarantino-types
(Movie used)
?k <- (Tarantino)
	(not (exists (Tarantino used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of Tarantino?" "Non-linear story about gangsters"))
	(retract ?k)
	(assert (Tarantino used))
)

(defrule animated-types
(Movie used)
(Comedy used)
?k <- (Animated)
	(not (exists (Animated used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What animation type?" "Adorable and underrated" "Semi-funny trash"))
	(retract ?k)
	(assert (Animated used))
)

(defrule live-action-types
(Movie used)
(Comedy used)
?k <- (Live Action)
	(not (exists (Live Action used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of live action?" "Something fucked up" "Horror" "Political" "Weird" "Classics"))
	(retract ?k)
	(assert (Live Action used))
)

(defrule fucked-types
?k <- (Something fucked up)
	(not (exists (Something fucked up used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "How fucked up?" "A lot" "A little"))
	(retract ?k)
	(assert (Something fucked up used))
)

(defrule comedy-horror-types
(Movie used)
(Comedy used)
?k <- (Horror)
	(not (exists (Horror used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What scare do you prefer?" "Just kinda weird" "Shitty 80's horror at its peak" "Just plain stupid"))
	(retract ?k)
	(assert (Horror used))
)

(defrule weird-types
(Movie used)
?k <- (Weird)
	(not (exists (Weird used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "Just how weird?" "Man in a paper mache mask" "Hitler time travelling"))
	(retract ?k)
	(assert (Weird used))
)

(defrule classics-types
(Movie used)
(Comedy used)
?k <- (Classics)
	(not (exists (Classics used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What classic type?" "A good one" "A shitty one" "Cult classics"))
	(retract ?k)
	(assert (Classics used))
)

(defrule good-types
?k <- (A good one)
	(not (exists (A good one used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "which good classic genre do you prefer?" "Musical set in 50's suburbia"))
	(retract ?k)
	(assert (A good one used))
)

(defrule shitty-types
?k <- (A shitty one)
	(not (exists (A shitty one used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "How shitty?" "Sexy" "Not sexy"))
	(retract ?k)
	(assert (A shitty one used))
)

(defrule cult-types
(Movie used)
?k <- (Cult classics)
	(not (exists (Cult classics used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What is your favorite classic type?" "Teenager playing hooky in downtown Chicago" "Teenager takes clique drama to the next level" "70's stoners" "Hilarious low budget independent comedy" "Satire of fantasy tropes"))
	(retract ?k)
	(assert (Cult classics used))
)

(defrule teenager-clique-types
(Movie used)
(Classics used)
?k <- (Teenager takes clique drama to the next level)
	(not (exists (Teenager takes clique drama to the next level used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What do they do?" "Killing people next level" "Sending candygrams level"))
	(retract ?k)
	(assert (Teenager takes clique drama to the next level used))
)

(defrule drama-types
(Movie used)
?k <- (Drama)
	(not (exists (Drama used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "How dramatic?" "Neo-Noir" "Cute" "Political biopic"))
	(retract ?k)
	(assert (Drama used))
)

(defrule neo-noir-types
?k <- (Neo-Noir)
	(not (exists (Neo-Noir used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of neo-noir?" "Kevin Spacey relays his story of a robbery gone south" "Iran's first vampire/gangster/western/horror movie" "Christopher Nolan directed movie about stalkers"))
	(retract ?k)
	(assert (Neo-Noir used))
)

(defrule cute-types
(Drama used)
?k <- (Cute)
	(not (exists (Cute used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of cute?" "Teenager starts seeing his dead brother" "French movie about a girl's first lesbian relationship" "Wes Anderson movie about two kids running away from home"))
	(retract ?k)
	(assert (Cute used))
)

(defrule political-biopic-types
(Drama used)
?k <- (Political biopic)
	(not (exists (Political biopic used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "Whose biopic?" "WW2 General Patton. 'Rommel, you magnificent bastard! I read your book!'" "Jimmy Hoffa, union leader and mob boss who died under mysterious circumstances" "Cecil Gaines - fictionalised version of Eugene Allen -iran is a White House butler for 8 presidents"))
	(retract ?k)
	(assert (Political biopic used))
)

(defrule horror-types
(Movie used)
(not (exists (Live Action used)))
?k <- (Horror)
	(not (exists (Horror used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of scare do you prefer?" "Cult Horror" "Classic Horror" "Contemporary Horror"))
	(retract ?k)
	(assert (Horror used))
)

(defrule horror-cult-types
(Movie used)
(Horror used)
?k <- (Cult Horror)
	(not (exists (Cult Horror used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What cult horror?" "Extremly gory movie about sadists from another dimension" "A haunted house tortures its family"))
	(retract ?k)
	(assert (Cult Horror used))
)

(defrule horror-classic-types
(Movie used)
(Horror used)
?k <- (Classic Horror)
	(not (exists (Classic Horror used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What type of classic horror?" "Some scientists hunt for a shark" "A couple stumbles upon a strange town with no adults"))
	(retract ?k)
	(assert (Classic Horror used))
)

(defrule contemporary-horror-types
(Movie used)
(Horror used)
?k <- (Contemporary Horror)
	(not (exists (Contemporary Horror used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "How contemporary?" "A deaf-mute is trapped in her house by a masked killer" "A spooky children's character comes to life and terrorises a mother"))
	(retract ?k)
	(assert (Contemporary Horror used))
)

(defrule crime-types
(Movie used)
?k <- (Crime)
	(not (exists (Crime used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of crime?" "Action" "Mystery" "Something different"))
	(retract ?k)
	(assert (Crime used))
)

(defrule crime-action-types
(Movie used)
(Crime used)
?k <- (Action)
	(not (exists (Action used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of criminal action?" "A man locked in a mysterious room for many years is suddenly freed" "Coen Brothers' movie about a hitman who chases bystander after a drug deal gone bad" "John Woo directed movie where a hitman takes job to help woman he accidentally injured"))
	(retract ?k)
	(assert (Action used))
)

(defrule crime-mystery-types
(Movie used)
(Crime used)
?k <- (Mystery)
    (not (exists (Mystery used)))
?q <- (question $?a)
=>
    (retract ?q)
    (assert (question "What kind of mysterious crime?" "Father hunts his daughter's killer, while the daughter's ghost watches" "Journalist works with hacker to find a wealthy girl"))
    (retract ?k)
    (assert (Mystery used))
)

(defrule crime-something-types
(Movie used)
(Crime used)
?k <- (Something different)
	(not (exists (Something different used)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "Something different how?" "Man videotapes and sells footage of crime scenes" "Journalists investigate pedophilia in the catholic church"))
	(retract ?k)
	(assert (Something different used))
)

(defrule documentaries-types
(Movie used)
?k <- (Documentaries)
	(not (exists (Documentaries types)))
?q <- (question $?a)
=>
	(retract ?q)
	(assert (question "What kind of documentary do you like?" "An inside look into the amateur porn industry" "Noam Chomsky looks at wealth inequality in America" "A story of drug dealers in 1980's Florida" "A study of German Expressionist cinema and fascism"))
	(retract ?k)
	(assert (Documentaries used))
)
