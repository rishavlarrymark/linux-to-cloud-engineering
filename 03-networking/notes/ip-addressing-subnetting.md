# 🌐 IP Addressing & Subnetting — Production Operational Scenario

## 🔹 Private IP Allocation (VPC CIDR)

- **Traffic Flow:** EC2 → EC2:Any  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** Instances cannot communicate internally  
- **Immediate Check:** ip route / VPC CIDR range / subnet association  
- **Root Cause Pattern:** Wrong CIDR planning or subnet not attached to route table  
- **Fix Action:** Correct CIDR block and route table association  
- ⚠️ **Blast Radius:** Subnet / VPC  


## 🔹 CIDR Size Selection (/16 vs /24 vs /28)

- **Traffic Flow:** AutoScaling → Subnet:IP allocation  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** EC2 launch fails / insufficient IP addresses  
- **Immediate Check:** Available IP count in subnet  
- **Root Cause Pattern:** Subnet too small for workload growth  
- **Fix Action:** Create larger subnet and migrate resources  
- ⚠️ **Blast Radius:** Subnet  


## 🔹 Overlapping CIDR Between VPCs

- **Traffic Flow:** VPC-A → VPC-B:Any  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** VPC peering fails or routes not propagating  
- **Immediate Check:** Compare both VPC CIDR ranges  
- **Root Cause Pattern:** Identical or overlapping IP ranges  
- **Fix Action:** Redesign one VPC CIDR (migration required)  
- ⚠️ **Blast Radius:** VPC  


## 🔹 Subnet Division (/16 split into /24)

- **Traffic Flow:** EC2 (AZ1) → EC2 (AZ2):Any  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** Cross-AZ traffic unreachable  
- **Immediate Check:** Subnet CIDR boundaries + route table association  
- **Root Cause Pattern:** Incorrect subnet boundary or missing route association  
- **Fix Action:** Recreate subnet with correct CIDR alignment  
- ⚠️ **Blast Radius:** AZ / Subnet  


## 🔹 Public vs Private Subnet Planning

- **Traffic Flow:** Internet → EC2:80/443  
- **Layer:** L3 / L4  
- **Controls:** Routing / Port  
- **Failure Symptom:** Instance not reachable from internet  
- **Immediate Check:** Route table (0.0.0.0/0 → IGW?) + public IP assigned?  
- **Root Cause Pattern:** Workload placed in private subnet without NAT/IGW  
- **Fix Action:** Move to public subnet or attach proper gateway  
- ⚠️ **Blast Radius:** Subnet  


## 🔹 IP Exhaustion in Subnet

- **Traffic Flow:** EC2 Launch → Subnet:IP allocation  
- **Layer:** L3  
- **Controls:** Routing  
- **Failure Symptom:** Auto Scaling fails / network interface creation error  
- **Immediate Check:** Subnet available IP count  
- **Root Cause Pattern:** Too many ENIs consuming IP space  
- **Fix Action:** Expand subnet or add additional subnet  
- ⚠️ **Blast Radius:** Subnet / AZ  


## 🔹 Multi-AZ CIDR Misalignment

- **Traffic Flow:** ALB → Target Group:Ephemeral  
- **Layer:** L3 / L4  
- **Controls:** Routing  
- **Failure Symptom:** Works in one AZ, fails in another  
- **Immediate Check:** Subnet CIDR consistency across AZs  
- **Root Cause Pattern:** Secondary AZ subnet misconfigured  
- **Fix Action:** Align subnet CIDR and route table configuration  
- ⚠️ **Blast Radius:** AZ  
