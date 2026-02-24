# 🌐 NETWORKING — QUICK RECALL (FOUNDATIONS)

---

# How Networking Actually Works

## Core Concepts
- Network → devices communicating
- Client → initiates
- Server → responds
- IP → machine identity
- Port → service door
- Protocol → rules
- TCP → reliable
- UDP → fast

## Common Ports
- 80 → HTTP
- 443 → HTTPS
- 22 → SSH
- 53 → DNS

## Traffic Flow
Client → DNS → IP → TCP → TLS → HTTP → Response

Rule:
Debug in traffic order.

---

# OSI & TCP/IP

## OSI Focus (L3–L7)
- L7 → Application (HTTP, DNS)
- L6 → TLS
- L5 → Session
- L4 → TCP / UDP
- L3 → IP / Routing

Rule:
Start at L3 → then L4 → then L7

## TCP/IP Model
- Application
- Transport
- Internet
- Network Access

## Failure Mapping
- No route → L3
- Connection refused → L4
- SSL error → L6
- 5xx error → L7

---

# IP Addressing & Subnetting

## Private IP Ranges
- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

Private ≠ Internet routable

## CIDR Quick Math
- /16 → ~65k IPs
- /24 → 256 IPs
- /28 → 16 IPs

Rule:
Smaller number = Bigger network

## Subnet Logic
- VPC CIDR → large block
- Subnet → division
- No overlap allowed
- Plan Multi-AZ
- IP exhaustion stops scaling

## Public vs Private
Public:
0.0.0.0/0 → IGW

Private:
No IGW
Uses NAT outbound

---

# DNS

## Core
- DNS → Name → IP
- Happens before TCP
- Uses port 53 (UDP/TCP)

## Records
- A → IPv4
- AAAA → IPv6
- CNAME → alias to domain

Rule:
A = IP
CNAME = Domain

## Resolution Flow
Client → Resolver → Authoritative → IP

## TTL
- Low TTL → fast change
- High TTL → cache delay
- High TTL during migration → partial outage

## Debug Order
1. dig domain
2. Check IP
3. Check TTL
4. Follow CNAME
5. curl -v

## Failure Patterns
- NXDOMAIN → missing record
- Wrong IP → bad A record
- IP works, domain fails → DNS / TLS
- Some users fail → TTL cache
- Temporary failure → port 53 blocked

---

# Golden Rules

- Debug in traffic order, not emotion
- DNS before firewall
- CIDR defines scale
- Overlap = redesign pain
- If IP works but domain fails → DNS / TLS
