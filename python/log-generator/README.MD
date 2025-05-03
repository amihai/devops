# Random Log generator

Generate a random app.log to be used in linux commands. For example 


## How to run it
```
python3 log-generator.py 200
```

## How to use the log

```
# Count the number of errors
cat app.log | grep ERROR | wc -l

# Display all the logs for a request id
cat app.log | grep request_id=acac01

# Replace SecretPassword with stars
sed -i 's/password=SecretPassword/password=****/g' app.log

# Display the unique names of the users that have at least one error in log:
cat app.log  | grep -w ERROR |  awk '{print $4}' | awk -F '=' '{print $2}' | sort | uniq

```
