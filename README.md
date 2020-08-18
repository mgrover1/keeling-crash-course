# Keeling Crash Course
## *Tutorial on Getting Setup on Keeling (UIUC Atmos High Performance Computer)*


**Welcome to the Keeling tutorial!**

## Setup your Virtual Private Network (VPN) to Access the On-Campus Network
Follow the instructions outlined on the (UIUC Tech Services Page)[https://techservices.illinois.edu/services/virtual-private-networking-vpn/download-and-set-up-the-vpn-client]

Download the required software, follow the instructions for logging in, then continue on! You are doing great.

---

## Logging into Keeling
You should have received an email from the School of Earth Society and Environment (SESE)
IT department with login instructions - you should be able to use your netID and password
to login.

You should secure shell (ssh) onto Keeling through a terminal (ex. ssh netid@keeling.earth.illinois.edu)
after this command, you should be prompted to enter your password. Go ahead and do that, then
continue! If you using a Windows machine, you can use [Putty](https://www.putty.org/)

---

## Installing
For installation of python on keeling we suggest using miniconda (https://docs.conda.io/en/latest/miniconda.html). This is a light version of anaconda and is less likely to give you problems later on.

1) Log onto keeling as described above with your netID
2) Use wget to download the installer
<pre><code> wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh </code></pre>
3) change the permissions to the .sh file
<pre><code> chmod u+x Miniconda3-latest-Linux-x86_64.sh </code></pre>
4) run the .sh file
<pre><code> ./Miniconda3-latest-Linux-x86_64.sh </code></pre>

The installer should spit out terms and conditions. Hit enter until it asks for 'yes' or 'no'. Type yes. Things will install from here. At the end it will ask another question. You should type 'y' to this one as well.

5) Now after it is done, we have to refresh our bash session. Run the following
<pre><code> source .bashrc </code></pre>
6) Start a bash session:
<pre><code> bash </code></pre>
7) Now lets check to see if conda is there. Run the following:
<pre><code> conda update conda </pre></code>

If it complained that there is nothing named conda, something didnt work and we will have to debug. But if it is updating something type 'y' and update conda.
8) If the last command worked, you will want to install all the packages you want. To do that follow the example here:
<pre><code> conda install matplotlib </pre></code>

Here is a list of other packages you will likely need:
<pre><code>
conda install scipy
conda install netCDF4
conda install -c intel scikit-learn
conda install jupyter
conda install xarray
</pre></code>

Congrats! You know have python on keeling! In order to get it running each time you log in to keeling you will **need** to envoke bash. Do this by doing step 6 above.

---

## Running Jupyter Notebooks on Keeling
Familiar with Python? Do you often use Jupyter Notebooks within your workflow?
Be sure to checkout the following documentation on running a notebook remotely.


### Install Jupyter and Create Directory

1) Make sure that Jupyter notebook is installed in your conda environment by typing conda install jupyter notebook and following the installation instructions on screen.

2) To store the notebook files that contain each notebook, I create a notebooks subdirectory in my $HOME/python directory:
```
mkdir -p $HOME/python/notebooks
```

3) Come up with a port number between 7000-9000.  Keep this port number in mind as we’ll use it throughout the process to pass the web browser interface for Jupyter from the keeling compute node back to your local machine through the firewall using an ssh tunnel.
```
ssh netid@keeling.earth.illinois.edu
```

### Setup your Jupyter Notebook on Keeling

4) From a terminal window on MacOS, or a Windows PowerShell session on Windows 10, ssh to keeling

5) Start an interactive session on one of keeling’s compute nodes using the qlogin command
```
qlogin -p node -n 4 -mem 72G -time 24:00:00
```

This will request a compute session for 24 hours on 4 CPU cores and request 72 gigabytes of RAM.  If the resources are available, you will be logged into a session on one of keeling’s compute nodes, e.g., keeling-d04.

*Note the machine name (i.e., keeling-d02) that you are logged into, you’ll need it for a later step.*

6) Start Jupyter notebook using the following command:
```
jupyter notebook --port=XXXX --no-browser --ip=127.0.0.1
```

Replace XXXX with the port number you came up with above.  If there is an error regarding the port (i.e., it says that it is already used), then try a different one.  If successful, the command will display a link that you will need to connect to the Jupyter notebook in the next step

*You will need the url it returns at the bottom of the terminal*

### Connect to your notebook using your local machine

7) Using terminal or PowerShell, open a second ssh session to keeling, except now we will open an ssh tunnel to the compute node using the port that we used in the previous step.
```
ssh -L XXXX:127.0.0.1:XXXX netID@keeling.earth.illinois.edu ssh -L XXXX:127.0.0.1:XXXX -N netID@remotemachine
```

You’ll have to replace
  * The port number from above in 4 places
  * Your netID in two places
  * The name of the remote machine (last argument)

Note that you may have to enter your password if you don’t have the ssh key for keeling stored on your local machine.  Warnings for RSA host keys are ok.

This will set up an ssh tunnel from port xxxx (which is accessible from your web browser) to the Jupyter notebook server on keeling.  You will need to kill this ssh session (with Control-C) when you are finished, as you can’t connect again to this port without killing it explicitly.

8) Now, point a web browser to the URL that you obtained in Step 1.  You should see a Jupyter notebook that displays locally, but executes code on keeling, and has access to keeling file systems.  Note that it will not have access to your local file systems (e.g., on your Mac or PC).

### General Advice

- Consider replacing the ```jupyter notebook``` command to ```jupyter lab``` if you would like to try out a different notebook/file editing experience

- Closing your web browser does not close your ssh tunnel or end your python session on keeling.  Remember to close each of these when you are done with them to save resources on keeling.

- If you put your computer to sleep or you lose your network connection, you may need to repeat Steps 1-3 above.  Note that there is an autosave feature in Jupyter that should save most of your work.

- If you need more resilience in your connection, investigate how to use mosh from your local computer, or using the screen command on keeling before launching your qlogin command.


[Link to Tutorial which this walkthrough was derived from (Courtesy of Steve Nesbitt)](https://snesbitt.web.illinois.edu/wp/resources/using-jupyter-notebook-on-keeling/)

If you are interested in using Dask on Keeling, be sure to checkout the following [notebook](https://github.com/swnesbitt/dask-keeling/blob/master/using%20dask-distributed%20on%20keeling.ipynb)

---

## Installing and Compiling WRF on Keeling
If you are working with Weather Research and Forecasting (WRF) model simulations, You can check the lectures by Prof. Steve Nesbitt on mesoscale modeling [here](https://publish.illinois.edu/mesomodel/)

## Official Keeling Documentation
You should check out the [documentation provided by the UIUC Atmospheric Science staff](https://wiki.illinois.edu/wiki/pages/viewpage.action?spaceKey=manabecluster&title=keeling+Home) which includes the following:
- Explanation of file structure
- Tutorial on parallel computing using Keeling
- Weather Research and Forecasting (WRF) model installation turorial

---
