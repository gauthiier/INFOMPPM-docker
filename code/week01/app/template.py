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
  boundary = 9
  c = 0
  
  for index, item in df.iterrows():
    
    if c >= 0 and c <= boundary:
      with columns[c]:
        tile_item(item)
        
    if c == boundary:
      c = 0
    else:
      c += 1
