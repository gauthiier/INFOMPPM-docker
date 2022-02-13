import streamlit as st
from random import random

# set episode session state
def select_book(isbn):
  st.session_state['ISBN'] = isbn

def tile_item(item):
  st.button('📖', key=random(), on_click=select_book, args=(item['ISBN'], ))
  st.image(item['Image-URL-M'], use_column_width='always')
  st.caption(item['Book-Title'])

def recommendations(df):
  columns = st.columns(10)
  c = 0
  for index, item in df.iterrows():
    c = c + 1
    if c == 1:
      with columns[0]:
        tile_item(item)
    if c == 2:
      with columns[1]:
        tile_item(item)
    if c == 3:
      with columns[2]:
        tile_item(item)
    if c == 4:
      with columns[3]:
        tile_item(item)
    if c == 5:
      with columns[4]:
        tile_item(item)
    if c == 6:
      with columns[5]:
        tile_item(item)
    if c == 7:
      with columns[6]:
        tile_item(item)
    if c == 8:
      with columns[7]:
        tile_item(item)
    if c == 9:
      with columns[8]:
        tile_item(item)
    if c == 10:
      with columns[9]:
        tile_item(item)        
      c = 0