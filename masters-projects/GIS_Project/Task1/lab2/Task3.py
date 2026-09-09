import os
from qgis.PyQt.QtGui import QColor

# Set folder paths
shapefile_folder = r"C:/Users/User/Downloads/Lab02-Data (3)/Task3_A2"
csv_file_path = r"C:/Users/User/Downloads/Lab02-Data (3)/Intersection.csv"

# 1. Add Road_Centerlines.shp as 'road' with black color
road_path = os.path.join(shapefile_folder, "Road_Centerlines.shp")
road_layer = iface.addVectorLayer(road_path, "road", "ogr")
if road_layer:
    road_layer.renderer().symbol().setColor(QColor("black"))
    road_layer.triggerRepaint()

# 2. Add Building.shp as 'Building' with orange color
building_path = os.path.join(shapefile_folder, "Building.shp")
building_layer = iface.addVectorLayer(building_path, "Building", "ogr")
if building_layer:
    building_layer.renderer().symbol().setColor(QColor("orange"))
    building_layer.triggerRepaint()

# 3. Add SIDEWALKS.shp as 'sidewalks' with red color
sidewalks_path = os.path.join(shapefile_folder, "SIDEWALKS.shp")
sidewalks_layer = iface.addVectorLayer(sidewalks_path, "sidewalks", "ogr")
if sidewalks_layer:
    sidewalks_layer.renderer().symbol().setColor(QColor("red"))
    sidewalks_layer.triggerRepaint()

# 4. Add INTERSECTIONS.shp as 'Intersections' with gray color
intersections_path = os.path.join(shapefile_folder, "INTERSECTIONS.shp")
intersections_layer = iface.addVectorLayer(intersections_path, "Intersections", "ogr")
if intersections_layer:
    intersections_layer.renderer().symbol().setColor(QColor("gray"))
    intersections_layer.triggerRepaint()

# 5. Export INTERSECTIONS layer to CSV
output_csv_path = r"C:/Users/User/OneDrive/Desktop/GIS/lab2/Intersections.csv"
if intersections_layer:
    _ = QgsVectorFileWriter.writeAsVectorFormat(
        intersections_layer,
        output_csv_path,
        "utf-8",
        driverName="CSV",
        layerOptions=["GEOMETRY=AS_XY"]
    )
    print("Exported Intersections to CSV.")
