#!/bin/bash

# (Advanced) The command `curl ipinfo.io` performs a HTTP request and fetches
# information about your public IP. Open
# [Wireshark](https://www.wireshark.org/) and try to sniff the request and
# reply packets that `curl` sent and received. (Hint: Use the `http` filter to
# just watch HTTP packets).

# --- SOLUTION AI GENERATED ---

# 1. **Open Wireshark**
#    - Launch Wireshark with administrator/sudo privileges (needed for packet capture)
#
# 2. **Select the correct network interface**
#    - Choose your active network interface (the one connected to the internet)
#    - Usually this is your Wi-Fi adapter or Ethernet connection
#    - The correct interface typically shows packet activity in the graph
#
# 3. **Set up a capture filter**
#    - In the filter bar at the top, enter: `http` (this will show only HTTP traffic)
#    - You might also want to narrow down further with: `http and host ipinfo.io`
#
# 4. **Start packet capture**
#    - Click the "Start Capturing Packets" button (shark fin icon)
#
# 5. **Run the curl command**
#    - Open a terminal
#    - Execute `curl ipinfo.io`
#
# 6. **Stop the capture**
#    - After the curl command completes, go back to Wireshark
#    - Click the "Stop Capturing Packets" button (red square icon)
#
# 7. **Analyze the captured packets**
#    - You should see packets between your machine and ipinfo.io's servers
#    - Look for packets containing HTTP GET request and HTTP 200 OK response
#    - You can click on individual packets to see details:
#      - The HTTP request headers
#      - The HTTP response headers
#      - The response content (JSON data from ipinfo.io)
#
# 8. **Examining details**
#    - In the middle pane, expand "Hypertext Transfer Protocol" to see HTTP details
#    - Look at request headers like User-Agent (which will show curl's signature)
#    - Examine response headers and the JSON payload
#
# Note: If you don't see any HTTP packets, ipinfo.io might be using HTTPS (encrypted HTTP). In that case, you would need to filter for `tls` or `ssl` instead and you'll only see the encrypted data, not the actual HTTP content.
#
# For HTTPS traffic, the packets will be encrypted and you won't be able to view the plain content unless you set up SSL key logging, which is more advanced and requires additional configuration.
