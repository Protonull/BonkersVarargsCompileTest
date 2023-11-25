#!/bin/sh
find . -type f -name "*.class" -delete

java --version
echo ""

echo "Compiling Varargs"
time -f "Time: %E" javac ColourConstantsVarargs.java
echo ""

echo "Compiling Premade Varargs"
time -f "Time: %E" javac ColourConstantsPremadeVarargs.java
echo ""

echo "Compiling Copy Of"
time -f "Time: %E" javac ColourConstantsCopyOf.java
echo ""

echo "Compiling Typed Varargs"
time -f "Time: %E" javac ColourConstantsTypedVarargs.java
