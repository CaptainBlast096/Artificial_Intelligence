; Author: Jaleel Rogers | Class: CAP4630.02 | Proffesor: Dr. Feng-Jen Yang | Date: 04/03/24

; Schema of program
(deftemplate path 							  						; deftemplate is the schema of a fact, equivalent to a class or struct in c++
	(multislot nodes)
	(slot cost)								  						; slot holds a single value multislot holds multiple values
)
	
; Initial paths and weights	
(deffacts direct-paths						  						; deffacts defines the initial facts like using an object in c++
	(path (nodes e a) (cost 1))
	(path (nodes a b) (cost 5))
	(path (nodes a c) (cost 1))
	(path (nodes c b) (cost 1))
	(path (nodes b d) (cost 1))
)

; Logic of creating paths and sum of paths	
(defrule indirect-paths						   						; defrule defines the rule a similar concept would be data type logic like booleans and if-statements	
	(path (nodes $?begin ?temp) (cost ?cost1)) 						; ? are variables
	(path (nodes ?temp $?end) (cost ?cost2))   						; $? are multifield wildcards, zero more more fields like a vector
	=>										   						; => is used to indicate if conditions are met perfor said action
	(bind ?total_cost (+ ?cost1 ?cost2))	   						; Bind assigns a value to a variable
	(assert (path (nodes $?begin ?temp $?end) (cost ?total_cost))) ; Assert adds new facts to the working memory
)

; Prints the paths and weights	
(defrule print-paths
	(path (nodes $?nodes) (cost ?cost))
	=>
	(printout t "The cost of path " $?nodes " is " ?cost crlf)
)
