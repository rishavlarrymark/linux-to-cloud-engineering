# 🐧 Linux Core — Operational Documentation

This directory contains **production-oriented Linux operational notes**.  
Content is organized **by topic**, not by learning day, to reflect **real-world usage**.

These documents are designed for:
- Fast revision before interviews
- On-call / production recall
- Long-term professional reference

---

## 📂 Documentation Index

###  Linux Foundation
📄 `linux-foundation.md`  
- Linux architecture (kernel vs userspace)
- Environment setup context (VM / WSL / Cloud VM)
- Core mental model before execution

---

###  Filesystem & Navigation
📄 `filesystem-navigation.md`  
- Directory traversal
- System paths (`/`, `/etc`, `/var`, `/home`, `/tmp`)
- Safe navigation practices

---

###  File Operations
📄 `file-operations.md`  
- Create, copy, move, delete
- File metadata and types
- Safe handling of files and directories

---

###  Viewing & Logs
📄 `viewing-logs.md`  
- Reading files safely
- Log inspection patterns
- Live monitoring techniques

---

###  Permissions & Ownership
📄 `permissions-ownership.md`  
- Access control model
- Ownership changes
- Permission troubleshooting

---

###  Users & Groups
📄 `users-groups.md`  
- User identity management
- Group-based access
- Least privilege alignment

---

###  Process Management
📄 `process-management.md`  
- Process inspection
- Runtime behavior
- Safe termination and priority control

---

###  Disk & Storage Management
📄 `disk-storage.md`  
- Disk usage analysis (`df`, `du`)
- Inode troubleshooting
- Mount points & persistent mounts
- Log growth and space recovery

---

###  Networking & Connectivity
📄 `networking-connectivity.md`  
- IP addressing & routes
- Port inspection (`ss`, `lsof`)
- Service reachability testing (`ping`, `curl`)
- Basic routing diagnostics

---

###  Packet & Network Debugging
📄 `packet-debugging.md`  
- Traffic capture (`tcpdump`)
- Request/response validation
- Silent failure investigation

---

###  Services & Systemd
📄 `services-systemd.md`  
- `systemctl` operations
- Service lifecycle management
- Failed service recovery

---

###  Logs & Journaling
📄 `logs-journaling.md`  
- `journalctl` usage
- Service-specific logs
- Production log filtering patterns

---

###  Text Processing & Automation
📄 `text-processing-automation.md`  
- `grep`, `awk`, `sed`
- Bulk operations with `xargs`
- Log filtering & structured extraction

---

###  System Identity & Limits
📄 `system-identity-limits.md`  
- `hostnamectl`
- `ulimit`
- `dmesg`
- Resource limit troubleshooting
- Real-world incident scenarios

---

## 🧠 How to Use These Docs

- **Interview prep:** skim headings + fix lines  
- **Production work:** search by symptom  
- **Learning:** read one file at a time, then practice  

No theory.  
No tutorials.  
Only **operational clarity**.

---

## 📌 Philosophy

> Learn Linux like an operator, not a student.

Commands are tools.  
Context is power.  
Mistakes in production are expensive.

---

✅ Maintained as part of: `linux-to-cloud-engineering`
``
