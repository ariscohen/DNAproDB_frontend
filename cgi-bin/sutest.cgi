#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Bash as CGI"
echo "</title></head><body>"

echo "<h1>General system information for host hpc-cmb.usc.edu</h1>"
echo ""

echo "<h1>Memory Info</h1>"
echo "<pre> $(ssh hpc-cmb.usc.edu free -m) </pre>"

echo "<h1>Disk Info:</h1>"
echo "<pre> $(ssh hpc-cmb.usc.edu df -h) </pre>"

echo "<h1>Logged in user</h1>"
echo "<pre> $(ssh hpc-cmb.usc.edu who) </pre>"

echo "<center>Information generated on $(date)</center>"
echo "</body></html>"
