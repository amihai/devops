text = "This is a text to be displayed"

print(f"Length: {len(text)}")

print(f"Character at position 0: {text[0]}")
print(f"Character at position 8: {text[8]}")
print(f"Last character: {text[-1]}")

print(f"First 5 charcters: [{text[0:5]}]")
print(f"First 5 charcters: [{text[:5]}]")
print(f"Last 4 charcters: [{text[-4:]}]")
print(f"Characters from position 3 to 10: [{text[3:10]}]")

# ------------

for c in text:
    print(c)

# ------------

first_name = "Ioana"
last_name = "Popescu"

name = first_name + ", " + last_name 
print(name)

# ------------

log = f"""
Jun  1 17:30:01 ubuntu2204 CRON[85413]: pam_unix(cron:session): session closed for user root
Jun  1 18:17:01 ubuntu2204 CRON[89673]: pam_env(cron:session): non-alphanumeric key 'echo Salut din etc env' in /etc/environment', ignoring
Jun  1 18:17:01 ubuntu2204 CRON[89673]: pam_unix(cron:session): session opened for user root(uid=0) by (uid=0)
Jun  1 18:17:01 ubuntu2204 CRON[89673]: pam_unix(cron:session): session closed for user root
Jun  1 18:30:01 ubuntu2204 CRON[91777]: pam_env(cron:session): non-alphanumeric key 'echo Salut din etc env' in /etc/environment', ignoring
Jun  1 18:30:01 ubuntu2204 CRON[91777]: pam_unix(cron:session): session opened for user root(uid=0) by (uid=0)
Jun  1 18:30:01 ubuntu2204 CRON[91777]: pam_unix(cron:session): session closed for user root
"""

anonymize_hostname = log.replace("ubuntu2204", "<hostname>")
print(f"anonymize_hostname = \n {anonymize_hostname}")

count_hostname = log.count("ubuntu2204")
print(f"Hostname logs: " + str(count_hostname))


# ------------

path = "/var.log/auth.log"
index_first_postion = path.find("/")
index_last_postion = path.rfind("/")
print("First postion of / : {index_first_postion}")
print("Last postion of / : {index_last_postion}")
filename = path[index_last_postion + 1:]
print(f"Filename: {filename}")