#!/bin/bash

echo "Installing..."
mkdir PointerTools; cd PointerTools

sudo apt-get install lolcat -y > /dev/null 2>&1
go install -v github.com/tomnomnom/anew@latest > /dev/null 2>&1
go install -v github.com/nytr0gen/deduplicate@latest > /dev/null 2>&1
go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1
go install github.com/projectdiscovery/katana/cmd/katana@latest > /dev/null 2>&1
go install -v github.com/jaeles-project/gospider@latest > /dev/null 2>&1
go install github.com/hakluke/hakrawler@latest > /dev/null 2>&1
git clone https://github.com/GerbenJavado/LinkFinder.git; cd LinkFinder; pip3 install -r requirements.txt > /dev/null 2>&1; python setup.py install > /dev/null 2>&1; cd ..
git clone https://github.com/devanshbatham/ParamSpider; cd ParamSpider; pip3 install -r requirements.txt > /dev/null 2>&1; cd ..
pip3 install arjun
go install github.com/ffuf/ffuf/v2@latest > /dev/null 2>&1
go install github.com/ferreiraklet/nilo@latest > /dev/null 2>&1
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/dirsearch.txt > /dev/null 2>&1
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/RobotsDisallowed-Top100.txt > /dev/null 2>&1
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/RobotsTxtPaths-Trickest-Wordlists/top-1000-websites.txt > /dev/null 2>&1
