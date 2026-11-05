Datatransfer Guide
##################

.. _datatransfer:

Datatransfer Node Policies
==========================

The Datatransfer node's purpose is to provide a resource to upload and download large fileset's. The Research Computing team 
does monitor usage of access-level nodes like login, web, and data transfer nodes to ensure that the nodes are being properly utilized

Approved activities
-------------------

- **SFTP**
- **SCP**
- **RSYNC**

Datatransfer Node Information:
==============================

**Hostname:** dt.rc.louisville.edu
**Port:** 22

SSH Multiplexing
================

.. note::

    Important Note: at this time the Research Computing team have only been able to test with Linux OpenSSH clients. Native Windows SSH does not support 
    SSH multiplexing.

Whether you have a few large files or a lot of smaller files to transfer, performing individual authentications with multi-factor steps can
become almost impossible to transfer all of that data efficiently. This is where SSH multiplexing can help out imensly. SSH Multiplexing allows
users to authenticate with Multifactor once and utilize multiple streams of data to allow for larger file transfers.

Configure your environment
--------------------------

To setup your environment for multiplexing, you will need to setup your ``~/.ssh/config`` file to look like the following:

.. code-block::

    Host $SHORT_NAME
        HostName $HOSTNAME_OR_IP_ADDRESS
        User $USERNAME
        Port 22
        ControlMaster auto
        ControlPath ~/.ssh/cm-%r@%h:%p
        ControlPersist 10m

Here are some examples for the current Zurada resources

.. tabs::

    .. tab:: Login Node

        .. code-block::

            Host zurada
                HostName zurada.rc.louisville.edu
                User $USERNAME
                Port 22
                ControlMaster auto
                ControlPath ~/.ssh/cm-%r@%h:%p
                ControlPersist 10m

    .. tab:: Datatransfer Node

        .. code-block::

            Host dt
                HostName dt.rc.louisville.edu
                User $USERNAME
                Port 22
                ControlMaster auto
                ControlPath ~/.ssh/cm-%r@%h:%p
                ControlPersist 10m

Begin the Multiplexed session
-----------------------------

