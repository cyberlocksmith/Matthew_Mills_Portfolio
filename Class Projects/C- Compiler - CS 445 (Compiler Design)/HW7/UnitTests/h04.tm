* C- compiler version C-S20
* Built: Apr 19, 2020
* Author: Robert B. Heckendorn
* File compiled:  h04.c-
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
* EXPRESSION
* CALL output
 43:     ST  1,-3(1)	Store fp in ghost frame for output
* PARAM 1
 44:     LD  3,-2(1)	Load address of base of array x
 45:     ST  3,-5(1)	Save left side 
 46:    LDC  3,3(6)	Load integer constant 
 47:     LD  4,-5(1)	Load left into ac1 
 48:    SUB  3,4,3	compute location from index 
 49:     LD  3,0(3)	Load array element 
 50:     ST  3,-5(1)	Store parameter 
* END PARAM output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
* END CALL output
* EXPRESSION
* CALL outnl
 55:     ST  1,-3(1)	Store fp in ghost frame for outnl
* END PARAM outnl
 56:    LDA  1,-3(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
* END CALL outnl
* IF
 60:     LD  3,-2(1)	Load address of base of array x
 61:     ST  3,-3(1)	Save left side 
 62:    LDC  3,3(6)	Load integer constant 
 63:     LD  4,-3(1)	Load left into ac1 
 64:    SUB  3,4,3	compute location from index 
 65:     LD  3,0(3)	Load array element 
 66:     ST  3,-3(1)	Save left side 
 67:    LDC  3,0(6)	Load integer constant 
 68:     LD  4,-3(1)	Load left into ac1 
 69:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* Compound Body
* EXPRESSION
 71:    LDC  3,3(6)	Load integer constant 
 72:     ST  3,-3(1)	Save index 
 73:     LD  3,-2(1)	Load address of base of array x
 74:     ST  3,-4(1)	Save left side 
 75:    LDC  3,3(6)	Load integer constant 
 76:     LD  4,-4(1)	Load left into ac1 
 77:    SUB  3,4,3	compute location from index 
 78:     LD  3,0(3)	Load array element 
 79:     ST  3,-4(1)	Save left side 
 80:    LDC  3,1(6)	Load integer constant 
 81:     LD  4,-4(1)	Load left into ac1 
 82:    SUB  3,4,3	Op - 
 83:     LD  4,-3(1)	Restore index 
 84:     LD  5,-2(1)	Load address of base of array x
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
 87:     ST  1,-3(1)	Store fp in ghost frame for cat
* PARAM 1
 88:     LD  3,-2(1)	Load address of base of array x
 89:     ST  3,-5(1)	Store parameter 
* END PARAM cat
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL cat
 93:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
* END COMPOUND
 70:    JZR  3,23(7)	Jump around the THEN if false [backpatch] 
* END IF
* RETURN
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    LDA  7,0(3)	Return 
* END FUNCTION cat
* 
* ** ** ** ** ** ** ** ** ** ** ** **
* FUNCTION main
101:     ST  3,-1(1)	Store return address 
* COMPOUND
* Compound Body
* EXPRESSION
102:    LDC  3,3(6)	Load integer constant 
103:     ST  3,-2(1)	Save index 
104:    LDC  3,12(6)	Load integer constant 
105:     LD  4,-2(1)	Restore index 
106:    LDA  5,-1(0)	Load address of base of array x
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable x
* EXPRESSION
* CALL cat
109:     ST  1,-2(1)	Store fp in ghost frame for cat
* PARAM 1
110:    LDA  3,-1(0)	Load address of base of array x
111:     ST  3,-4(1)	Store parameter 
* END PARAM cat
112:    LDA  1,-2(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-73(7)	CALL cat
115:    LDA  3,0(2)	Save the result in ac 
* END CALL cat
* END COMPOUND
* Add standard closing in case there is no return statement
116:    LDC  2,0(6)	Set return value to 0 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,119(7)	Jump to init [backpatch] 
* INIT
120:     LD  0,0(0)	Set the global pointer 
121:    LDA  1,-19(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
123:    LDC  3,18(6)	load size of array x
124:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-26(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
