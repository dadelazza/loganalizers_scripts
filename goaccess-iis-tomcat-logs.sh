# Script per generare report di log IIS e Tomcat access log

export LANG=en_US.UTF-8

# Ottieni il nome della cartella corrente
folder_name=$(basename "$PWD")

# Mostra il nome del file creato
echo "Report creati per il: $folder_name"

#report completo
grep -h ".*" *.log | goaccess -o report-${folder_name}-IIS-00-AllISAPICalls.html --html-report-title="IIS: all accesses to any ISAPI of ${folder_name}" --log-format='%d %t %^ %m %U %q %^ %^ %h %u %R %s %^ %^ %^ %^ %L' --date-format=%Y-%m-%d --time-format=%H:%M:%S --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated

#solo l'api SearchCalendarAvailability
grep -h "SearchCalendarAvailability" *.log | goaccess -o report-${folder_name}-IIS-01-SearchCalendarAvailability.html --html-report-title="IIS: SearchCalendarAvailability of ${folder_name}" --log-format='%d %t %^ %m %U %q %^ %^ %h %u %R %s %^ %^ %^ %^ %L' --date-format=%Y-%m-%d --time-format=%H:%M:%S --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated

#solo le righe senza verbo con errore 500
grep -h "/BosServices\.dll/soap/IWsAPIPerformance -.*- 500 0.*" *.log | goaccess -o report-${folder_name}-IIS-02-Performance500.html --html-report-title="IIS: IWsAPIPerformance with error 500 of ${folder_name}" --log-format='%d %t %^ %m %U %q %^ %^ %h %u %R %s %^ %^ %^ %^ %L' --date-format=%Y-%m-%d --time-format=%H:%M:%S --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated

#solo l'api FindPerformanceCapacityAndProduct
grep -h "FindPerformanceCapacityAndProduct" *.log | goaccess -o report-${folder_name}-IIS-03-FindPerformanceCapacityAndProduct.html --html-report-title="IIS: FindPerformanceCapacityAndProduct of ${folder_name}"  --log-format='%d %t %^ %m %U %q %^ %^ %h %u %R %s %^ %^ %^ %^ %L' --date-format=%Y-%m-%d --time-format=%H:%M:%S --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated

#access log tomcat completo
grep -h ".*" *.txt | goaccess -o report-${folder_name}-tomcat-00-AllAccesses.html --html-report-title="Tomcat: All accesses of resource of ${folder_name}" --log-format=COMMON --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated --exclude-url='\.(css|js|jpg|jpeg|png|gif|ico|svg|woff|woff2|ttf|eot|otf|mp4|webm|avi|mov)$'

#access log Tomcat: solo accessi a buy_tickets
grep -h "buy-tickets\.html" *.txt | goaccess -o report-${folder_name}-tomcat-01-buy-tickets.html --html-report-title="Tomcat: buy-tickets.html of ${folder_name}" --log-format=COMMON --enable-panel=VISIT_TIMES --ignore-panel=VISITORS --ignore-panel=HOSTS --ignore-panel=REQUESTS --ignore-panel=REQUESTS_STATIC --ignore-panel=REFERRERS --ignore-panel=REFERRING_SITES --ignore-panel=OS --ignore-panel=BROWSERS --ignore-panel=STATUS_CODES --ignore-panel=NOT_FOUND --html-prefs='{"theme":"bright","perPage":50,"layout":"vertical","showTables":false}' --max-items=100 --no-html-last-updated


