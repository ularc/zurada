Basic Slurm Terminology
=======================

Partition (a.k.a. Queue)
------------------------

A partition is a logical grouping of compute nodes, similar to a queue. Each partition may have different hardware, time limits, or access policies.
Use ``sinfo`` to list available partitions.

To check the current status of available queues and nodes, use the ``sinfo`` command.
This command provides a snapshot of which nodes are idle, allocated, or down, along with their associated partitions and time limits.

Example output:

.. code-block::

    PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
    cpu384g*     up 3-00:00:00     77   idle cpusm[01-77]
    cpu1500g     up 3-00:00:00      6   idle cpumd[01-06]
    cpu6000g     up 3-00:00:00      3   idle cpulg[01-03]
    gpu1h100     up 3-00:00:00     15  alloc gpusm[01-15]
    gpu2h100     up 3-00:00:00     10  alloc gpumd[01-10]
    hgxh200      up 3-00:00:00      1  alloc gpulg01

Node
----

A node is a physical machine in the cluster. Each node has a specific number of CPU cores, memory, and possibly GPUs.

To get detailed information about a specific node, use:

.. code-block::

    scontrol show node <nodename>

For example:

.. code-block::
     
    scontrol show node cpusm01

This will return detailed specs and current usage for the node:

.. code-block:: text

    NodeName=cpusm01 Arch=x86_64 CoresPerSocket=16 
       CPUAlloc=0 CPUEfctv=32 CPUTot=32 CPULoad=0.00
       AvailableFeatures=(null)
       ActiveFeatures=(null)
       Gres=(null)
       NodeAddr=cpusm01 NodeHostName=cpusm01 Version=24.11.5
       OS=Linux 5.14.0-427.42.1.el9_4.x86_64 #1 SMP PREEMPT_DYNAMIC Thu Oct 31 14:01:51 UTC 2024 
       RealMemory=386000 AllocMem=0 FreeMem=381353 Sockets=2 Boards=1
       State=IDLE ThreadsPerCore=1 TmpDisk=0 Weight=1 Owner=N/A MCS_label=N/A
       Partitions=cpu384g 
       BootTime=2025-10-24T14:55:46 SlurmdStartTime=2025-10-27T17:25:08
       LastBusyTime=2025-11-03T17:39:52 ResumeAfterTime=None
       CfgTRES=cpu=32,mem=386000M,billing=32
       AllocTRES=
       CurrentWatts=364 AveWatts=364x

Key fields to note:

- CPUTot: Total number of CPU cores available.
- RealMemory: Total memory available on the node.
- State: Current status (e.g., IDLE, ALLOC, DOWN).
- Partitions: Indicates which queue(s) the node belongs to.

Job
---

A job is a unit of work submitted to Slurm. It can be a single task or a collection of tasks (e.g., simulations, data processing).

Jobs are submitted using sbatch (batch jobs) or srun (interactive jobs).

A Job can have 5 states:

- PD (Pending): Waiting for resources.
- R (Running): Currently executing.
- CG (Completing): Finishing up.
- CD (Completed): Finished successfully.
- F (Failed): Encountered an error.

To view jobs currently in the queue or running, use: ``squeue``.

Example output:

.. code-block::

                    JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
                 3777   cpu384g matlab_p jd01  R    4:02:04      1 cpusm01
    3852_[226-241%20]  gpu1h100 Ecthelio jd02 PD       0:00      1 (QOSMaxNodePerUserLimit)
             3852_224  gpu1h100 Ecthelio jd02  R       2:00      1 gpusm03
             3852_225  gpu1h100 Ecthelio jd02  R       2:00      1 gpusm03
             3852_222  gpu1h100 Ecthelio jd02  R       2:01      1 gpusm02
             3852_223  gpu1h100 Ecthelio jd02  R       2:01      1 gpusm02
                 3343  gpu1h100 sno_pv80 jd03  R    4:02:05      1 gpusm01

Explanation of columns:

- JOBID: Unique identifier for each job.
- PARTITION: Queue the job was submitted to.
- NAME: Job name.
- USER: Submitting user.
- ST: Job status (R = Running, PD = Pending).
- TIME: Runtime so far.
- NODELIST(REASON): Node(s) assigned or reason for pending status.


Job Steps
----------

A job step is a unit of work executed within a running job. 
While a job defines the overall resource allocation (e.g., number of nodes, CPUs, memory, time),
job steps are the actual commands or tasks that run using those resources.

Key Characteristics of a Job Step:

- **Executed with srun:** Job steps are typically launched using the ``srun`` command inside a job script or interactively.
- **Shares job resources:** All job steps run within the resource allocation defined by the parent job (``sbatch``).
- **Can run in parallel:** Multiple job steps can be launched simultaneously, each using a subset of the allocated resources.
- **Useful for multi-task jobs:** Ideal when you want to run several independent tasks (e.g., simulations, analyses) within a single job submission.
