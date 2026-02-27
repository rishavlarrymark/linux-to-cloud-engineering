# 🌐 Linux Networking — Production Operational Scenario


## 🔹 ip a

- **Traffic Flow:** Kernel → Interface config  
- **Layer:** L3  
- **Controls:** IP addressing  
- **Failure Symptom:** No IP / Interface DOWN  
- **Immediate Check:** ip a  
- **Root Cause Pattern:** DHCP failure / Static IP misconfig  
- **Fix Action:** sudo dhclient OR ip link set <iface> up  
- ⚠️ **Blast Radius:** Host


## 🔹 ip r

- **Traffic Flow:** Host → Gateway → Destination  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** Network is unreachable  
- **Immediate Check:** ip r (check default route)  
- **Root Cause Pattern:** Missing gateway / Wrong route  
- **Fix Action:** Reconfigure route / Renew DHCP  
- ⚠️ **Blast Radius:** Host / Subnet


## 🔹 ping <gateway>

- **Traffic Flow:** Host → Subnet gateway  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** Cannot access external network  
- **Immediate Check:** ping <gateway>  
- **Root Cause Pattern:** Subnet misconfig / Gateway down  
- **Fix Action:** Verify subnet + gateway IP  
- ⚠️ **Blast Radius:** Subnet


## 🔹 ping 8.8.8.8

- **Traffic Flow:** Host → Gateway → Internet IP  
- **Layer:** L3  
- **Controls:** Routing / Filtering  
- **Failure Symptom:** Timeout / Packet loss  
- **Immediate Check:** ip r + firewall rules  
- **Root Cause Pattern:** Missing route / Firewall / NAT issue  
- **Fix Action:** Restore route / Check firewall / Verify NAT  
- ⚠️ **Blast Radius:** Host / Subnet / VPC


## 🔹 ping google.com

- **Traffic Flow:** Host → DNS → Resolved IP → Internet  
- **Layer:** L7 (Resolution) + L3  
- **Controls:** Resolution / Routing  
- **Failure Symptom:** Temporary failure in name resolution  
- **Immediate Check:** nslookup google.com  
- **Root Cause Pattern:** DNS down / Port 53 blocked  
- **Fix Action:** Verify resolv.conf / Restart resolver  
- ⚠️ **Blast Radius:** Host / VPC


## 🔹 curl localhost

- **Traffic Flow:** Host → 127.0.0.1:80  
- **Layer:** L4 / L7  
- **Controls:** Port / Service binding  
- **Failure Symptom:** Connection refused  
- **Immediate Check:** ss -tuln | grep 80  
- **Root Cause Pattern:** Service not running / Wrong bind  
- **Fix Action:** Start service / Fix bind address  
- ⚠️ **Blast Radius:** Host


## 🔹 ss -tuln

- **Traffic Flow:** Kernel socket table → Listening ports  
- **Layer:** L4  
- **Controls:** Port / Binding  
- **Failure Symptom:** Service unreachable  
- **Immediate Check:** Is service on 0.0.0.0:<port> or 127.0.0.1?  
- **Root Cause Pattern:** Loopback-only binding / Wrong port  
- **Fix Action:** Update service config  
- ⚠️ **Blast Radius:** Host


## 🔹 127.0.0.53:53 (systemd-resolved)

- **Traffic Flow:** Application → Local DNS stub → Upstream DNS  
- **Layer:** L7  
- **Controls:** Resolution  
- **Failure Symptom:** Intermittent DNS failures  
- **Immediate Check:** resolvectl status  
- **Root Cause Pattern:** Resolver misconfig / Upstream DNS unreachable  
- **Fix Action:** Restart resolver / Fix upstream DNS  
- ⚠️ **Blast Radius:** Host / VPC
