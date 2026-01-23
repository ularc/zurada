#!/bin/bash
#SBATCH --job-name=build_nwchem
#SBATCH --error=/work/%u/app_build/nwchem/build.err.%j
#SBATCH --output=/work/%u/app_build/nwchem/build.out.%j
#SBATCH --time=06:00:00
#SBATCH --mem=280G
#SBATCH --ntasks-per-node=32
#SBATCH --nodes=1
#SBATCH --partition=cpu384g

# Make sure environment is clean
module purge

# Load Modules
module load aocl/5.1.0-aocc-5.0.0
module load openmpi/5.0.5-aocc-5.0.0-gcc-12.4.0
module load cmake/4.2.1-gcc-12.4.0

# Export Build Variables
export CC=clang
export FC=flang
export INSTALL_PREFIX=/mnt/apps/manual/nwchem/7.3.1_aocc-5.0.0_aocl-5.1.0
export V=1
export NWCHEM_TOP=$WORK/app_build/nwchem/nwchem-7.3.1
export NWCHEM_TARGET=LINUX64
export ARMCI_NETWORK=MPI-PR
export USE_MPI=y
export USE_MPIF=y
export USE_SCALAPACK=y
export USE_OPENMP=y
export USE_HWOPT=n
export BLAS_SIZE=8
export BLASOPT="-L${AOCL_ROOT}/lib_ILP64 -lblis"
export LAPACK_SIZE=8
export LAPACK_LIB="-L${AOCL_ROOT}/lib_ILP64 -lflame"
export SCALAPACK_SIZE=8
export SCALAPACK="-L${AOCL_ROOT}/lib_ILP64 -lscalapack"
export SCALAPACK_LIB="-L${AOCL_ROOT}/lib_ILP64 -lscalapack"
export SCALAPACK_LIBS="-L${AOCL_ROOT}/lib_ILP64 -lscalapack"
export NWCHEM_MODULES="all"
export MAKE_LOG=$WORK/app_build/nwchem/build-nwchem.log

# Setup Log
touch $MAKE_LOG
rm -f $MAKE_LOG
touch $MAKE_LOG

# Move to Build Directory
cd $NWCHEM_TOP/src

# Build
make nwchem_config | tee $MAKE_LOG
make -j 6 | tee $MAKE_LOG
