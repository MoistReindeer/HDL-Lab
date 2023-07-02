#!/bin/bash
# Führt die Liste der Befehle in Yosys aus
yosys diagram.ys

# Generiert aus der Netzliste das Blockschaltbild
netlistsvg svg.json
