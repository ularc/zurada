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
- **RCLONE**

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
        PubkeyAuthentication no
	    IdentitiesOnly yes
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
                PubkeyAuthentication no
	            IdentitiesOnly yes
                ControlMaster auto
                ControlPath ~/.ssh/cm-%r@%h:%p
                ControlPersist 10m

    .. tab:: Datatransfer Node

        .. code-block::

            Host dt
                HostName dt.rc.louisville.edu
                User $USERNAME
                Port 22
                PubkeyAuthentication no
	            IdentitiesOnly yes
                ControlMaster auto
                ControlPath ~/.ssh/cm-%r@%h:%p
                ControlPersist 10m

The Multiplexed session
-----------------------

In order to begin your multiplexed SSH session you must first authenticate

.. code-block::

    ssh $SHORT_NAME

You will then log in as you normally would with your password and multi-factor request. You can now disconnect from that session as long
as you are within the time period set with the ``ControlPersist`` option in our ``~/.ssh/config`` file you can begin your multiplexed
file transfer as long as whatever application uses the same OpenSSH client. The application to automatically do parallel transfers is the
``rclone`` utility.

.. note::

    Important Note: If any users are seen to be abusing this functionality, or performing insecure/harmful practices the account of those users
    will be disabled 

Rclone parallel transfer
------------------------

In order to use ``rclone`` to perform file transfers you must configure your destination in the ``~/.config/rclone/rclone.conf`` file
Here is an example:

.. code-block::

    [$RESOURCE_NAME]
    type = sftp
    ssh = ssh -q -T $SHORT_NAME
    shell_type = unix
    known_hosts_file = ~/.ssh/known_hosts
    md5sum_command = md5sum
    sha1sum_command = sha1sum

Here are some examples for the current Zurada resources:

.. tabs::

    .. tab:: Login Node
        
        .. code-block::
        
            [zurada_sftp]
            type = sftp
            ssh = ssh -q -T zurada
            shell_type = unix
            known_hosts_file = ~/.ssh/known_hosts
            md5sum_command = md5sum
            sha1sum_command = sha1sum

    
    .. tab:: Datatransfer Node
        
        .. code-block::
        
            [dt_sftp]
            type = sftp
            ssh = ssh -q -T dt
            shell_type = unix
            known_hosts_file = ~/.ssh/known_hosts
            md5sum_command = md5sum
            sha1sum_command = sha1sum

You can then do the following to begin your transfer

.. code-block::
    
    rclone copy $SOURCE $RESOURCE_NAME:$DESTINATION_PATH

.. note::

    Important Note: Login nodes and the datatransfer node are shared resources. Please be mindful of the resources you are utilizing to complete the
    transfer, use the `Rclone Documentation <https://rclone.org/docs/>`_ to learn more about the utility. 
