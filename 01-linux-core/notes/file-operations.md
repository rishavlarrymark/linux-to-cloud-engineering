# 📁 FILE OPERATIONS — Production Operational Scenarios

## `touch`
- **Situation:** need file placeholder or update timestamp  
- **Symptom:** application expects file but it doesn’t exist  
- **Root cause:** missing empty file  
- **Fix:** create file using `touch`  

---

## `mkdir`
- **Situation:** new project or service directory required  
- **Symptom:** files dumped in wrong location  
- **Root cause:** directory not created beforehand  
- **Fix:** create directory before placing files  

---

## `mkdir -p`
- **Situation:** nested directories needed  
- **Symptom:** directory creation fails mid-path  
- **Root cause:** parent directories missing  
- **Fix:** create full directory tree in one command  

---

## `cp`
- **Situation:** backup or duplicate file needed  
- **Symptom:** original file modified or lost  
- **Root cause:** no backup before change  
- **Fix:** copy file before editing  
⚠️ **Risk:** overwriting destination without confirmation  

---

## `mv`
- **Situation:** rename or relocate files  
- **Symptom:** file “disappeared” from original location  
- **Root cause:** move used instead of copy  
- **Fix:** verify destination path after move  

---

## `rm`
- **Situation:** cleanup unwanted files  
- **Symptom:** important file permanently deleted  
- **Root cause:** wrong path or blind deletion  
- **Fix:** verify file before removal  
⚠️ **Risk:** deletion is irreversible  

---

## `rm -r`
- **Situation:** remove directory with contents  
- **Symptom:** entire directory tree lost  
- **Root cause:** recursive delete on wrong path  
- **Fix:** double-check directory before execution  
⚠️ **Risk:** high blast radius  

---

## `rmdir`
- **Situation:** remove empty directory  
- **Symptom:** command fails  
- **Root cause:** directory not empty  
- **Fix:** ensure directory is empty before removal  

---

## `stat`
- **Situation:** file behaving unexpectedly  
- **Symptom:** permission, time, or size confusion  
- **Root cause:** misunderstood file metadata  
- **Fix:** inspect file metadata  

---

## `file`
- **Situation:** unsure about actual file type  
- **Symptom:** file opens or executes incorrectly  
- **Root cause:** extension does not match content  
- **Fix:** identify real file type via content  

