# 🌐 NETWORKING TOPIC — Production Operational Scenario

---

## 🔹 DNS Resolution

Traffic Flow: Client → DNS Server:53  

Layer: L7  

What It Controls: Resolution  

Failure Symptom: NXDOMAIN / Could not resolve host  

Immediate Check: Verify domain resolves (`nslookup` / `dig`)  

Root Cause Pattern: Wrong record / DNS not propagated / Resolver misconfigured  

Fix Action: Correct DNS record or update resolver  

⚠️ Blast Radius: VPC / Public Users  

---

## 🔹 IP Routing

Traffic Flow: Source Host → Destination IP:any  

Layer: L3  

What It Controls: Routing  

Failure Symptom: Network unreachable / No route to host  

Immediate Check: Inspect route table (`ip route` / VPC route table)  

Root Cause Pattern: Missing default route / Wrong gateway / No IGW/NAT  

Fix Action: Add or correct route entry  

⚠️ Blast Radius: Subnet  

---

## 🔹 TCP Handshake

Traffic Flow: Client → Server:Port  

Layer: L4  

What It Controls: Port / Delivery  

Failure Symptom: Connection refused / SYN timeout  

Immediate Check: Test port reachability (`nc -vz`)  

Root Cause Pattern: Port closed / Firewall block / Service not listening  

Fix Action: Open port or start service  

⚠️ Blast Radius: Host / Service  

---

## 🔹 TLS Handshake

Traffic Flow: Client → HTTPS Endpoint:443  

Layer: L6  

What It Controls: TLS  

Failure Symptom: Certificate expired / SSL handshake failed  

Immediate Check: Validate certificate expiry and trust chain  

Root Cause Pattern: Expired cert / Wrong cert attached / Domain mismatch  

Fix Action: Renew and attach valid certificate  

⚠️ Blast Radius: Public Users  

---

## 🔹 HTTP Application Response

Traffic Flow: Client → Application Server:80/443  

Layer: L7  

What It Controls: Application Logic  

Failure Symptom: 500 / 502 / 503 errors  

Immediate Check: Check application logs and upstream health  

Root Cause Pattern: Backend crash / Dependency failure / Misconfiguration  

Fix Action: Restart service or fix backend dependency  

⚠️ Blast Radius: Service / AZ  
