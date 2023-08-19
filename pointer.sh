#!/bin/bash

echo "
░█▀█░█▀█░▀█▀░█▀█░▀█▀░█▀▀░█▀▄
░█▀▀░█░█░░█░░█░█░░█░░█▀▀░█▀▄
░▀░░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀
  " | lolcat
echo

if [ -z "$1" ]; then
  echo "Error: You need to enter your endpoint."
  echo "Usage: 'pointer <endpoint with http/https>'"
  exit 1
fi

# Prompt the user to enter a URL
url=$1
echo "Fuzzing on $url"
echo

# Extract the domain from the URL
domain=$(echo "$url" | awk -F[/:] '{print $4}')

# Urls
echo "$url" > urls
echo "01- wayback" | lolcat
waybackurls $domain -no-subs | deduplicate | grep "^$url" | anew -q urls
echo "02- katana" | lolcat
katana -u $url -silent -jc -kf robotstxt,sitemapxml -d 4 -c 20 | deduplicate | grep "^$url" | anew -q urls
echo "03- gospider" | lolcat
gospider --sitemap -s $url -t 30 | grep -Eo 'https?://[^ ]+' | sed 's/]$//' | grep -E $domain | deduplicate | grep "^$url" | anew -q urls
echo "04- hakrawler" | lolcat
echo $url | hakrawler -d 4 -t 10 -u | deduplicate | grep "^$url" | anew -q urls
echo "05- linkfinder" | lolcat
python3 PointerTools/LinkFinder/linkfinder.py -i $url -d -o cli 2>/dev/null | grep -Eo 'https?://[^ ]+' | sed 's/]$//' | grep "^$url" | anew -q urls
echo "06- paramspider" | lolcat
python3 PointerTools/ParamSpider/paramspider.py --domain $domain --level high --subs False --exclude jpg,jpeg,gif,css,tif,tiff,png,ttf,woff,woff2,ico,mp4,flv,ogv,webm,webp,mov,mp3,m4a,image,pdf 2> /dev/null | grep -Eo 'https?://[^ ]+' | sed 's/]$//' | deduplicate | grep "^$url" | anew -q urls; rm -r output/  > /dev/null 2>&1
echo "07- ffuf" | lolcat
#for X in RobotsDisallowed-Top1000.txt top-1000-websites.txt dirsearch.txt; do ffuf -u "${url}FUZZ" -w PointerTools/${X} -t 200 -v -or -mc 200 2>/dev/null | grep -o 'http[s]*://[^/][^\\]*' | deduplicate | grep "^$url" | nilo | anew -q urls ; done
echo "08- arjun" | lolcat
#arjun -u $url --disable-redirects --stable >arjun
#sed -n 's/.*Heuristic scanner found [0-9]\+ parameters: \(.*\)/\1/p' arjun | tr ', ' '\n' | awk -v url="$url" '/./ {print url "/?" $0 "="}' | anew -q urls; rm -r arjun

echo "done"
# Result
cat urls | deduplicate -sort | grep "^$url" > output.txt; rm -r urls
cat output.txt
