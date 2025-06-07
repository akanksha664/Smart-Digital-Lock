# Smart Digital Lock System using VHDL

## Overview
This project implements a secure digital lock system using VHDL. The system uses a keypad for input and features:
- 4-digit code entry
- Code verification
- Wrong attempt alert
- Master reset

The design is implemented using a finite state machine (FSM) in VHDL.

## Features
✅ 4-digit keypad input  
✅ FSM-based code verification  
✅ Unlocks on correct code entry  
✅ Alerts after three wrong attempts  
✅ Master reset functionality

## Directory Structure
- `src/smart_lock.vhd`: VHDL source code
- `docs/Smart_Digital_Lock_Report.md`: Project report

## Getting Started
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/Smart-Digital-Lock.git
    ```
2. Navigate to the project folder:
    ```bash
    cd Smart-Digital-Lock
    ```
3. Open `smart_lock.vhd` in your preferred VHDL editor (Vivado, ModelSim, Quartus, etc.)

## Simulation (Optional)
This design is simulation-optional; you can review the FSM and VHDL code for design understanding.

## License
This project is released under the MIT License.
