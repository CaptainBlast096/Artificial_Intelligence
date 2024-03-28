(deftemplate path
	(multislot nodes)
	(slot cost))
	
(deffacts direct-paths
	(path (nodes e a) (cost 1 ))
	(path (nodes a b) (cost 5 ))
	(path (nodes a c) (cost 1 ))
	(path (nodes c b) (cost 1 ))
	(path (nodes b d) (cost 1 )))
	
(defrule indirect-paths
	(path (nodes $?begin ?temp)) 
	(path (nodes ?temp $?end))
	=>
	(assert (path (nodes $?begin ?temp $?end)
	
	; ? are variables
	; $? are multifield wildcards, zero more more fields
	
(defrule print-paths
	(path (nodes $?nodes))
	=>
	(printout t "The cost of path ( " $?nodes ") is " ($?cost) crlf))