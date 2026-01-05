# Day 6 — System Services & Scheduling (Linux)

## Objective
- Manage Linux services
- Inspect system logs
- Schedule recurring tasks

---

## Commands & Tools
- systemctl — manage system services
- journalctl — view service logs
- crontab — schedule time-based jobs
- systemd timers — reliable OS-level scheduling

---

## Key Concepts
- SSH is a systemd-managed service
- Logs are essential for debugging services
- Cron is simple but limited
- systemd timers are reboot-safe and logged

---

## Cron vs systemd Timers

| Cron | systemd Timers |
|----|----|
| Time-based | Event & time based |
| Minimal logs | journalctl logging |
| Basic | Production-grade |

---

## Status
✔ Completed
