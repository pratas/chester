[![Build Status](https://travis-ci.org/cobilab/chester.svg?branch=master)](https://travis-ci.org/cobilab/chester)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e3316f82ec4c4f15b05a820ec11c141b)](https://www.codacy.com/app/pratas/chester?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=pratas/chester&amp;utm_campaign=Badge_Grade)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](LICENSE)
<p align="center"><img src="imgs/logo.png" 
alt="CHESTER" width="220" height="220" border="0" /></p>
CHESTER is a probabilistic tool to map and visualize evolutionary regions (relative singularity regions).
The references can be non-aligned, such as those outputed directly from NGS plataforms (FASTQ), while the target sequences should be aligned (FASTA). CHESTER has a probabilistic way to detect the relative absense of large k-mer sizes (up to 30), namely using bloom filters. The bloom filters are set automatically.

## INSTALLATION ##

Cmake is needed for installation (<a href="http://www.cmake.org/">CMAKE</a>). You can download it directly from http://www.cmake.org/cmake/resources/software.html or use an appropriate packet manager. In the following instructions we show the procedure to install, compile and run CHESTER:

### STEP 1

Download, install and resolve conflicts.

#### Linux 
<pre>
sudo apt-get install cmake
git clone https://github.com/pratas/chester.git
cd chester/src/
cmake .
make
</pre>

Alternatively, you can install (without cmake and git, but only for linux) using
<pre>
wget https://github.com/pratas/chester/archive/master.zip
unzip master.zip
cd chester-master/src/
mv Makefile.linux Makefile
make
</pre>

#### OS X
Install brew:
<pre>
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
</pre>
only if you do not have it. After type:
<pre>
brew install cmake
brew install wget
brew install gcc48
wget https://github.com/pratas/chester/archive/master.zip
unzip master.zip
cd chester-master/src/
cmake .
make
</pre>
With some versions you might need to create a link to cc or gcc (after the *brew install gcc48* command), namely
<pre>
sudo mv /usr/bin/gcc /usr/bin/gcc-old   # gcc backup
sudo mv /usr/bin/cc /usr/bin/cc-old     # cc backup
sudo ln -s /usr/bin/gcc-4.8 /usr/bin/gcc
sudo ln -s /usr/bin/gcc-4.8 /usr/bin/cc
</pre>
In some versions, the gcc48 is installed over /usr/local/bin, therefore you might need to substitute the last two commands by the following two:
<pre>
sudo ln -s /usr/local/bin/gcc-4.8 /usr/bin/gcc
sudo ln -s /usr/local/bin/gcc-4.8 /usr/bin/cc
</pre>

#### Windows

In windows use cygwin (https://www.cygwin.com/) and make sure that it is included in the installation: cmake, make, zcat, unzip, wget, tr, grep (and any dependencies). If you install the complete cygwin packet then all these will be installed. After, all steps will be the same as in Linux.

## EXECUTION

Run CHESTER-map:

<pre>
./CHESTER-map -v -k 30 -i -s 6099999999 File1.fastq:File2.fastq:File3.fasta FileA.fasta:FileB.fasta
</pre>

## PARAMETERS

To see the possible options type
<pre>
./CHESTER-map
</pre>
or
<pre>
./CHESTER-map -h
</pre>

These will print the following options:
<pre>
Usage: CHESTER-map &#60OPTIONS&#62... [FILE]:&#60...&#62 [FILE]:&#60...&#62
CHESTER-map: a tool to map relative singularity regions  
The (probabilistic) Bloom filter is automatically set.

  -v                       verbose mode,             
  -a                       about CHESTER,            
  -s &#60value&#62               bloom size,               
  -i                       use inversions,           
  -p                       show positions/words,
  -k &#60value&#62               k-mer size (up to 30),               
                                                     
  [rFile1]:&#60rFile2&#62:&#60...&#62  reference file(s),   
  [tFile1]:&#60tFile2&#62:&#60...&#62  target file(s).           

The reference files may be FASTA, FASTQ or DNA-SEQ,
while the target files may be FASTA or DNA-SEQ.
Report bugs to &#60{pratas,ap,pjf}@ua.pt&#62. 
</pre>

Most of the values are set automatically. 

For CHESTER-filter type:
<pre>
./CHESTER-filter
</pre>
while for CHESTER-visual type:
<pre>
./CHESTER-visual
</pre>

## EXAMPLE ##

The following illustrate a Human-Neanderthal example. For the purpose go to the base and run:
<pre>
cp ancient/runNeanderthalGRC37.sh .
. RunNeanderthalGRC73.sh &
</pre>

It will download all the sequences and run CHESTER-map.
This will output the plot.svg, with the human novel regions relatively to the Neanderthal, chromosome by chromosome. The next image illustrate such result:

<p align="center"><img src="imgs/example.png" 
alt="CHESTER" width="600" height="300" border="0" /></p>

## CITATION ##

On using this software/method please cite:

D. Pratas, M. Hosseini, R. M. Silva, A. J. Pinho, P. J. S. G. Ferreira. Visualization of Distinct DNA Regions of the Modern Human Relatively to a Neanderthal Genome. Iberian Conference on Pattern Recognition and Image Analysis. Springer, Cham, 2017.

D. Pratas, R. M. Silva, A. J. Pinho, P. J. S. G. Ferreira. Detection and visualisation of regions of human DNA not present in other primates. Proceedings of the 21st Portuguese Conference on Pattern Recognition, RecPad 2015, Faro, Portugal, October 2015.

## ISSUES ##

For any issue let us know at [issues link](https://github.com/pratas/chester/issues).

## LICENSE ##

GPL v3.<br>
For more information:
<pre>http://www.gnu.org/licenses/gpl-3.0.html</pre>

                                                    

