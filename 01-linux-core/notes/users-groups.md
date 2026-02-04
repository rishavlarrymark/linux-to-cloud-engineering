👤 USERS, GROUPS & SUDO — CORE PRODUCTION NOTES (DAY 5)
User not found

Situation: command fails on user
Symptom: no such user
Root cause: user not created / deleted
Fix: verify user
id username

User can’t log in

Situation: login/auth fails
Symptom: authentication error
Root cause: password or shell missing
Fix: set password / shell
passwd username
usermod -s /bin/bash username

Permission denied on shared files

Situation: user blocked from resource
Symptom: permission denied
Root cause: missing group membership
Fix: add user to group
usermod -aG group user

⚠️ Risk: without -a, existing groups are lost

Group “not visible”

Situation: group seems missing
Symptom: id group fails
Root cause: group checked as user
Fix: query group DB
getent group group

sudo denied

Situation: admin command fails
Symptom: “not in sudoers”
Root cause: user not in sudo group
Fix: grant sudo access
usermod -aG sudo user

⚠️ Risk: sudo misconfig = security exposure

Unsure admin scope

Situation: unclear sudo rights
Symptom: inconsistent permission behavior
Root cause: sudo rules unknown
Fix: inspect sudo scope
sudo -l

User removal

Situation: access must be revoked
Symptom: user still present
Root cause: identity not removed
Fix: delete user
userdel -r username

⚠️ Risk: deletes all user data
