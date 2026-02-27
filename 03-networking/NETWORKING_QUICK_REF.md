# 🌐 NETWORKING — QUICK RECALL (Day 1–5)

---

# — How Networking Works

- Network → devices communicating
- Client → initiates request
- Server → responds
- IP → machine identity
- Port → service door
- Protocol → communication rules
- TCP → reliable (connection-oriented)
- UDP → fast (connectionless)
- Private IP → internal only
- Public IP → internet reachable
- Port 80 → HTTP
- Port 443 → HTTPS
- Port 22 → SSH
- Port 53 → DNS

### Traffic Flow
Client → DNS → IP → TCP → TLS → HTTP → Response

### Failure Signals
- `Could not resolve host` → DNS issue
- `Connection refused` → no service
- `Connection timed out` → firewall / routing
- Slow response → latency

### Debug Order
DNS → IP → TCP → TLS → HTTP

---

# — OSI & TCP/IP

- L3 → IP / Routing
- L4 → TCP / UDP
- L5 → Session control
- L6 → TLS / Encryption
- L7 → Application (HTTP, DNS, SSH)
- TCP/IP → Application / Transport / Internet / Network Access

### Layer Mapping
- `No route to host` → L3
- Port blocked → L4
- `SSL handshake failed` → L6
- `5xx error` → L7
- `Connection refused` → L4

### Debug Order
L3 → L4 → L6 → L7

---

# — IP & Subnetting

- IPv4 → 32-bit address
- CIDR → network size indicator
- /16 → ~65k IPs
- /24 → 256 IPs
- /28 → 16 IPs
- Smaller number → bigger network
- VPC CIDR → base block
- Subnet → CIDR division
- Overlap → routing conflict
- IP exhaustion → scaling stops
- 0.0.0.0/0 → default internet route

### Private Ranges
- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

### Public vs Private
- Public subnet → route to IGW
- Private subnet → no IGW
- NAT → outbound only

### Failure Signals
- Overlapping CIDR → peering fails
- No IP left → instance launch fails
- Wrong subnet → unreachable host

### Debug Order
Check CIDR → Check Subnet → Check Route

---

# — DNS

- DNS → Name to IP
- Happens before TCP
- Port 53 → UDP / TCP
- A → IPv4
- AAAA → IPv6
- CNAME → alias
- TTL → cache duration
- Resolver → recursive lookup

### Resolution Flow
Client → Resolver → Root → Authoritative → IP

### Failure Signals
- `NXDOMAIN` → missing record
- Wrong IP → bad A record
- IP works, domain fails → DNS
- Some users fail → TTL cache
- `Temporary failure in name resolution` → DNS blocked
- SSL mismatch after DNS change → cached IP

### Debug Order
dig → Check IP → TTL → Follow CNAME → curl -v

---

# — Linux Networking (Server Debug)

- `ip a` → check IP & interface state
- `ip r` → check routing table
- `ping <gateway>` → test subnet reachability
- `ping 8.8.8.8` → test internet (L3)
- `ping domain.com` → test DNS + routing
- `ss -tuln` → check listening ports
- `curl localhost` → test local service
- `curl <private-ip>` → test service exposure
- `127.0.0.1` → loopback
- `0.0.0.0` → all interfaces
- default route → exit path

### Failure Signals
- `Network unreachable` → routing issue
- `Connection refused` → no service listening
- `Connection timed out` → firewall / block
- `Temporary failure in name resolution` → DNS issue

### Debug Order
IP → Route → Ping IP → Ping Domain → Port → Service
