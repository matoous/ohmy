#!/bin/sh
# This script creates ledger report (double entry accounting system)
# for the last month and sends it to my email.
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
<h3>Last month expenses:</h3>
<pre>
$(ledger -f ~/ledger.dat --input-date-format "%d/%m/%Y" -p "last month" --color bal expenses)
</pre>
<h3>Last month income:</h3>
<pre>
$(ledger -f ~/ledger.dat --input-date-format "%d/%m/%Y" -p "last month" --color --invert bal income)
</pre>
<h3>Current assets:</h3>
<pre>
$(ledger -f ~/ledger.dat --input-date-format "%d/%m/%Y" -X CZK --color bal assets)
</pre>
</body>
" | ezmail "matousdzivjak@gmail.com" --html -s "Balance"
echo "OK ✅: ledger report sent at $(date '+%H:%M:%S %d/%m/%y')"
