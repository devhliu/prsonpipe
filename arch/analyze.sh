#!/bin/bash
#
# analyze.sh runs the analysis of a subject
# original author: mason simon (mgsimon@princeton.edu)
# this script was provided by NeuroPipe. modify it to suit your needs
# edited MEW 8/1/16: added conditional statements based on args and added subject loop

set -e # stop immediately when an error occurs
source globals.sh   # load settings

if [[ $# -eq 0 ]]; then
	# no input means run all NEW subjects
	# make list of all subjects in raw/
	i=0
	for s in $(ls -d $RAW_DIR/*/ | xargs -n 1 basename); do
		subs_all[$i]=$s
		i=$i+1
	done
	# check list of subjects with those in prep
	i=0
	for s in "${subs_all[@]}"; do
		for d in $(ls -d $PREP_DIR/*/); do
			for p in $(ls -d */ | xargs -n 1 basename); do
				if [ $s == $p ]; then
					subs[$i]=$s
					i=$i+1
					continue
				fi
			done
		done
	done
	# subs now contains an array of new subjects that have not been preprocessed
	echo 'No subjects given.  Running preprocessesing on new subjects only:'
	echo "${subs[@]}"
elif [[ $1 == 'all' ]]; then
	# run all subjects, even those who have already been preprocessed
	i=0
	for s in $(ls -d $RAW_DIR/*/ | xargs -n 1 basename); do
		subs[$i]=$s
		i=$i+1
	done
	echo 'Running preprocessing on ALL subjects:'
	echo "${subs[@]}"
else
	# run only the subjects listed, even if they have already been preprocessed
	subs=$1
	echo 'Running preprocessing on these subjects only:'
	echo "${subs[@]}"
fi

# Run each subject, one at a time
for s in "${subs_all[@]}"; do
	SUBJ=$s
	#pushd $(dirname $0) > /dev/null   # move into the subject's directory, quietly

	# here, we call scripts to make a webpage describing this subject's analysis,
	# prepare the subject's data, and then run analyses on it. put in a call to each
	# of your high-level analysis scripts (behavioral.sh, fir.sh, ...) where
	# indicated, below
	echo "== beginning analysis of $SUBJ at $(date) =="
	bash prep.sh
	# run your high-level analysis scripts here
	bash scripts/time_fsl.sh
	bash scripts/mcflirt.sh
	echo "== finished analysis of $SUBJ at $(date) =="

	#popd > /dev/null   # return to the directory this script was run from, quietly
done