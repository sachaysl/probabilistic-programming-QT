(* you throw 8 darts uniformly randomly on a 2D map with 16 squares.
   what is the probability of getting 3 dots in a single square (any square?)
*)

(* specs:
   R^2 -> ((0,1), (0,1))
   generate 8 values in R^2

   To Run -> simulated_result 100000
*)

let simulated_result = (fun n -> float_of_int (result (repeat n)) /. float_of_int n);;
(* simulated_result 100000 *)

let rec generate n = match n with
  | 0 -> []
  | _ -> (Random.float 1.0, Random.float 1.0) :: generate (n-1)

let rec generate_zeros n = match n with
  | 0 -> []
  | _ -> 0 :: generate_zeros (n-1)
			     
let update lst pos = List.mapi (fun i x -> if i = pos then x + 1 else x) lst 

let rec repeat n =
  match n with
  | 0 -> []
  | _ -> check (generate 8) (generate_zeros 16) :: repeat (n-1)

let rec result l =
  match l with
  | [] -> 0
  | h :: t -> if three_or_more h then 1 + result t else 0 + result t

let rec three_or_more l =
  match l with
  | [] -> false
  | h :: t -> if h >= 3 then true else three_or_more t
  
let rec check lst freq = match lst with
  | [] -> freq
  | (r1, r2) :: t -> if (r1 < 0.25) then
		       if (r2 < 0.25) then
			 check t (update freq 0)
		       else if (r2 < 0.5 && r2 >= 0.25) then
			 check t (update freq 1)
		       else if (r2 < 0.75 && r2 >= 0.5) then
			 check t (update freq 2)
		       else
			 check t (update freq 3)
		     else if (r1 < 0.5 && r1 >= 0.25) then
		       if (r2 < 0.25) then
			 check t (update freq 4)
		       else if (r2 < 0.5 && r2 >= 0.25) then
			 check t (update freq 5)
		       else if (r2 < 0.75 && r2 >= 0.5) then
			 check t (update freq 6)
		       else
			 check t (update freq 7)
		     else if ( r1 < 0.75 && r1 >= 0.5) then
		       if (r2 < 0.25) then
			 check t (update freq 8)
		       else if (r2 < 0.5 && r2 >= 0.25) then
			 check t (update freq 9)
		       else if (r2 < 0.75 && r2 >= 0.5) then
			 check t (update freq 10)
		       else
			 check t (update freq 11)
		     else
		       if (r2 < 0.25) then
			 check t (update freq 12)
		       else if (r2 < 0.5 && r2 >= 0.25) then
			 check t (update freq 13)
		       else if (r2 < 0.75 && r2 >= 0.5) then
			 check t (update freq 14)
		       else
			 check t (update freq 15)
		       
			       
		       
		       
				 
			 
		
				     
		       

			     
		       
		       
						 
		       
		       


		       
		  
		  
