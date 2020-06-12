#!/bin/sh
# This scripts sends agenda (from google calendar) for upcomming week to my email.
agenda=$(gcalcli --nocolor --nocache --lineart ascii calw --military --nostarted --nodeclined)
echo "
<\!DOCTYPE html>
<html>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
<title>Summary</title>
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>
<style>.term-container {
background: #171717;
border-radius: 5px;
color: white;
word-break: break-word;
overflow-wrap: break-word;
font-family: Monaco, courier;
font-size: 12px;
line-height: 20px;
padding: 14px 18px;
white-space: pre-wrap;
}
</style>
</head>
<body>
<h3>Agenda for this week:</h3>
<pre>
$agenda
</pre>
</body>
" | ezmail -s "Weekly Agenda" --html matousdzivjak@gmail.com
echo "OK ✅: weekly agenda sent at $(date '+%H:%M:%S %d/%m/%y')"
