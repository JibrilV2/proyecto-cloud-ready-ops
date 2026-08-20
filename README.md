# Proyecto Final: Cloud-Ready Ops

## Dirección de Acceso Público

* **URL de Prueba:** [http://35.198.11.29](http://35.198.11.29)

---

## Arquitectura y Despliegue

### Infraestructura en Google Cloud Platform (GCP)
* **Red Privada Virtual (VPC):** Creada una red personalizada compuesta por dos subredes principales.
  * **Subred Pública (`subred-publica` / `10.0.1.0/24`):** Aloja la VM del Servidor Web (Nginx) con asignación de IP pública.
  * **Subred Privada (`subred-privada` / `10.0.2.0/24`):** Aloja el servidor MySQL, completamente aislado del acceso directo de entrada desde Internet.
* **Reglas de Firewall:** 
  * Puerto `80` (HTTP) abierto al tráfico público (`0.0.0.0/0`) enfocado en la capa Web.
  * Puerto `22` (SSH) restringido a través de **Google Cloud IAP** (Identity-Aware Proxy).
  * Puerto `3306` (MySQL) restringido estrictamente para tráfico interno desde la capa Web (`target-tags: db`, `source-tags: web`).
* **Salida a Internet (Cloud NAT):** Configuración de **Cloud Router + Cloud NAT** para permitir a la subred privada la descarga e instalación de paquetes y actualizaciones sin exponer IPs públicas.

### Servidor Web (Nginx)
* Instancia de Compute Engine sobre **Ubuntu 22.04 LTS**.
* Servidor Nginx desplegado, configurado y respondiendo peticiones HTTP en el puerto `80`.

### Base de Datos (MySQL)
* Instancia Compute Engine desplegada en la subred privada (`10.0.2.x`).
* Base de datos `empresa_db` aprovisionada con la tabla `Empleados` e información de prueba poblada mediante scripts SQL.

---

## Estructura del Repositorio

```text
.
├── docs/
│   └── arquitectura.png    # Diagrama de la arquitectura de red y seguridad
├── scripts/
│   └── schema.sql          # Estructura SQL y datos de prueba
├── web/
│   └── index.html          # Código fuente de la aplicación frontend
└── README.md               # Documentación técnica del proyecto