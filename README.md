# 🛒 Sistema de Ventas — Challenger SQL

Sistema de base de datos relacional que modela el ciclo completo de ventas de un negocio: clientes, productos, transacciones y detalle de cada venta.

---

## 📋 1. Descripción del proyecto

### 🏗️ ¿Qué sistema modelaron?

Se modeló un **sistema de ventas** compuesto por cuatro entidades principales:

- **Clientes** — personas registradas que realizan compras.
- **Productos** — artículos disponibles para la venta con nombre y precio.
- **Ventas** — transacciones realizadas por un cliente en una fecha determinada.
- **Detalle de venta** — líneas de cada venta que registran qué productos se compraron y en qué cantidad.

### 🎯 ¿Qué problema resuelve?

El sistema permite registrar y consultar toda la actividad comercial de un negocio. Con él se puede responder preguntas como:

- ¿Cuántas ventas realizó cada cliente?
- ¿Qué productos se venden más?
- ¿Cuál es el ingreso total por productos?
- ¿Qué ventas incluyen más de un artículo?

El objetivo del challenger es demostrar el manejo de consultas SQL desde las más básicas (SELECT, WHERE, ORDER BY) hasta las avanzadas (JOIN, GROUP BY, HAVING, subconsultas).

---

## 🛠️ 2. Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| **PostgreSQL** | Motor de base de datos relacional |
| **SQL** | Lenguaje para definición y consulta de datos |


---

### 📁 Estructura del proyecto

```
sql-sistema-ventas-/
│
├── schema.sql      → Creación de tablas y relaciones
├── seed.sql        → Datos de prueba (INSERT)
├── report.sql      → Las 26 consultas del challenger
└── README.md       → Este archivo
```

---

## 🚀 3. Instrucciones de uso

### ⚙️ Requisitos previos

- Tener instalado **PostgreSQL** (versión 16 o superior recomendada).
- Tener acceso a `psql` desde la terminal, o usar una herramienta gráfica como **pgAdmin**, **DBeaver** o **Visual Studio Code (con extensión de PostgreSQL)**.

---

### 🗄️ Paso 1 — Crear la base de datos

Abre una terminal y ejecuta:

```bash
psql -U postgres
```

Dentro de `psql`, crea la base de datos:

```sql
CREATE DATABASE sql-sistema-ventas-;
\c sql-sistema-ventas-
```

---

### 📐 Paso 2 — Ejecutar `schema.sql`

Este archivo crea todas las tablas con sus relaciones y claves foráneas.

**Desde la terminal:**

```bash
psql -U postgres -d sql-sistema-ventas- -f schema.sql
```

**Desde DBeaver o pgAdmin:**

1. Abre la herramienta y conéctate a la base de datos `sql-sistema-ventas-`.
2. Abre el archivo `schema.sql`.
3. Ejecuta el script completo.

✅ Resultado esperado: se crean las tablas `clientes`, `productos`, `ventas` y `detalle_venta`.

---

### 🌱 Paso 3 — Ejecutar `seed.sql`

Este archivo inserta los datos de prueba necesarios para probar las consultas.

**Desde la terminal:**

```bash
psql -U postgres -d sql-sistema-ventas- -f seed.sql
```

**Desde DBeaver o pgAdmin:**

1. Abre el archivo `seed.sql`.
2. Ejecuta el script completo.

✅ Resultado esperado: las tablas contiene los datos de clientes, productos y ventas de ejemplo.

---

### 📊 Paso 4 — Ejecutar `report.sql`

Este archivo contiene las 26 consultas del challenger. Puedes ejecutarlas todas juntas o de forma individual para más seguridad.

**Ejecutar todas las consultas de una vez:**

```bash
psql -U postgres -d sql-sistema-ventas- -f report.sql
```

**Ejecutar una consulta específica:**

Abre `report.sql` en tu editor SQL, selecciona la consulta que quieras y ejecútala.

✅ Resultado esperado: cada consulta devuelve los datos descritos en su comentario.

---

## 🗺️ 4. Diagrama Entidad-Relación
---
```mermaid
erDiagram
    CLIENTES ||--o{ VENTAS : realiza
    PRODUCTOS ||--o{ DETALLE_VENTA : contiene
    VENTAS ||--o{ DETALLE_VENTA : incluye

    CLIENTES {
        INT id_cliente PK
        STRING nombre
        STRING email UK
    }

    PRODUCTOS {
        INT id_producto PK
        STRING nombre
        NUMERIC precio
    }

    VENTAS {
        INT id_venta PK
        DATE fecha
        INT id_cliente FK
    }

    DETALLE_VENTA {
        INT id_detalle PK
        INT id_venta FK
        INT id_producto FK
        INT cantidad
    }
 ```


---

## 👤 5. Autores

* Javiera Godoy
* Javiera Gallegos
* Victor Erazo
* Diego Contreras
* Alexander Hass


*Homies © 2026. Todos los derechos reservados. Generation - Javalimos*
