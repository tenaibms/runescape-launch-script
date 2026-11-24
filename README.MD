# Description
Very small powershell script to assist in launching multiple RS3 or OSRS accounts.

# Usage
Download the repository and extract it to a convenient location.

Launch RuneLite on each account you want to add with `--insecure-write-credentials`, and then paste the credential file into the respective RS3 or OSRS folders.

If you have RuneLite or RS3 installed to a non-standard directory you will need to change that in the script. It will be very obvious where.

Finally, from any credential file, copy the session ID and paste it into a new file called `sessionid.txt`. For example, if a credential file has the following structure:
```#Do not share this file with anyone
#Today's date
JX_CHARACTER_ID=blahblah
JX_SESSION_ID=mysessionid
JX_REFRESH_TOKEN=
JX_DISPLAY_NAME=foobar
JX_ACCESS_TOKEN=
```
you would paste `mysessionid` into `sessionid.txt`

Happy Scaping! (´・ω・｀)∫
## Demo Video
![](https://i.imgur.com/FpvKuoC.gif)
