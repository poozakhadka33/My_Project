# Web-Based GIS and Spatial Data Visualization

## Project Overview

How can geographic data be presented through a web application to make spatial information easier to explore?

This project explores web-based Geographic Information Systems (GIS) using Python and Flask. The application provides separate pages for different GIS tasks and includes an endpoint that loads and serves supermarket location data in GeoJSON format.

The project demonstrates how a Python web application can organize GIS functionality and make geographic data available for web-based visualization and analysis.

## Project Objectives

- Develop a web application to organize multiple GIS tasks.
- Use Python and Flask to create application routes.
- Load geographic data stored in GeoJSON format.
- Provide supermarket location data through a web endpoint.
- Explore how web technologies can support the presentation of spatial information.

## Tools and Technologies

- **Python** — application logic
- **Flask** — web application and routing
- **GeoJSON** — geographic data representation
- **JSON** — structured data handling
- **HTML templates** — separate pages for individual tasks

## How It Works

### 1. Web Application

Created a Flask application with a home page and separate routes for seven GIS task pages. Each route renders its corresponding HTML template.

### 2. Geographic Data Handling

Loaded supermarket location data from a GeoJSON file using Python's JSON functionality.

### 3. Data Endpoint

Created a Flask endpoint that returns the supermarket GeoJSON data as a JSON response, making the geographic dataset available to the web application.

### 4. Modular Structure

Organized the application into separate routes so that individual GIS tasks can be accessed independently.

## Key Learning Outcomes

- Building a web application with Python and Flask.
- Organizing application routes and HTML templates.
- Working with geographic data in GeoJSON format.
- Serving structured spatial data through a web endpoint.
- Exploring the connection between web development and GIS.

## Potential Applications

Web-based GIS can support applications such as:

- Exploring supermarket locations.
- Understanding the geographic distribution of services.
- Supporting location-based analysis and planning.
- Presenting spatial information through interactive web applications.

These are potential applications of the technologies used in this project, rather than confirmed outcomes of the current implementation.

## How to Run

### Prerequisites

- Python 3
- Flask

### Setup

1. Clone or download the repository.
2. Install Flask:

```bash
pip install flask
```

3. Ensure the project includes `app.py`, the required HTML templates, and `supermarket.geojson`.
4. Run the application:

```bash
python app.py
```

5. Open the local address displayed in the terminal in your browser.

**Note:** The application references templates named `task1.html` through `task7.html`. These files and the GeoJSON data must be present in the expected locations for the relevant pages and endpoint to work.

## Project Context

This project reflects my learning in GIS and web-based geographic information systems. It combines Python web development with the handling of structured spatial data and supports my broader interest in data analysis, visualization, and location-based insights.

## Future Improvements

- Document the purpose and functionality of each GIS task.
- Add screenshots of the completed maps and application pages.
- Explain the geographic dataset and the questions explored.
- Include examples of spatial analysis and the findings they produce.
- Add setup instructions for any additional mapping libraries or services used.
