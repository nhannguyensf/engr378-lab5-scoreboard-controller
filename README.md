# Scoreboard Controller – ENGR 378 Lab 5

This project implements a 2-digit decimal scoreboard controller on an FPGA (DE0-CV board). It is designed to increment the score by 1 or 10 using pushbuttons and reset it only when the reset button is held down for 1 second. The system is built using Verilog HDL and includes button debouncing, single-pulse detection, and safe reset handling logic.

---

## 📁 Project Structure

| File                     | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `DebounceOnePulse.v`     | Debounces an active-low button and generates a one-clock-cycle pulse.       |
| `ResetHold.v`            | Detects if the reset button is held for 1 second (50M clock cycles).        |
| `ScoreCounter.v`         | Maintains the score in BCD, increments by 1 or 10, and restricts overflow.  |
| `SevenSegmentDecoder.v`  | Converts 4-bit BCD input into 7-segment display format (active-low).        |
| `ScoreboardController.v` | Top-level module that integrates all components and controls the scoreboard.|

---

## ⚙️ Functionality

- **INC1**: Increment the score by 1 (single press only).
- **INC10**: Increment the score by 10 (single press only).
- **RESET**: Clears score to `00` only when held down for ≥ 1 second.
- **Display**: Score shown on HEX0 (ones) and HEX1 (tens) using 7-segment displays.

---

## ⏲ Clock and Timing

- Clock Frequency: 50 MHz (from DE0-CV board)
- Reset threshold: 50,000,000 clock cycles (1 second)

---

## 📌 Design Highlights

- Modular Verilog structure for clarity and reusability
- FSM-style input processing with clean pulse logic
- Hardware-safe reset logic avoids accidental clears
- Score limited to the range `00–99` to prevent overflow

---

## 🛠 How to Run

1. Open the project in **Intel Quartus**.
2. Compile all Verilog files.
3. Assign pins
4. Program the DE0-CV board via USB Blaster.
5. Test using the physical pushbuttons.

---

## 📚 References

- ENGR 378 Lab Manual
- Lecture Notes
- Intel DE0-CV User Manual

---

## 👨‍💻 Author

**Nhan Nguyen**  
ENGR 378 – Digital Systems Design  
San Francisco State University

