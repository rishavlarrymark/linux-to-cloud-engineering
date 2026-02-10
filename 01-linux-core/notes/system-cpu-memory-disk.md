# SYSTEM, CPU, MEMORY & DISK — Production Operational Scenarios

---

## uptime

- **Situation:** system feels slow
- **Symptom:** high load average
- **Root cause:** too many runnable or waiting processes
- **Fix:** identify CPU or IO bottleneck (top / vmstat)

---

## top

- **Situation:** CPU spike alert
- **Symptom:** one process using high %CPU
- **Root cause:** busy or stuck application
- **Fix:** optimize, restart, or terminate process
- ⚠️ **Risk:** killing wrong PID can bring service down

---

## mpstat -P ALL 2

- **Situation:** uneven CPU usage
- **Symptom:** one core at 100%, others idle
- **Root cause:** single-threaded application
- **Fix:** scale horizontally or optimize application

---

## free -h

- **Situation:** memory usage alert
- **Symptom:** high used memory
- **Root cause:** Linux cache usage (normal behavior)
- **Fix:** check **available** memory, not used

---

## vmstat 2

- **Situation:** high load with low CPU usage
- **Symptom:** high IO wait (wa)
- **Root cause:** slow disk or network storage
- **Fix:** investigate disk, storage backend, or network

---

## df -h

- **Situation:** application cannot write files
- **Symptom:** disk full
- **Root cause:** filesystem out of space
- **Fix:** clean files or extend disk

---

## df -i

- **Situation:** disk free but writes fail
- **Symptom:** inode exhaustion
- **Root cause:** too many small files
- **Fix:** delete files or clean directories

---

## du -sh *

- **Situation:** disk usage increasing
- **Symptom:** unknown space consumption
- **Root cause:** large directories
- **Fix:** clean largest directory

---

## du -sh /var/*

- **Situation:** root filesystem filling
- **Symptom:** rapid disk growth
- **Root cause:** logs, cache, runtime data
- **Fix:** rotate logs, clean /var

---

## ls -li

- **Situation:** file behavior confusion
- **Symptom:** multiple files share same inode
- **Root cause:** hard links
- **Fix:** remove correct linked file

---

## mount

- **Situation:** storage not accessible
- **Symptom:** path missing or empty
- **Root cause:** filesystem not mounted
- **Fix:** mount correct filesystem

---

## umount /mount/point

- **Situation:** disk maintenance
- **Symptom:** cannot detach filesystem
- **Root cause:** mount point busy
- **Fix:** stop processes, retry unmount
- ⚠️ **Risk:** unmounting active filesystem can cause data loss

---

## watch df -h

- **Situation:** disk space changing rapidly
- **Symptom:** fluctuating disk usage
- **Root cause:** active writes
- **Fix:** identify writing process

---

## watch free -h

- **Situation:** memory pressure
- **Symptom:** available memory dropping
- **Root cause:** memory leak or traffic spike
- **Fix:** restart application or scale memory

---

## watch vmstat

- **Situation:** unstable performance
- **Symptom:** fluctuating CPU / IO stats
- **Root cause:** variable load
- **Fix:** correlate with traffic and processes

---

## DAY 6 OPERATOR LOCK

- CPU issue → top, mpstat
- Memory issue → free, vmstat
- Disk issue → df, du, inode

**Never mix subsystems while debugging.**
