# Keeling Crash Course
## *Tutorial on Getting Setup on Keeling (UIUC Atmos High Performance Computer)*

**Welcome to the Keeling tutorial!**

## Logging into Keeling
You should have received an email from the School of Earth Society and Environment (SESE)
IT department with login instructions - you should be able to use your netID and password
to login.

You should secure shell (ssh) onto Keeling through a terminal (ex. ssh maxgrover@keeling.earth.illinois.edu)
after this command, you should be prompted to enter your password. Go ahead and do that, then
continue! If you using a Windows machine, you can use [Putty](https://www.putty.org/)

## Official Keeling Documentation
You should check out the [documentation provided by the UIUC Atmospheric Science staff](https://wiki.illinois.edu/wiki/pages/viewpage.action?spaceKey=manabecluster&title=keeling+Home) which includes the following:
- Explanation of file structure
- Tutorial on parallel computing using Keeling
- Weather Research and Forecasting (WRF) model installation turorial


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


## Running Jupyter Notebooks on Keeling
Familiar with Python? Do you often use Jupyter Notebooks within your workflow?
Be sure to checkout the following documentation on running a notebook remotely

[Link to Tutorial](https://snesbitt.web.illinois.edu/wp/resources/using-jupyter-notebook-on-keeling/)

If you are interested in using Dask on Keeling, be sure to checkout the following [notebook](https://github.com/swnesbitt/dask-keeling/blob/master/using%20dask-distributed%20on%20keeling.ipynb)

## Installing and Compiling WRF on Keeling 
If you are working with Weather Research and Forecasting (WRF) model simulations, You can check the lectures by Prof. Steve Nesbitt on mesoscale modeling [here](https://publish.illinois.edu/mesomodel/)
