## ps
---
- **Situation:** Need to inspect running processes  
- **Symptom:** Service slow / unknown process suspected  
- **Root cause:** Hidden or unexpected process consuming resources  
- **Fix:** `ps aux | grep <name>` or `ps -ef`  

## pgrep
---
- **Situation:** Need PID of a specific process  
- **Symptom:** Multiple processes; manual search messy  
- **Root cause:** Cannot identify exact PID  
- **Fix:** `pgrep <name>` or `pgrep -a <name>`  

## top
---
- **Situation:** Server high CPU or memory  
- **Symptom:** System slow / load average high  
- **Root cause:** Process consuming excessive CPU/MEM  
- **Fix:** Run `top` → identify PID → act  

## kill
---
- **Situation:** Process hung or misbehaving  
- **Symptom:** App not responding but still running  
- **Root cause:** Stuck execution / deadlock  
- **Fix:** `kill <PID>`  

## kill -9
---
- **Situation:** Normal kill not working  
- **Symptom:** Process ignores SIGTERM  
- **Root cause:** Process stuck in uninterruptible state  
- **Fix:** `kill -9 <PID>`  
- ⚠️ **Risk:** No cleanup; may corrupt open files  

## jobs
---
- **Situation:** Background task started with `&`  
- **Symptom:** Lost track of running job  
- **Root cause:** No PID noted  
- **Fix:** `jobs`  

## fg
---
- **Situation:** Background job needs foreground control  
- **Symptom:** Need to see live output  
- **Root cause:** Job running detached  
- **Fix:** `fg %<job_number>`  

## nice
---
- **Situation:** Non-critical process affecting CPU  
- **Symptom:** Important service starved  
- **Root cause:** Equal scheduling priority  
- **Fix:** `nice -n 10 <command>`  

## renice
---
- **Situation:** Running process needs priority change  
- **Symptom:** CPU imbalance during runtime  
- **Root cause:** Wrong initial priority  
- **Fix:** `renice 15 <PID>` or `sudo renice -5 <PID>`  
- ⚠️ **Risk:** Lower nice (higher priority) requires root  

## sleep
---
- **Situation:** Need test process for debugging  
- **Symptom:** No safe process to inspect  
- **Root cause:** No long-running dummy process  
- **Fix:** `sleep 1000 &`  

## Status
✔ Completed
