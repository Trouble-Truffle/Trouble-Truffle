#!/bin/bash
start=$(date +%s.%N)
echo -e "\n\n\n////////////////"
./$1
echo -e "\n///////////////\n\n\n"
end=$(date +%s.%N)
runtime=$( echo "$end - $start" | bc -l )
echo "Program runtime: $runtime"
