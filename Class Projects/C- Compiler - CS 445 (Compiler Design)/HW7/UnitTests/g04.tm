* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  g04.c-
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0(6)	Set return to 0 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust fp 
 12:    LDA  7,0(3)	Return 
* END FUNCTION output
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputb
 13:     ST  3,-1(1)	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1(1)	Load return address 
 16:     LD  1,0(1)	Adjust fp 
 17:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputb
 18:     ST  3,-1(1)	Store return address 
 19:     LD  3,-2(1)	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0(6)	Set return to 0 
 22:     LD  3,-1(1)	Load return address 
 23:     LD  1,0(1)	Adjust fp 
 24:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION inputc
 25:     ST  3,-1(1)	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1(1)	Load return address 
 28:     LD  1,0(1)	Adjust fp 
 29:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outputc
 30:     ST  3,-1(1)	Store return address 
 31:     LD  3,-2(1)	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0(6)	Set return to 0 
 34:     LD  3,-1(1)	Load return address 
 35:     LD  1,0(1)	Adjust fp 
 36:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION outnl
 37:     ST  3,-1(1)	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1(1)	Load return address 
 40:     LD  1,0(1)	Adjust fp 
 41:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* RETURN
 43:     LD  3,-2(1)	Load variable z
 44:     ST  3,-4(1)	Save left side 
 45:     LD  3,-3(1)	Load variable x
 46:     LD  4,-4(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:     ST  3,-4(1)	Save left side 
 49:     LD  3,-3(1)	Load variable x
 50:     LD  4,-4(1)	Load left into ac1 
 51:    SUB  3,4,3	Op - 
 52:    LDA  2,0(3)	Copy result to rt register 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 56:    LDC  2,0(6)	Set return value to 0 
 57:     LD  3,-1(1)	Load return address 
 58:     LD  1,0(1)	Adjust fp 
 59:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
 60:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
* CALL output
 61:     ST  1,-2(1)	Store fp in ghost frame for output
* PARAM 1
* CALL cat
 62:     ST  1,-4(1)	Store fp in ghost frame for cat
* PARAM 1
 63:    LDC  3,33(6)	Load integer constant 
 64:     ST  3,-6(1)	Store parameter 
* PARAM 2
 65:    LDC  3,911(6)	Load integer constant 
 66:     ST  3,-7(1)	Store parameter 
* END PARAM cat
 67:    LDA  1,-4(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-28(7)	CALL cat
 70:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
 71:     ST  3,-4(1)	Store parameter 
* END PARAM output
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,79(7)	Jump to init [backpatch] 
* INIT
 80:     LD  0,0(0)	Set the global pointer 
 81:    LDA  1,-1(0)	set first frame at end of globals 
 82:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-25(7)	Jump to main 
 85:   HALT  0,0,0	DONE! 
* END INIT
