Jupyter (Open OnDemand)
=========================

Launching Jupyter Notebooks via Open OnDemand
---------------------------------------------

This guide provides step-by-step instructions for launching interactive **Jupyter Notebook / JupyterLab** sessions on the High-Performance Computing (HPC) cluster using the Open OnDemand web portal.

.. contents:: Table of Contents
   :depth: 2
   :local:

Prerequisites
-------------

* An active HPC Zurada cluster account.
* Access to the campus network or VPN.
* A supported web browser (Chrome, Firefox, or Edge).

Step 1: Access Open OnDemand
----------------------------

1. Open your browser and navigate to the Open OnDemand portal at `https://web.rc.louisville.edu <https://web.rc.louisville.edu>`_


.. figure:: images/OOD_mainpage.png
   :width: 50%
   :alt: Open OnDemand Login Screen
   :align: left

   Figure 1: Open OnDemand authentication screen.

.. raw:: html

   <div style="clear: both;"></div>

Step 2: Navigate to Jupyter Application
----------------------------------------

1. On the top navigation bar, click on **Interactive Apps**.
2. Select **Jupyter Notebook** (or **JupyterLab**) from the drop-down menu.

.. figure:: images/interactive_apps_menu.png
   :width: 50%
   :alt: Interactive Apps Dropdown Menu
   :align: left

   Figure 2: Selecting Jupyter Notebook from the Interactive Apps menu.

.. raw:: html

   <div style="clear: both;"></div>

Step 3: Configure Job Options
-----------------------------

Fill in the form parameters according to your resource requirements:

.. list-table:: Form Parameters
   :widths: 25 75
   :header-rows: 1

   * - Parameter
     - Description
   * - **Job Name**
     - A custom identifier for your session (e.g., ``jupyter_analysis``).
   * - **Project / Account**
     - Your Ulink id.
   * - **Partition**
     - Choose the compute partition.
   * - **Number of Hours**
     - Total runtime requested for the interactive session.
   * - **Number of Cores**
     - Number of CPU cores requested for computation.
   * - **Working Directory**
     - Starting directory for your Jupyter workspace. Defaults to ``/work/$USER``.

.. figure:: images/jupyter_form.png
   :width: 50%
   :alt: Jupyter Launch Form
   :align: left

   Figure 3: Interactive session submission form.

.. raw:: html

   <div style="clear: both;"></div>

Click the **Launch** button at the bottom of the page.

Step 4: Connect to the Running Session
--------------------------------------

1. After clicking **Launch**, you will be redirected to the **Interactive Sessions** card view.
2. The session card will initially display **Queued** or **Starting**.
3. Once resources are allocated, the status will change to **Running**.
4. Click the blue **Connect to Jupyter** button to open the notebook environment in a new tab.

.. figure:: images/connect_button.png
   :width: 50%
   :alt: Active Session Card with Connect Button
   :align: left

   Figure 4: Active session card displaying the "Connect to Jupyter" button.

.. raw:: html

   <div style="clear: both;"></div>

Step 5: Terminate the Session
-----------------------------

When you have finished your work, close your interactive session to release compute resources for other users:

1. Return to the Open OnDemand **Interactive Sessions** page.
2. Click the red **Delete** button on the session card.

.. figure:: images/connect_button.png
   :width: 50%
   :alt: Delete Session Confirmation
   :align: left

   Figure 5: Deleting an active interactive session.

.. raw:: html

   <div style="clear: both;"></div>

Troubleshooting
---------------

* **Session Fails to Submit:** Verify that your account has authorization for the selected partition (especially high-memory options like ``cpu1500g``).
* **Connection Timeout:** Ensure your browser is not blocking pop-up windows from the portal URL.