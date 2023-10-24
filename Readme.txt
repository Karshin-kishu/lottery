logic used:
wrote a recieve function so that the contract is able to recieve ether 
wrote in a requirement that the the ether sent should be atleast 1 ether 
and pushed the addresses into an array if they sent in the ether

generated a getbalance function which would return how much ether is present in the contract and this function can only be called by the owner 
this is needed for information purposes to know the total amount in the lottery pool.

to select a winner a random number is generated from which the winner will be selected using a keccak function 
and i have ranged it to 0 - 99 to increase efficiency 

and doing modulus of the random function with the number of participants will generate a number less than the number of participants which will help to select a winner amoung the number of participants 
and then the amount of the contract is sent to the the winners