;CIS11
;The Assemblers (J Miguel Belarmino, Keisha Coleen Wagas, Joshua Barajas)
;Course Project-Option B
;Description: Test Score Calculator
;Inputs: 5 test scores
;Outputs: Minimum score, maximum score, average score, and letter grade
;Run: Assemble and run in LC-3 simulator
.ORIG x3000
Main
      LEA R0, WELCOME  ;PRINTS THE WELCOME MESSAGE
      PUTS
      ;PROGRAM WILL STARTS HERE
      ;STEP 1: INPUT 5 TEST SCORE

      ;STEP 2: FIND MIN SCORE

      ;STEP 3: FIND MAX SCORE 

      ;STEP 4: FIND AVG SCORE

      ;STEP 5: FIND LETTER GRADE 

      ;STEP 6: PRINT RESULT

      HALT

;DATA

WELCOME .STRINGZ "TEST SCORE CALCULATOR\n"
PROMPT  .STRINGZ "Enter score: "

SCORES  .BLKW 5
SUM     .FILL #0
MIN     .FILL #0
MAX     .FILL #0
AVG     .FILL #0
GRADE   .BLKW 1
.END
