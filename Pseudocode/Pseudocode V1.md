# Test Score Calculator — Pseudocode
**CIS11 | Course Project Option B: Test Calculator**
**The Assemblers: J Miguel Belarmino, Joshua Barajas, Keisha Coleen (Cole) Wagas**

---

## Overview

This program prompts the user for 5 test scores, then calculates and displays
the minimum score, maximum score, average score, and letter grade equivalent.

**Grade Scale:** 0-50 = F, 60-69 = D, 70-79 = C, 80-89 = B, 90-100 = A

---

## MAIN

```
Program starts at x3000

Print welcome message ("TEST SCORE CALCULATOR")

Call INPUTS          ; Step 1 — implemented
Call FINDMIN         ; Step 2 — implemented
Call FINDMAX         ; Step 3 — not yet implemented
Call FINDAVG         ; Step 4 — not yet implemented
Call FINDGRADE       ; Step 5 — not yet implemented
Call PRINTRESULTS    ; Step 6 — not yet implemented

HALT
```

---

## STEP 1 — INPUTS
**Status: Implemented**
Prompts the user to enter 5 two-digit scores, stores them in the SCORES array,
and accumulates a running SUM.

```
INPUTS:
    Save registers R1 through R7

    R1 = pointer to start of SCORES array
    R2 = 5  (loop counter, one iteration per score)

    Loop while R2 > 0:

        Print "Enter score: "

        Read first digit character from keyboard
        Echo character to screen
        Subtract ASCII value of '0' (x0030) to convert character to number
        Store digit in R4

        Multiply R4 by 10 using repeated addition:
            R5 = R4 x 2
            R5 = R5 x 2  (now R4 x 4)
            R5 = R5 x 2  (now R4 x 8)
            R5 = R5 + R4 (now R4 x 9)
            R5 = R5 + R4 (now R4 x 10)

        Read second digit character from keyboard
        Echo character to screen
        Subtract ASCII value of '0' to convert character to number
        Store digit in R6

        Final score = R5 + R6
        Store final score into SCORES at current array position
        Advance array pointer by 1

        Add final score to SUM
        Print newline

        Decrement R2 by 1

    End Loop

    Restore registers R1 through R7
    Return to Main
```

---

## STEP 2 — FINDMIN
**Status: Implemented**
Scans all 5 scores to find the lowest value and saves it to MIN.

```
FINDMIN:
    Save registers R1 through R7

    R1 = pointer to start of SCORES array
    Load SCORES[0] into R3
    Save R3 into MIN  (assume first score is the minimum)

    Advance pointer to SCORES[1]
    R2 = 4  (check the remaining 4 scores)

    Loop while R2 > 0:

        Load SCORES[current] into R4
        Load current MIN into R3
        Compute R4 - R3 by negating R3 and adding to R4

        If result is negative (R4 < MIN):
            Save R4 into MIN  (new minimum found)

        Advance array pointer by 1
        Decrement R2 by 1

    End Loop

    Restore registers R1 through R7
    Return to Main
```

---

## STEP 3 — FINDMAX
**Status: Not yet implemented**
Same structure as FINDMIN, but tracks the largest score instead.

```
FINDMAX:
    Save registers R1 through R7

    R1 = pointer to start of SCORES array
    Load SCORES[0] into R3
    Save R3 into MAX  (assume first score is the maximum)

    Advance pointer to SCORES[1]
    R2 = 4  (check the remaining 4 scores)

    Loop while R2 > 0:

        Load SCORES[current] into R4
        Load current MAX into R3
        Compute R4 - R3 by negating R3 and adding to R4

        If result is positive (R4 > MAX):
            Save R4 into MAX  (new maximum found)

        Advance array pointer by 1
        Decrement R2 by 1

    End Loop

    Restore registers R1 through R7
    Return to Main
```

---

## STEP 4 — FINDAVG
**Status: Not yet implemented**
Divides the SUM by 5 using repeated subtraction to compute the average.

```
FINDAVG:
    Save registers R1 through R7

    Load SUM into R1
    R2 = 0   (this will count how many times we subtract 5, becoming the average)
    R3 = -5  (we subtract 5 each time to simulate division by 5)

    Loop:
        Add R3 to R1  (R1 = R1 - 5)
        If R1 < 0: exit loop  (we have gone past zero, stop)
        Increment R2 by 1

    End Loop

    Save R2 into AVG

    Restore registers R1 through R7
    Return to Main
```

---

## STEP 5 — FINDGRADE
**Status: Not yet implemented**
Compares AVG against grade thresholds using a branch chain and stores the
corresponding ASCII letter character into GRADE.

```
FINDGRADE:
    Save registers R1 through R7

    Load AVG into R1

    Compare R1 to 90:
        If AVG >= 90: GRADE = 'A'  (store ASCII x0041)
        Else compare R1 to 80:
            If AVG >= 80: GRADE = 'B'  (store ASCII x0042)
            Else compare R1 to 70:
                If AVG >= 70: GRADE = 'C'  (store ASCII x0043)
                Else compare R1 to 60:
                    If AVG >= 60: GRADE = 'D'  (store ASCII x0044)
                    Else: GRADE = 'F'  (store ASCII x0046)

    Restore registers R1 through R7
    Return to Main
```

---

## STEP 6 — PRINTRESULTS
**Status: Not yet implemented**
Prints the MIN, MAX, and AVG as readable two-digit numbers, then prints the
letter grade. Each numeric value must be converted back to ASCII digits before
printing (reverse of the ASCII subtraction done in INPUTS).

```
PRINTRESULTS:
    Save registers R1 through R7

    ; --- Print Minimum ---
    Print "Minimum: "
    Load MIN into R1
    Divide R1 by 10 using repeated subtraction to get tens digit
    Add x0030 to tens digit to convert back to ASCII, print it
    Get remainder (ones digit)
    Add x0030 to ones digit to convert back to ASCII, print it
    Print newline

    ; --- Print Maximum ---
    Print "Maximum: "
    Load MAX into R1
    Repeat same digit extraction and ASCII conversion as above
    Print newline

    ; --- Print Average ---
    Print "Average: "
    Load AVG into R1
    Repeat same digit extraction and ASCII conversion as above
    Print newline

    ; --- Print Grade ---
    Print "Grade: "
    Load GRADE into R0  (already stored as ASCII character)
    Print character
    Print newline

    Restore registers R1 through R7
    Return to Main
```

---

## DATA SECTION
**Status: Declared — some labels still needed**

```
WELCOME   .STRINGZ  "TEST SCORE CALCULATOR\n"
PROMPT    .STRINGZ  "Enter score: "
NEWLINE   .STRINGZ  "\n"

; TODO: Add the following label strings for PRINTRESULTS output
; LBLMIN  .STRINGZ  "Minimum: "
; LBLMAX  .STRINGZ  "Maximum: "
; LBLAVG  .STRINGZ  "Average: "
; LBLGRD  .STRINGZ  "Grade: "

ASCIIZERO .FILL x0030   ; ASCII value of '0', used for digit conversion
SCORES    .BLKW 5       ; Array holding the 5 input scores
SUM       .FILL #0      ; Running total of all 5 scores
MIN       .FILL #0      ; Lowest score
MAX       .FILL #0      ; Highest score
AVG       .FILL #0      ; Computed average score
GRADE     .FILL #0      ; Letter grade stored as ASCII character

SAVER1    .FILL #0      ; Save slot for R1
SAVER2    .FILL #0      ; Save slot for R2
SAVER3    .FILL #0      ; Save slot for R3
SAVER4    .FILL #0      ; Save slot for R4
SAVER5    .FILL #0      ; Save slot for R5
SAVER6    .FILL #0      ; Save slot for R6
SAVER7    .FILL #0      ; Save slot for R7 (return address)

.END
```
