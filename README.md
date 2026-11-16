# Organízate — Aplicación Móvil para la Gestión Personal de Tareas (TRL 5)

[![Flutter Version](https://img.shields.io/badge/Flutter-3.47.5-blue.svg)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.13.4-00b4ab.svg)](https://dart.dev)
[![Backend](https://img.shields.io/badge/Backend-Google%20Firebase-orange.svg)](https://firebase.google.com)
[![TRL Level](https://img.shields.io/badge/TRL-Level%205-success.svg)](https://www.nasa.gov)
[![License](https://img.shields.io/badge/License-UNAD%20ECBTI-lightgrey.svg)]()

> **Proyecto de Grado (Código 202016907) — Ingeniería de Sistemas**  
> **Universidad Nacional Abierta y a Distancia (UNAD)**  
> **Escuela de Ciencias Básicas, Tecnología e Ingeniería (ECBTI)**  
> **CEAD Medellín — Zona Occidente (ZOCC)**  
> **Noviembre de 2026**

---

## 👥 Integrantes / Formuladores
* **Juan Esteban Marulanda Restrepo** — C.C. 1.040.741.755 (Estebanm1909)
* **Yeisson Pamplona Posada** — C.C. 1.017.193.829

**Docente Tutor / Director:** Orlando Gómez Barboza

---

## 📌 Descripción del Proyecto
**'Organízate'** es una solución tecnológica móvil orientada a mitigar la sobrecarga cognitiva, el estrés y la fragmentación atencional que enfrentan los estudiantes universitarios con vínculo laboral activo en el Valle de Aburrá (Antioquia). 

A diferencia de los gestores tradicionales de listas planas, 'Organízate' implementa:
1. **Segmentación por Ámbitos de Vida:** Separación funcional de compromisos en los cuadrantes *Personal*, *Laboral*, *Académico (Estudio)* y *Salud/Familiar*.
2. **Automatización de la Matriz de Eisenhower:** Clasificación algorítmica de prioridades en función de la urgencia e importancia (Alta, Media, Baja).
3. **Persistencia y Sincronización en Tiempo Real:** Backend serverless distribuido sobre **Google Cloud Firestore**.
4. **Sistema de Recordatorios Programados:** Notificaciones locales respetando la zona horaria del dispositivo mediante `flutter_local_notifications`.
5. **Tema Dinámico (Light/Dark Mode):** Alternancia de tema visual mediante `Provider`.

---

## 🏗️ Arquitectura de Software
El sistema adopta una arquitectura desacoplada por capas (Clean Architecture / MVC):
```
lib/
├── firebase_options.dart   # Configuración de entornos Firebase (Android, Web, iOS, Windows)
├── main.dart               # Punto de entrada de la aplicación
├── models/
│   ├── task.dart           # Modelo de datos de tareas (prioridad, fechas, ámbito)
│   └── user.dart           # Modelo de perfil de usuario
├── screens/
│   ├── AuthWrapper.dart    # Escucha reactiva de estado de sesión
│   ├── login_screen.dart   # Autenticación con Firebase Auth
│   ├── register_screen.dart# Registro de nuevos usuarios
│   ├── home_screen.dart    # Dashboard de tareas con filtros
│   ├── create_task_screen.dart # Formulario con Eisenhower
│   ├── edit_profile_screen.dart# Gestión de preferencias y tema
│   └── splash_screen.dart  # Pantalla de carga inicial
├── services/
│   ├── auth_service.dart   # Servicios de autenticación
│   ├── firebase_service.dart# Operaciones CRUD en Cloud Firestore
│   └── notification_service.dart # Notificaciones locales
├── theme/
│   ├── app_theme.dart      # Estilos Material Design 3
│   └── theme_provider.dart # Estado global de modo claro / oscuro
└── widgets/
    ├── custom_input.dart   # Campos de texto personalizados
    └── social_login_button.dart
```

---

## 🚀 Requisitos e Instalación

### Prerrequisitos
* **Flutter SDK:** ^3.47.0 o superior
* **Dart SDK:** ^3.13.0
* **Java Development Kit (JDK):** JDK 17 LTS
* **Android SDK:** API 34+ (Probado en Android 17 / API 37)

### Instrucciones para Ejecución Local
1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/Estebanm1909/Organizate.git
   cd Organizate
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar en emulador o dispositivo móvil:**
   ```bash
   flutter run
   ```

4. **Ejecutar en navegador Web (Google Chrome):**
   ```bash
   flutter run -d chrome
   ```

---

## 🔬 Nivel de Maduración Tecnológica (TRL 5)
El prototipo funcional alcanza el nivel **TRL 5** (*Tecnología validada en un entorno relevante*), demostrado a través de:
* Integración real y operativa entre el cliente móvil Flutter y la nube de Google Firebase (Proyecto `org4niz4t3`).
* Batería de 10 casos de prueba funcionales e integrales superados con 100% de éxito.
* Generación del artefacto binario ejecutable `app-debug.apk` (80.4 MB) para instalación sobre dispositivos móviles Android.
