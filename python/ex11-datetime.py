from datetime import date, datetime
import time

d = date(2025, 6, 1)
print(d.year)   
print(d.month)
print(d.day) 

today = date.today() 
print(today)


now = datetime.now()
print(f"Now: {now}")   
print(now.year, now.hour)


print(f"Time: {time.time()}")

start_time = time.time()

print("Do something time consuming")
time.sleep(3)
print("Done!")

end_time = time.time()
duration = end_time - start_time
print(f"Duration: {duration} seconds")