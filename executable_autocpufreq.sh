#!/bin/bash
auto-cpufreq --install
auto-cpufreq --live --force powersave
auto-cpufreq --remove
systemctl unmask power-profiles-daemon
systemctl enable --now power-profiles-daemon 
