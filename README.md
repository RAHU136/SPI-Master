# SPI Master using Verilog HDL

## Overview

This project implements an SPI (Serial Peripheral Interface) Master using Verilog HDL.

The SPI Master transmits 8-bit serial data through the MOSI line while generating the SPI clock (SCLK) and controlling Slave Select (SS). The design uses a Finite State Machine (FSM) and shift register for serial communication.

## Features

- SPI Master Implementation
- FSM-Based Control Logic
- MOSI Data Transmission
- SCLK Generation
- Slave Select (SS) Control
- 8-bit Data Transfer
- Shift Register Operation
- Bit Counter
- Verilog Testbench
- GTKWave Verification
- Yosys Synthesis

## SPI Signals

- MOSI (Master Out Slave In)
- SCLK (Serial Clock)
- SS (Slave Select)

## FSM States

IDLE → LOAD → TRANSFER → DONE → IDLE

### State Description

- IDLE: Waits for start signal
- LOAD: Loads input data into shift register
- TRANSFER: Sends serial data bit by bit
- DONE: Completes transmission and returns to IDLE

## Files

- spi_master.v
- tb_spi_master.v
- spi_master.vcd
- spi_waveform.png
- spi_synthesis.png

## Simulation

Compile:

iverilog -o spi_master.vvp spi_master.v tb_spi_master.v

Run:

vvp spi_master.vvp

Open GTKWave:

gtkwave spi_master.vcd

## Verification

The design was verified using:

- Icarus Verilog
- GTKWave

Observed outputs:

- Correct MOSI transmission
- Proper SCLK generation
- SS asserted during transfer
- Correct bit counting
- Successful FSM transitions

## Synthesis

The design was synthesized using Yosys.

Observed synthesized components:

- Shift Register
- Bit Counter
- Comparators
- Adders
- Control Logic

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Yosys
- Ubuntu Linux

## Concepts Covered

- RTL Design
- Finite State Machines (FSM)
- Shift Registers
- Serial Communication
- SPI Protocol
- Testbench Development
- Waveform Analysis
- Logic Synthesis

## Author

Rahul Kumaran

B.E. Electronics and Communication Engineering

Aspiring RTL Design Engineer
