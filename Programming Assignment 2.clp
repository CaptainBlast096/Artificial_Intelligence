; Author: Jaleel Rogers | Class: CAP4630.02 | Proffesor: Dr. Feng-Jen Yang | Date: 04/12/24

(deffacts letters_and_digits
	(letter E)
	(letter O)
	(letter W)
	(letter H)
	(letter N)
	(digit 1)
	(digit 2)
	(digit 3)
	(digit 4)
	(digit 5)
	(digit 6))
	
(defrule all_replacements
	(letter ?letter)
	(digit ?digit)
	=>
	(assert (replace ?letter ?digit)))

(defrule forward_checking

	; Checks the 1's place
	(replace E ?e)
	(replace O ?o&~?e)
	(test (= (mod (+ ?e ?e) 10) ?o))									; Checks if doubling the value represented by the e and taking
															; the mod 10 results in the value represented by o ensures that 
															; the digit represented by o is the reaminder when the doubled value 
															; of e is divided by 10
	; Check the 10's place														
	(replace W ?w&~?e&~?o)
	(replace H ?h&~?e&~?o&~?w)
	(replace N ?n&~?e&~?o&~?w&~?h)
	(test (= (+ ?e ?e (* ?w 10) (* ?h 10)) (+ ?o (* ?n 10)))) 			; Checks if the sum of the value represented by e, doubled value of 
												; e, ten times the value of w, and ten times the value of h is 
												; equal to the sum of the value represented by o and time times 
												; the value of n 
	=>
	
	; Display solutions
	(printout t "E=" ?e ", O=" ?o ", W=" ?w ", H=" ?h ", N=" ?n crlf)
	(printout t "    WE               "  ?w ?e crlf)
	(printout t "  + HE             + "  ?h ?e crlf)
	(printout t "  -----   ===>     ------         " crlf)
	(printout t "    NO               "  ?n ?o crlf crlf))
