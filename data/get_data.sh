data_links=("https://data.cityofnewyork.us/api/views/8rma-cm9c/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/qdq3-9eqn/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/p6h4-mpyy/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/t95h-5fsr/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/tvpp-9vvx/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/w7w3-xahh/rows.csv?accessType=DOWNLOAD")
file_names=("geo_location.csv" "weather.csv" "school.csv" "attraction.csv" "event.csv" "business.csv")

for i in "${!data_links[@]}"
do
	echo "Doing the "${file_names[$i]}" file"
	if [[ -f ${file_names[$i]} ]]
	then
		echo "Skip"
	else
		wget -q ${data_links[$i]}
		mv "rows.csv?accessType=DOWNLOAD" ${file_names[$i]}
	fi
	echo "Done"
done
