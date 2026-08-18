# Proyecto Final: Cloud-Ready Ops

## Dirección de Acceso Publico
- **URL de prueba:** `http://35.198.11.29`

---

## Arquitectura y Despliegue Paso a Paso

1. **Infraestructura en Google Cloud Platform (GCP):**
   - **Red Privada (VPC):** Creada red personalizada con dos subredes.
   - **Subred Pública (`frontend-subnet`):** Aloja la VM del Servidor Web Nginx con IP pública.
   - **Subred Privada (`backend-subnet`):** Aloja el servidor MySQL aislado sin acceso directo a Internet.
   - **Reglas de Firewall:** Configurado puerto `80` (HTTP) de entrada para el servidor Web y tráfico `3306` habilitado estrictamente entre las dos subredes.

2. **Servidor Web (Nginx):**
   - Instancia Compute Engine con Ubuntu 22.04 LTS.
   - Servidor Nginx desplegado y respondiendo por puerto 80.

3. **Base de Datos (MySQL):**
   - Instancia Compute Engine en subred privada (`10.0.2.2`).
   - Base de datos `empresa_db` creada con la tabla `Empleados` e información de prueba cargada mediante script SQL.

---

## 📁 Estructura del Repositorio
- `docs/`: Diagrama de la arquitectura de red (`arquitectura.png`).
- `scripts/`: Definición de la estructura SQL (`schema.sql`).
- `web/`: Archivo fuente de la aplicación (`index.html`).
- `README.md`: Documentación técnica del proyecto.