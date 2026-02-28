# 🌐 Ports, Services & Reachability — Production Operational Scenario

## 🔹 Service Listening (`ss -tuln`)

- **Traffic Flow:** Client → ServerIP:Port  
- **Layer:** L4  
- **Controls:** Port (process binding)  
- **Failure Symptom:** Connection refused  
- **Immediate Check:** ss -tuln | grep <port>  
- **Root Cause Pattern:** No process listening OR wrong binding IP  
- **Fix Action:** Start service / Correct binding address  
- ⚠️ **Blast Radius:** Host  


## 🔹 Service Binding (127.0.0.1 vs 0.0.0.0)

- **Traffic Flow:** RemoteHost → ServerIP:Port  
- **Layer:** L4  
- **Controls:** Port + Interface binding  
- **Failure Symptom:** Works on localhost but fails externally  
- **Immediate Check:** Verify bind address in ss output  
- **Root Cause Pattern:** Service bound to 127.0.0.1 instead of 0.0.0.0  
- **Fix Action:** Reconfigure service to bind correct interface  
- ⚠️ **Blast Radius:** Host  


## 🔹 Port Reachability (`nc`, `telnet`)

- **Traffic Flow:** Client → ServerIP:Port  
- **Layer:** L4  
- **Controls:** Port + Filtering  
- **Failure Symptom:** Connection timeout  
- **Immediate Check:** nc -vz <ip> <port>  
- **Root Cause Pattern:** Firewall / Security Group blocking traffic  
- **Fix Action:** Allow inbound port in firewall / SG  
- ⚠️ **Blast Radius:** Host / Subnet / VPC  


## 🔹 HTTP Validation (`curl`)

- **Traffic Flow:** Client → ServerIP:80/443  
- **Layer:** L7 (over L4 TCP)  
- **Controls:** Port + Application  
- **Failure Symptom:** 5xx error / No response  
- **Immediate Check:** curl -v http://<ip>:<port>  
- **Root Cause Pattern:** Application crash / misconfiguration  
- **Fix Action:** Restart service / Inspect logs  
- ⚠️ **Blast Radius:** Host / Service  


## 🔹 Connection Refused vs Timeout

- **Traffic Flow:** Client → ServerIP:Port  
- **Layer:** L4  
- **Controls:** Port + Filtering  
- **Failure Symptom:**  
  - Refused → Immediate failure  
  - Timeout → No response  
- **Immediate Check:** Observe exact error type  
- **Root Cause Pattern:**  
  - Refused → No listener  
  - Timeout → Firewall / Routing drop  
- **Fix Action:**  
  - Refused → Start service  
  - Timeout → Open firewall / Verify route  
- ⚠️ **Blast Radius:** Host / Subnet / VPC  


## 🔹 Firewall (iptables / ufw / Security Group)

- **Traffic Flow:** Client → ServerIP:Port  
- **Layer:** L3/L4  
- **Controls:** Filtering  
- **Failure Symptom:** Timeout (silent drop)  
- **Immediate Check:** iptables -L / ufw status / Check SG rules  
- **Root Cause Pattern:** Missing inbound rule OR restricted outbound  
- **Fix Action:** Allow required protocol + port  
- ⚠️ **Blast Radius:** Host / Subnet / VPC / AZ  


# 🧠 Core Production Rule

Listening + Allowed + Routed = Reachable  
Reachable IP ≠ Reachable Service
