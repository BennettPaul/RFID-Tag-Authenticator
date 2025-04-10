This is intended to take a set of values (reader number, RFID Key) then authenticate them against a text file database. If the validation is a success, it will pass the order to open the door to another program.

Currently this is set to work with a single reader. The format is as follows:

RFID_tag Lastname,Firstname

Authentication attemtps will log to a file called scan.log

Eventually this will also have registration functions.

Once I expand this to multiple doors, the basic database structure should look like the following:

RFID Tag | Name | Access to Door1 | Access to Door2 | Access to Door3 | Etc.

Logging will append the following data to a file:

Time | Name | RFID Tag | Door Attempted to Access | Success/Failure
