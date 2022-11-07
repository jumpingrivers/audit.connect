# streamlit_housing.py

import pandas as pd
import numpy as np
from sklearn.datasets import fetch_california_housing
import streamlit as st
import plotly.express as px
import pydeck as pdk

# Give our app a title
st.title("California House Prices")

# Load our data
@st.cache  # cache the data so it isn't reloaded every time
def load_data():
    housing = fetch_california_housing()
    data = pd.DataFrame(housing.data, columns=housing.feature_names)
    data["medprice"] = housing.target
    lowercase = lambda x: str(x).lower()
    data.rename(lowercase, axis="columns", inplace=True)
    return data


data_load_state = st.text("Loading data...")
data = load_data()
data_load_state.text("Data loaded!")

# Add a tickbox to display the raw data
if st.checkbox("Show raw data"):
    st.subheader("Raw data")
    st.write(data)

# Add a plotly figure
st.subheader("Plot data with Plotly")
fig = px.scatter(data, x="medinc", y="medprice", size="averooms")
fig.update_layout(
    font_family="Courier New",
    xaxis_title="median income / $10000",
    yaxis_title="median house price / $100000",
)
st.plotly_chart(fig)

# Add a map of datapoints
st.subheader("Map data points with `st.map()`")
filter_price = st.slider(
    "Maximum price / $100000", 0.2, 5.0, 5.0, 0.1
)  # a slider widget to select price
filtered_data = data[data["medprice"] <= filter_price]
st.map(filtered_data)

# Add a pydeck map
st.subheader("Map LA house prices with pydeck")
st.pydeck_chart(
    pdk.Deck(
        map_style="mapbox://styles/mapbox/light-v9",
        initial_view_state=pdk.ViewState(
            latitude=33.7783,
            longitude=-118.253,
            zoom=9,
            pitch=50,
        ),
        layers=[
            pdk.Layer(
                "HexagonLayer",
                data=data,
                get_position="[longitude, latitude]",
                radius=500,
                height="medprice",
                elevation_scale=4,
                elevation_range=[0, 1000],
                pickable=True,
                extruded=True,
            ),
        ],
    )
)
