This is intended to take a set of values (reader number, RFID Key) then authenticate them against a MongoDB database. If the validation is a success, it will pass the order to open the door to another program.

Eventually this will also have registration and logging functions.

Basic database structure should look like the following:

Name | RFID Tag | Access to Door1 | Access to Door2 | Access to Door3 | Etc.

Logging will append the following data to a file:

Time | Name | RFID Tag | Door Attempted to Access | Success/Failure
