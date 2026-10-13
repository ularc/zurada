MATLAB (Open OnDemand)
=======================

Overview
--------

Use MATLAB through the OOD Interactive Apps interface when licensed nodes are available. Interactive MATLAB sessions are useful for visualization and debugging.

Step 1: Navigate to MATLAB
--------------------------

1. On the top navigation bar, click on **Interactive Apps**.
2. Select **MATLAB** from the drop-down menu (if available).

.. figure:: images/interactive_apps_menu.png
	:width: 50%
	:alt: Interactive Apps Dropdown Menu
	:align: left

	Figure 1: Selecting MATLAB from the Interactive Apps menu.

.. raw:: html

	<div style="clear: both;"></div>

Step 2: Configure Job Options
-----------------------------

Fill in the form parameters according to your resource requirements:

.. list-table:: Form Parameters
	:widths: 25 75
	:header-rows: 1

	* - Parameter
	  - Description
	* - **Job Name**
	  - A custom identifier for your session (e.g., ``matlab_analysis``).
	* - **Project / Account**
	  - Your ulink id..
	* - **Partition**
	  - Choose the compute partition.
	* - **Number of Hours**
	  - Total runtime requested for the interactive session (1–24 hours).
	* - **Number of Cores**
	  - Number of CPU cores requested for computation.
	* - **Working Directory**
	  - Starting directory for your MATLAB workspace. Defaults to ``/work/$USER``.

.. figure:: images/matlab_launch.png
	:width: 50%
	:alt: MATLAB Launch Form
	:align: left

	Figure 2: Interactive session submission form.

.. raw:: html

	<div style="clear: both;"></div>

Step 3: Connect to the Running Session
--------------------------------------

1. After clicking **Launch**, you will be redirected to the **Interactive Sessions** card view.
2. The session card will initially display **Queued** or **Starting**.
3. Once resources are allocated, the status will change to **Running**.
4. Click the blue **Connect** button to open the MATLAB environment in a new tab.

.. figure:: images/matlab_connect_button.png
	:width: 50%
	:alt: MATLAB session card
	:align: left

	Figure 3: Example MATLAB session card in Interactive Sessions.

.. raw:: html

	<div style="clear: both;"></div>

Step 4: Terminate the Session
-----------------------------

When you have finished your work, close your interactive session to release compute resources for other users:

1. Return to the Open OnDemand **Interactive Sessions** page.
2. Click the red **Delete** button on the session card.

.. figure:: images/matlab_connect_button.png
	:width: 50%
	:alt: Delete Session Confirmation
	:align: left

	Figure 4: Deleting an active interactive session.

.. raw:: html

	<div style="clear: both;"></div>

