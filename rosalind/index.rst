Rosalind
########

Rosalind is a shared storage system with 1PB capacity and is accessible both independently and through the Zurada aystem. In order to get access to the system you must create an `Access Ticket <https://ularc.github.io/zurada/accounts_and_support/index.html#request-an-account>`_. You could also select Rosalind at the same time you are requesting access to Zurada.
 

Policies
--------

#. By default, users will recieve a private directory with a quota of ``500g``

#. Upon recieving access to Rosalind, users have access via ``SFTP`` (over Port 22) from the University of Louisville Campus network or over the UofL Global Protect VPN. Users that have access to Zurada can also access their files on Rosalind over ``NFS`` on the Zurada Head node.

#. Shared directories for projects can be requested on Rosalind. Users can open a `ticket <https://ularc.github.io/zurada/accounts_and_support/index.html#request-support-tickets>`_ with Research Computing to get that set up with discussion on the Quota needed for the group.

#. The user ``/home/{USER}`` directory on the Rosalind Server should only be used for bash or SSH configurations and **should not** be used as a primary storage location. Use of the directory for storing data is not supported and any files saved there may not be safe from purging.

Directories
-----------

.. list-table:: Rosalind Paths
    :widths: 7 16 9 7
    :header-rows: 1

    * - Directory type
      - Path
      - Use
      - Quota
    * - Private
      - /mnt/rosalind/private/{USER}
      - Users Private Directory
      - 500g
    * - Shared (optional)
      - /mnt/rosalind/labgroups/{GROUP_NAME}
      - Shared between Users
      - TBD

.. note::

    Upon the Login of Rosalind the variable ``$ROSALIND`` is created that points users to their Private Directory

Use of Rosalind
---------------

There are a couple of way to connect and Utilize the Rosalind System

**SFTP - from Laptop/Desktop to Rosalind**

Command Line

    #. Open a terminal session

    #. Type the command

        .. code-block::

            sftp {USER}@rosalind.rc.louisville.edu
    
    #. Utilize your university password, and check your phone for a DUO push

    This will bring you to an SFTP session, upon login you are brought to your Rosalind Private Directory you can use the following commands to interact with the session

    .. list-table:: SFTP commands
        :header-rows: 1

        * - Command
          - Meaning
        * - ls
          - List files and directories
        * - cd
          - Change directory
        * - pwd
          - Display current directory
        * - get
          - Download a file from the Data Store
        * - put
          - Upload a file to the Data Store
        * - mkdir
          - Create a directory
        * - rmdir
          - Remove an empty directory
        * - rm
          - Delete a file
    


Client

    #. Open a SFTP client (CyberDuck, Filezilla, etc.)

    #. Enter the following information in the Client

        .. list-table:: SFTP Client Info
            :header-rows: 1

            * - Key
              - Value
            * - Host
              - rosalind.rc.louisville.edu
            * - Username
              - your ULINK ID (i.e. fmlast01)
            * - Password
              - Your University of Louisville Password
            * - Port
              - 22
        
        .. note::
            
            If your client needs a URL rather than ``host`` + ``port`` you can try ``sftp://rosalind.rc.louisville.edu`` instead

    #. Make sure you check your phone for a DUO push notification

**SSH**

    #. Open your SSH client of choice (or a Terminal session)

    #. Use the following information to connect

        .. list-table:: SSH Information
            :header-rows: 1

            * - Key
              - Value
            * - Host
              - rosalind.rc.louisville.edu
            * - Username
              - your ULINK ID (i.e. fmlast01)
            * - Password
              - Your University of Louisville Password
            * - Port
              - 22
    
    #. Make sure you check your phone for a DUO push notification

    .. note::

        Upon connecting to Rosalind you will start in your users Private directory for convienience

Use of Rosalind with Zurada
---------------------------

If you have access to **BOTH** Rosalind and Zurada, you will have access to both your private and any shared directories utilizing the same paths as mentioned above (see Directories Table).

When a user logs into either system the ``$ROSALIND`` variable is set to create a shortcut to their Private Rosalind directory. User's should stage data from Rosalind to the Zurada ``$WORK`` directory for computation and running jobs directly using the data on Rosalind is not supported. After their jobs are done, users are welcome to copy their data to their storage in Rosalind."