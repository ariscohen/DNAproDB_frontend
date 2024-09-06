#!/bin/bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/srv/www/dnaprodb.usc.edu/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/srv/www/dnaprodb.usc.edu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/srv/www/dnaprodb.usc.edu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/srv/www/dnaprodb.usc.edu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/srv/www/dnaprodb.usc.edu/DeepPBS/dependencies/bin:$PATH"
export X3DNA='/srv/www/dnaprodb.usc.edu/DeepPBS/x3dna-v2.3-linux-64bit/x3dna-v2.3'

export PATH="/srv/www/dnaprodb.usc.edu/DNAProDB/share:$PATH"
export PATH="/srv/www/dnaprodb.usc.edu/DNAProDB/share/hbplus:$PATH"

conda activate dnaprodb

readonly UPLOADS_DIR="/srv/www/dnaprodb.usc.edu/DNAProDB_v3_frontend/htdocs/uploads"
readonly PIPELINE_DIR="/srv/www/dnaprodb.usc.edu/DNAProDB"

cd $UPLOADS_DIR
cp $UPLOADS_DIR/$1 $PIPELINE_DIR/$1

cd $PIPELINE_DIR
# Run the Python script with arguments passed to the shell script
python $PIPELINE_DIR/auto_processStructure.py "$1" "$2"
chmod 777 /srv/www/dnaprodb.usc.edu/DNAProDB_v3_frontend/htdocs/uploads/*.json
chmod 777 /srv/www/dnaprodb.usc.edu/DNAProDB_v3_frontend/htdocs/uploads/*.pdb
