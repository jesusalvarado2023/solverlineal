import streamlit as st
import random

st.set_page_config(page_title="Ejercicios MRU", page_icon="🚗")

st.title("🚗 Ejercicios de Movimiento Rectilíneo Uniforme (MRU)")

# Estado de la sesión
if "ejercicio" not in st.session_state:
    st.session_state.ejercicio = None
if "solucion" not in st.session_state:
    st.session_state.solucion = None

# Función para generar un nuevo ejercicio
def nuevo_ejercicio():
    opcion = st.radio("Selecciona lo que deseas calcular:", ["Velocidad (v)", "Distancia (d)", "Tiempo (t)"])
    
    if opcion == "Velocidad (v)":
        d = random.randint(50, 500)  # metros
        t = random.randint(5, 60)    # segundos
        st.session_state.ejercicio = f"Un objeto recorre {d} m en {t} s. Calcula la velocidad."
        st.session_state.solucion = d / t

    elif opcion == "Distancia (d)":
        v = random.randint(5, 30)   # m/s
        t = random.randint(5, 60)   # s
        st.session_state.ejercicio = f"Un objeto se mueve a {v} m/s durante {t} s. Calcula la distancia recorrida."
        st.session_state.solucion = v * t

    else:  # Tiempo
        d = random.randint(100, 500) # m
        v = random.randint(5, 25)    # m/s
        st.session_state.ejercicio = f"Un objeto recorre {d} m a una velocidad de {v} m/s. Calcula el tiempo."
        st.session_state.solucion = d / v

# Botón para generar un ejercicio
if st.button("🎲 Generar nuevo ejercicio"):
    nuevo_ejercicio()

# Mostrar el ejercicio
if st.session_state.ejercicio:
    st.write("### Ejercicio:")
    st.info(st.session_state.ejercicio)

    respuesta = st.number_input("✍️ Ingresa tu respuesta:", step=0.1)

    if st.button("✅ Verificar respuesta"):
        if abs(respuesta - st.session_state.solucion) < 0.01:
            st.success("¡Correcto! 🎉")
            st.balloons()
        else:
            st.error(f"❌ Incorrecto. La respuesta correcta es {st.session_state.solucion:.2f}")
