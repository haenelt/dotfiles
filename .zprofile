eval "$(/opt/homebrew/bin/brew shellenv)"

# freesurfer
export FREESURFER_HOME=/Applications/freesurfer/7.4.1
source $FREESURFER_HOME/SetUpFreesurfer.sh &>/dev/null

# fsl
FSLDIR=/Users/dh014/source/fsl
PATH=${FSLDIR}/share/fsl/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh

# afni
export PATH=${PATH}:/opt/homebrew/opt/python/libexec/bin
export PATH=${PATH}:/Users/dh014/source/afni/abin

# set up tab completion for AFNI programs
if [ -f $HOME/.afni/help/all_progs.COMP.zsh ]
then
   autoload -U +X bashcompinit && bashcompinit
   autoload -U +X compinit && compinit -i \
     && source $HOME/.afni/help/all_progs.COMP.zsh
fi
# -------------------------------------------------------

export R_LIBS=/Users/dh014/source/afni/sw/R-4.3.1

# ants
export PATH=${PATH}:/Users/dh014/source/ants/ants-2.5.2/bin:$PATH

# vmtk
VMTKHOME=/Users/dh014/source/vmtk
VMTK_PYTHON_VERSION=python3.6
export PATH=$VMTKHOME/bin:$PATH
#export PYTHONPATH=$VMTKHOME/lib/${VMTK_PYTHON_VERSION}/site-packages:$PYTHONPATH
