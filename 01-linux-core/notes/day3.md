# 📄 VIEWING & READING FILES — Production Operational Scenarios

## `cat`
- **Situation:** quick view of a small file  
- **Symptom:** terminal freezes or floods output  
- **Root cause:** file larger than expected  
- **Fix:** use `less` for unknown or large files  
⚠️ **Risk:** using on large logs can hang terminal  

---

## `less`
- **Situation:** safely reading config or large files  
- **Symptom:** accidental terminal overload avoided  
- **Root cause:** controlled paging required  
- **Fix:** use `less` for all non-trivial files  

---

## `head`
- **Situation:** need to inspect file start  
- **Symptom:** opening full file unnecessary  
- **Root cause:** only header/config needed  
- **Fix:** read first lines using `head`  

---

## `tail`
- **Situation:** check recent file updates  
- **Symptom:** issue occurred recently  
- **Root cause:** latest entries matter  
- **Fix:** inspect end of file using `tail`  

---

## `tail -f`
- **Situation:** live monitoring of logs  
- **Symptom:** issue happens intermittently  
- **Root cause:** need real-time visibility  
- **Fix:** follow file updates continuously  
⚠️ **Risk:** monitoring wrong log leads to false diagnosis  

---

## `watch`
- **Situation:** observe changing system values  
- **Symptom:** state changes over time  
- **Root cause:** dynamic metrics  
- **Fix:** re-run command at intervals automatically  

---

## File size awareness (`ls -lh`)
- **Situation:** before opening any file  
- **Symptom:** unexpected large file behavior  
- **Root cause:** file size not checked  
- **Fix:** verify size before viewing  

---

## Log reading discipline
- **Situation:** production issue investigation  
- **Symptom:** wrong assumptions made  
- **Root cause:** logs not read carefully  
- **Fix:** read logs line-by-line with context  

