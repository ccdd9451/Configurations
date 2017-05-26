if hash sbatch 2>/dev/null; then

ACCOUNTNAME=kh621

sline(){

echo '#!/bin/bash

####### Job submission for fen2
#SBATCH --partition=main           # Partition (job queue)
#SBATCH --job-name='$jnm'          # Assign an 8-character name to your job
#SBATCH --nodes=1                  # Number of nodes
#SBATCH --ntasks=8                # Number of tasks (usually = cores) on each node
#SBATCH --time=2-0            # Total run time limit (HH:MM:SS)
#SBATCH --output=out.%N_%j     # STDOUT output file
#SBATCH --error=out.%N_%j       # STDERR output file
#SBATCH --export=ALL               # Export you current env to the job env GMAILTY
#SBATCH --mail-type=END,FAIL      # notifications for job done & fail MAILTY
#SBATCH --mail-user={email}    # send-to address ECOUNT

' $@ | sbatch
}

export jnm=XXX
alias sqsum="squeue| tr -s ' ' |cut -f 3-6 -d ' ' |sort -k3 | uniq -c|tr -s ' ' '\t'|expand -t10"
alias sq='squeue -u '$ACCOUNTNAME

fi
