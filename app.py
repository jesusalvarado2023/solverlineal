# app.py
import streamlit as st
import random

st.set_page_config(page_title="Ecuaciones de 1er grado", page_icon="🧮")

st.title("🧮 Práctica: Ecuaciones de Primer Grado")

# Generar coeficientes aleatorios con solución entera
a = random.randint(1, 10)
x_real = random.randint(-10, 10)
b = a * x_real + random.randint(-10, 10)

st.write("Resuelve la siguiente ecuación para x:")

# Mostrar ecuación en formato matemático
st.latex(f"{a}x + {b - a*x_real} = {b}")

# Input del usuario
respuesta = st.number_input("Ingresa el valor de x:", step=1, format="%d")

# Botón para verificar
if st.button("Verificar respuesta"):
    if respuesta == x_real:
        st.success("✅ ¡Correcto! 🎉")
        st.balloons()
    else:
        st.error("❌ Incorrecto. Intenta de nuevo.")
