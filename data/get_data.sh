data_links = ()
file_names = ("geo_location.csv","weather.csv", "school.csv", "poi.csv")

for i in {!data_links[@]}
do
    wget data_links[i]
    mv "" filenames[i]
end
