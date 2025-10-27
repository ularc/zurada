.. _rstudio:

RStudio
#######

Pre-launch
==========

1. Login to the cluster and download a singularity/apptainer image from the rocker project 
   (https://hub.docker.com/r/rocker/rstudio/tags). Pick one with the desired version of R. For example:

   .. note::

      Apptainer v1.4.2 comes pre-installed in the system, so you don't need
      to use a modulefile for it.

   - Download image for R 4.5
   
   .. code-block:: text

    apptainer pull docker://rocker/rstudio:4.5
    [user@larcc-login1 ~]$ ls
    rstudio_4.5.sif

   - Download image for latest R

   .. code-block:: text

    [user@larcc-login1 ~]$ apptainer pull docker://rocker/rstudio:latest
    [user@larcc-login1 ~]$ ls
    rstudio_latest.sif

2. Create the following batch script, modifying the ``CHANGE ME!!!`` section and slurm parameter
   as appropriate

    .. literalinclude:: scripts/rstudio.sbatch
     :language: bash
     :linenos:

Launch RStudio Server
=====================

1. Assume the script from the pre-launch step is located at ``~/rstudio-server.sbatch``. 
   Then, submit it to slurm with ``sbatch ~/rstudio-server.sbatch``.

2. The script will print to the standard error file 
   (the one indicated in the ``#SBATCH --error`` option in the sbatch file)
   the instructions on how to connect to the RStudio web instance. Example output:

   .. code-block:: text
    
    1. SSH tunnel from your workstation using the following command:

       ssh -N -L 8787:cpusm01:48221 user@zurada.rc.louisville.edu

       and point your web browser to http://localhost:8787 

    2. log in to RStudio Server using the following credentials:

       user: user

       password: XnUPB9E0OVvjPfNH0nup


   .. note::
    
    ``48221`` is a randomly picked port (see line 51 of the script) and 
    the password ``XnUPB9E0OVvjPfNH0nup`` is randomly generated (see line 49 of the script).
    The ssh command in line 3 of the example output uses the login node
    as a proxy and reach the allocated compute node.
    