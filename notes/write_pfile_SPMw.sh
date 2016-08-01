#!/bin/bash -e
# author: Miriam Weaverdyck 8/1/16
# ------------------------------------------------------------------------------
# this script writes out the parameters to the p_study.m file 
# (a matlab file to be read by SPM12w)

source pars.sh
source globals.sh

SAVE_DIR=$PROJ_DIR/$SCRIPT_DIR_SPMw

if [ $SLICE_TIME == 'SPM' ]; then
	$SLICE_TIME=1
else
	$SLICE_TIME=0
fi

if [ $REALIGN == 'SPM' ]; then
	$REALIGN=1
else
	$REALIGN=0
fi

if [ $UNWARP == 'SPM' ]; then
	$UNWARP=1
else
	$UNWARP=0
fi

if [ $SMOOTH_SOFT == 'SPM' ]; then
	$SMOOTHING=$SMOOTH
else
	$SMOOTHING=0
fi

if [ $SNR == 'SPM' ]; then
	$SNR=1
else
	$SNR=0
fi

cat <<EOT > $SAVE_DIR/p_study.m
% spm12w r6225
% Parameters file for fMRI preprocessing
% Last updated: October, 2014
% =======1=========2=========3=========4=========5=========6=========7=========8

% User name
p.username = '$USERNAME'

% Paths and names
p.study_dir = '$PROJ_DIR';
p.prep_name = 'SPM_prep';

% Preprocessing Routines - 1=yes 0=no
          
p.slicetime     = $SLICE_TIME;        
p.realign       = $REALIGN;        
p.unwarp        = $UNWARP;      % Unwarping (correct field inhomogeneties)      
p.smoothing     = $SMOOTHING;   % Size of smoothing kernel in FWHM (0 for no smoothing)
p.snr           = $SNR;         % make SNR analysis document
p.slices        = $SLICES;        
p.cleanup       = 2;            % delete intermediate files 0 (keep all), 1 (keep last), 
                                % 2 (keep last 2), 3 (keep last 2 and originals)
p.cleanupzip    = 0;            % Zip up the final stages

% Not currently working
p.normalize     = 'none';       % Normalize type ('none','epi','spm12','dartel')

% Uncomment and set equal to 1 or 0 if changing from default
%p.tripvols     = ;         
%p.shuffle      = ;         
%p.despike      = ;
EOT