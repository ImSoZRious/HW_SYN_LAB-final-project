#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2024.1.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Dec 01 15:01:04 +07 2024
# SW Build 5094488 on Fri Jun 14 08:57:50 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim system_time_impl -key {Post-Implementation:sim_1:Timing:system} -tclbatch system.tcl -log simulate.log"
xsim system_time_impl -key {Post-Implementation:sim_1:Timing:system} -tclbatch system.tcl -log simulate.log

