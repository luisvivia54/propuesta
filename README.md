# Propuesta Escolar — Transformación Digital Educativa

Landing page estática (HTML + GSAP + React/Babel en cliente) lista para
deployar en CapRover con Docker + nginx.

## Estructura

```
propuesta-escolar/
├── index.html          # La vista (antes "Propuesta Escolar.html")
├── tweaks-panel.jsx    # Panel de tweaks (React via Babel standalone)
├── Dockerfile          # Imagen nginx:alpine sirviendo estáticos
├── nginx.conf          # Config de nginx (mime, cache, gzip)
├── captain-definition  # Apunta al Dockerfile para CapRover
├── .dockerignore
└── .gitignore
```

## Desarrollo local

Abre `index.html` directo en el navegador, o levanta un server estático:

```bash
npx serve .
# o
python3 -m http.server 8080
```

## Build & run con Docker

```bash
docker build -t propuesta-escolar .
docker run --rm -p 8080:80 propuesta-escolar
# → http://localhost:8080
```

## Deploy en CapRover

1. `git init && git add . && git commit -m "init"`
2. Crear la app en CapRover (HTTP port: **80**).
3. Push con el CLI:

   ```bash
   caprover deploy
   ```

   o conecta el repo de Git desde la UI de CapRover (rama `main`).

CapRover detecta `captain-definition` → construye el `Dockerfile` →
nginx sirve el sitio en el dominio de la app.
