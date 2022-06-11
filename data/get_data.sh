data_links=("https://data.cityofnewyork.us/api/views/8rma-cm9c/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/qdq3-9eqn/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/p6h4-mpyy/rows.csv?accessType=DOWNLOAD" "https://data.cityofnewyork.us/api/views/t95h-5fsr/rows.csv?accessType=DOWNLOAD")
file_names=("geo_location.csv" "weather.csv" "school.csv" "attraction.csv")

for i in "${!data_links[@]}"
do
	echo "Doing the "${filnames[$i]}" file"
	wget -q ${data_links[$i]}
	mv "rows.csv?accessType=DOWNLOAD" ${filenames[$i]}
	echo "Done"
done
