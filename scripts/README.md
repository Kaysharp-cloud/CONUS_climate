# Scripts Guide

This folder contains the notebooks and scripts used for this project. The files are arranged so the workflow can be run from this folder using relative paths only.

## Recommended run order

1. `download_noaa_stations.py`
2. `Data_preprocessing.ipynb`
3. `all_indices_average.ipynb`
4. `all_indices_trend.ipynb`
5. `spei_indices.ipynb`
6. `Supplementary_tables.ipynb`
7. `Supplemnetary_figures.ipynb`
8. `arcgis_trend_mapper.ipynb` inside ArcGIS Pro
9. `grid_tiff_plot_updated.ipynb`

## File roles

- `download_noaa_stations.py`: downloads and assembles NOAA daily station data.
- `Data_preprocessing.ipynb`: builds the final daily, monthly, and yearly climate datasets used by the indices workflow.
- `data_loader.py`: loads the station metadata and processed climate tables for the general notebook workflow.
- `data_loader_US_Neon.py`: loads the NEON boundary data and supporting climate tables for the NEON workflows.
- `general_functions_US_Neon.py`: helper functions shared by the NEON notebooks.
- `all_indices_average.ipynb`: computes station and ecoregion averages for the main climate indices.
- `all_indices_trend.ipynb`: computes the Mann-Kendall trend tables for the main climate indices.
- `spei_indices.ipynb`: computes monthly SPEI trend products and drought summaries.
- `Supplementary_tables.ipynb`: formats the supplementary tables for the manuscript.
- `Supplemnetary_figures.ipynb`: generates the manuscript supplementary figures.
- `arcgis_trend_mapper.ipynb`: ArcGIS Pro mapping workflow for trend layers and labels.
- `grid_tiff_plot_updated.ipynb`: final grid and TIFF figure assembly.
- `SPEI_updated.R` in `r_files/`: SPEI-related preparation used before the Python workflow.

## Workflow notes

- The notebooks expect their inputs inside `data_raw/` which is where the NOAA data should be downloaded and the derived outputs folders that will be created by running the scripts are: `data_intermediate/`, `data_intermediate_spei_monthly/`, `data_intermediate_spei_drought/`, `ST/`, or `Figures_*`.
