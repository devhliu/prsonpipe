#!/bin/bash
# author: mgsimon@princeton.edu
# ------------------------------------------------------------------------------
# this script sets up global variables for the analysis of the current subject
# edited 8/1/16 MEW added SCRIPT_DIR* vars for write_pfile scripts
# 26 July 2016, Judith Mildner (JNM) added vars for retrieve-data-labvol.sh script

set -e # stop immediately when an error occurs

source ../notes/study_info.sh

####retrieve script uses these#### edited to source from study_info
RUNORDER_FILE=$PROJECT_DIR/arch/subpars/runorders/$SUBJ*
###################################

SCRIPT_DIR=scripts
SCRIPT_DIR_FSL=$SCRIPT_DIR/FSL
SCRIPT_DIR_SPM8=$SCRIPT_DIR/SPM8
SCRIPT_DIR_SPM=$SCRIPT_DIR/SPM12
SCRIPT_DIR_SPMw=$SCRIPT_DIR/SPM12w


# add necessary directories to the system path
#export BXH_DIR=/jukebox/tamir/pkg/bxh_xcede_tools*/bin
#export MAGICK_HOME=/jukebox/ntb/packages/ImageMagick-6.5.9-9
#export BIAC_HOME=/jukebox/ntb/packages/BIAC_matlab/mr

#source subid_list.txt  # MUST INTERPRET
#SUBJ=$1


#PROJ_DIR=$PROJECT_DIR	# SET INDEPENDENT PROJECT DIRECTORY NAME #we don't need this? -JNM
#SUBJECT_DIR=$PROJ_DIR/subjects/$SUBJ


RAW_DIR=$PROJECT_DIR/raw 	
PREP_DIR=$PROJECT_DIR/prep
NIFTI_DIR=$SUBJ # s000 folder within raw, prep, or other directory, which stores niftis at that level for that subject
#NIFTI_DIR=data/nifti
#DATA_DIR=data

SCRIPT_DIR=$PROJECT_DIR/arch/scripts
SCRIPT_DIR=scripts
SCRIPT_DIR_FSL=$SCRIPT_DIR/FSL
SCRIPT_DIR_SPM8=$SCRIPT_DIR/SPM8
SCRIPT_DIR_SPM=$SCRIPT_DIR/SPM12
SCRIPT_DIR_SPMw=$SCRIPT_DIR/SPM12w
#FSF_DIR=fsf
DICOM_ARCHIVE=$PROJECT_DIR/arch/nifti/raw.tar.gz

QA_DIR=$PROJECT_DIR/qa

OUT_DIR=$PROJECT_DIR/output

#BEHAVIORAL_DATA_DIR=behav
#FIRSTLEVEL_DIR=analysis/firstlevel
#SECONDLEVEL_DIR=analysis/secondlevel
#EV_DIR=design
#BEHAVIORAL_OUTPUT_DIR=output/behavioral
#
## Fill in below variables to fit your roi analysis -- all are used in roi.sh or scripts called within it
#ROI_COORDS_FILE=design/roi.txt
#LOCALIZER_DIR=analysis/firstlevel/localizer_hrf.feat
#ROI_DIR=results/roi
#ROI_KERNEL_TYPE=sphere
#ROI_KERNEL_SIZE=4
