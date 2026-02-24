# 🌐 DNS — Production On-Call Cheat Sheet

## 🔹 Domain Not Resolving

- **Traffic Flow:** Client → Resolver:53  
- **Layer:** L7  
- **Failure Symptom:** NXDOMAIN / SERVFAIL  
- **Immediate Check:** dig domain.com  
- **Root Cause Pattern:** Missing A/CNAME record  
- **Fix Action:** Create/Correct DNS record  
- ⚠️ **Blast Radius:** Global  


## 🔹 Wrong IP Returned

- **Traffic Flow:** Client → Wrong-IP:80/443  
- **Layer:** L7 / L3  
- **Failure Symptom:** Loads wrong server / timeout  
- **Immediate Check:** dig domain.com +short  
- **Root Cause Pattern:** Outdated A record  
- **Fix Action:** Update A record  
- ⚠️ **Blast Radius:** Global  


## 🔹 CNAME Broken

- **Traffic Flow:** Client → CNAME → Target → IP  
- **Layer:** L7  
- **Failure Symptom:** Resolves but backend unreachable  
- **Immediate Check:** dig domain.com (trace chain)  
- **Root Cause Pattern:** Target ALB/CDN deleted  
- **Fix Action:** Update CNAME target  
- ⚠️ **Blast Radius:** Global  


## 🔹 TTL Caching Issue

- **Traffic Flow:** Client → Cached-IP  
- **Layer:** L7  
- **Failure Symptom:** Works for some users only  
- **Immediate Check:** dig domain.com (check TTL)  
- **Root Cause Pattern:** High TTL during migration  
- **Fix Action:** Lower TTL before change; wait expiry  
- ⚠️ **Blast Radius:** Regional / Partial  


## 🔹 Works via IP, Fails via Domain

- **Traffic Flow:** Client → Domain → IP:443  
- **Layer:** L7 / L6  
- **Failure Symptom:** IP OK, domain fails  
- **Immediate Check:** dig + curl -v https://domain.com  
- **Root Cause Pattern:** DNS mispointing / SSL mismatch / vHost issue  
- **Fix Action:** Correct DNS or TLS config  
- ⚠️ **Blast Radius:** Domain  


## 🔹 DNS Blocked (Firewall)

- **Traffic Flow:** Client → Resolver:53  
- **Layer:** L4  
- **Failure Symptom:** Temporary failure in name resolution  
- **Immediate Check:** Check outbound UDP/TCP 53  
- **Root Cause Pattern:** Security Group / Firewall block  
- **Fix Action:** Allow 53 outbound  
- ⚠️ **Blast Radius:** Subnet / VPC  
