Rosalind
########

Rosalind is a shared storage system with 1PB capacity and is accessible both independently and through the Zurada system. To get access to the system you must create an `Access Ticket <https://ularc.github.io/zurada/accounts_and_support/index.html#request-an-account>`_. You could also select Rosalind at the same time as you are requesting access to Zurada.
 
Policies
--------

By default, users will receive a private directory with a quota of ``500GB``.
 
Upon receiving access to Rosalind, users can transfer data via ``SFTP`` (over Port 22) from the University of Louisville Campus network or over the UofL Global Protect VPN. Users that have access to Zurada can also view their files on Rosalind through a mounted directory on login nodes. Before computing with the data stored on Rosalind, the users will need to explicitly transfer the data from Rosalind to the Zurada filesystem (/work directory).
 
Shared directories for projects can be requested on Rosalind. Users can open a `ticket <https://ularc.github.io/zurada/accounts_and_support/index.html#request-support-tickets>` with Research Computing to get that set up with discussion on the Quota needed for the group.
 
The user ``/home/${USER}`` directory on the Rosalind Server should only be used for bash or SSH configurations and **should not** be used as a primary storage location. Use of the directory is not supported and any files saved there may not be safe from purging.

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
      - /mnt/rosalind/private/${USER}
      - Users Private Directory
      - 500GB
    * - Shared (optional)
      - /mnt/rosalind/labgroups/${GROUP_NAME}
      - Shared between Users
      - TBD

.. note::
  
  After logging in to Rosalind, the variable ``$ROSALIND`` points the users to their private directory.

Use of Rosalind
---------------

There are a couple of ways to connect and utilize the Rosalind system. Please note, that you must be connected to either the University of Louisville campus network or the UofL Global Protect VPN.

**SFTP - from Laptop/Desktop to Rosalind**

  Client (preferred)

    #. Open your preferred SFTP client (e.g., CyberDuck and Filezilla)
    
    #. Enter the following information in the client
    
        .. list-table:: SFTP Client Info
            :header-rows: 1

            * - Key
              - Value
            * - Host
              - rosalind.rc.louisville.edu
            * - Username
              - your ULINK ID (i.e., fmlast01)
            * - Password
              - Your University of Louisville Password
            * - Port
              - 22
        
        .. note::

          If your client needs a URL rather than ``host`` + ``port`` then you can try ``sftp://rosalind.rc.louisville.edu`` instead
    
    #. Make sure you check your phone for a DUO push notification

  Command Line
    
    #. Open a terminal session
    
    #. Type the command:
    
        .. code-block::
    
            sftp ${USER}@rosalind.rc.louisville.edu
    
    #. Enter your UofL password, and check your phone for a DUO push.
    
    This will start an SFTP session, and after login you will be in a private directory on Rosalind. You can use the following commands to interact with the session:
    
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
    
**SSH**

    #. Open your SSH client of choice (or a terminal session)
    
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
      
      Upon connecting to Rosalind, by default, you will be in your private directory.

Use of Rosalind with Zurada
---------------------------

If you have access to **BOTH** Rosalind and Zurada, you will have access to both your private and any shared directories utilizing the same paths as mentioned above (see the Directories Table).

When a user logs into either system the ``$ROSALIND`` variable is set to create a shortcut to their private Rosalind directory. Users should stage data from Rosalind to the Zurada ``$WORK`` directory for computation and running jobs directly. Computing with the data directly from Rosalind is not supported. After their jobs are done, users are welcome to copy their output to their directory on the Rosalind. system"