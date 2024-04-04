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

	(replace E ?e)
	(replace O ?o&~?e)
	(test (= (mod (+ ?e ?e) 10) ?o))
	
	(replace W ?w&~?e&~?o)
	(replace H ?h&~?e&~?o&~?w)
	(replace N ?n&~?e&~?o&~?w&~?h)
	(test (= (+ ?e ?e (* ?w 10) (* ?h 10)) (+ ?o (* ?n 10))))
	=>
	
	(printout t "E=" ?e ", O=" ?o ", W=" ?w ", H=" ?h ", N=" ?n crlf)
	(printout t "  WE       "  ?w ?e crlf)
	(printout t "+ HE      +"  ?h ?e crlf)
	(printout t "-----  ------   ===>      " crlf)
	(printout t "  NO     "  ?n ?o crlf crlf))
