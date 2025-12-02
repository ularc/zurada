Policies
########

.. _zurada_system_use_policies:

Zurada's System Use Policies
============================

User Account
-------------

#. Account sharing is prohibited. An account shared amongst multiple users can be a security risk and any such sharing can lead to the suspension of the account.
#. Shared systems like LARCC, BigData, and Zurada should be used mindfully. Negative actions of one user (e.g., excessive number of file transfers leading to network saturation) can negatively impact the other users on the systems.
#. Commercial activities that personally benefit a user and cryptocurrency related work (bitcoin mining) are prohibited on the systems maintained by the Research Computing group. Any activity of this nature when detected will lead to the suspension of the account.
#. Accounts that have not been used for accessing the systems for more than 6-months will be deactivated for security reasons.
#. Users should not create, transmit, or store illegal or inappropriate data on the systems maintained by the Research Computing group.

Running Jobs
------------

#. Compute servers (or nodes) are not shared among multiple users. When a user gets access to a compute node (through job submission), the node is not accessible to other users. This is implemented for security and performance reasons. If multiple users are sharing the same node, performance can be negatively impacted due to resource contention. However, users are encouraged to take advantage of tools such as “GNU Parallel” to concurrently run multiple independent tasks on the compute nodes allocated to them through a single SLURM  job.
#. Each user will be limited to a specific number of active jobs on a system at a given point in time to ensure fair-share of shared resources across all users on the system and to optimize the job queue wait times.
#. Each job will be limited to a maximum allowed run-time on a system. Users are encouraged to consider implementing checkpointing-restart capabilities in their home-grown applications. The Research Computing team will be happy to provide guidance on implementing checkpointing-restart mechanism in the users' code. Several third-party software, like the FLASH astrophysics code, already have in-built capabilities to checkpoint-restart. Such capabilities can be enabled by setting the required environment variables. The users are encouraged to review the documentation of their software to confirm whether or not the checkpoint-restart functionality is available in the software of their choice.
#. **Exceptions:** If you require access to nodes for a longer period of time or need access to more nodes than what are allowed by default, please submit a service request ticket with an exemption request. We will need a brief description of the activity for your request, along with the number of cores and nodes required, and the time duration for which you are requesting the exemption. Also, we request to explore the options for checkpointing the code before submitting the ticket for service request.

Data Storage (Disk Usage)
-------------------------

#. **Work Directory** (``/work/username``) on Zurada - this directory is where you should place all input/output files used with a job. This directory is NOT backed up and is not intended for long-term storage. All files in this directory that have not been accessed in the last 30 days will be likely candidates for deletion.
#. **Home Directory** (``/home/username``) - this directory is backed up but should only be used for installing and compiling code. Storage of datasets is permitted here, but there will be a hard quota limit of 25GB in place.

Large-Memory Node Utilization
-----------------------------

As we have a limited number of large-memory nodes, access to these nodes should be requested through a Service Request ticket. Users should include the description of their use cases in the ticket to get access to these nodes.

GPU Resources Utilization
-------------------------

#. Please use the GPU queues for running jobs that can take advantage of GPUs.

    #. Monitoring: The Research Computing group monitors system utilization and can identify underutilized resources attached to jobs.
    #. Termination: Jobs detected to be idle or not making use of the allocated GPUs will be terminated after a grace period of 1 hour.
    #. Notification: After termination, users will receive a warning email to either adjust their job to utilize the GPUs appropriately or utilize one of the CPU only queues.

Installing packages system-wide
-------------------------------

The Research Computing team reviews software installation requests on a case-by-case basis
to determine whether an application should be installed system-wide or is better suited for local installation
in a user's home directory. In the latter case, we are happy to provide guidance.

Please note that global installations can be time-consuming due to complex dependency chains.
If a package definition does not already exist, we must create one to automate the build process,
including definitions for all dependencies. Since these dependencies are often maintained by different teams,
compiling and integrating them can be challenging and time-intensive.

While environment modules make it easy to load software, they are not part of the package-building
or automation process.

Due to the high volume of requests, we prioritize faster solutions like Conda and
reserve global installations for cases where no suitable alternative exists.