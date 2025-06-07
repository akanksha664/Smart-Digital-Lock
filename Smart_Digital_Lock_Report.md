# Smart Digital Lock System - Report

## Objective
To design a secure digital lock system using VHDL with keypad input, code verification, wrong attempt alert, and master reset functionality.

## Design Description
The system uses a finite state machine (FSM) with the following states:
- **IDLE:** Waiting for input.
- **ENTER:** Accepting user input digit-by-digit.
- **CHECK:** Compares entered code with stored code.
- **UNLOCKED:** Unlocks if correct code entered.
- **ALERT:** Alerts after three wrong attempts.

A master reset button allows the system to return to the IDLE state from any state.

## VHDL Implementation
- `entered_code`: 16-bit register to store entered code (4 digits).
- `code`: 16-bit stored code (hardcoded as 1234).
- `wrong_attempts`: Counter to track wrong attempts.
- `unlock`: Output signal high when code is correct.
- `alert`: Output signal high after three wrong attempts.

## Conclusion
The digital lock system is implemented in VHDL using FSM principles. The design ensures secure and reliable operation suitable for FPGA implementation.
