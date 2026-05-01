# ---- Static site servido con nginx ----
FROM nginx:1.27-alpine

# Configuración de nginx (sirve / con index.html y mime types correctos)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Limpia el contenido por defecto y copia los assets del sitio
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/index.html
COPY tweaks-panel.jsx /usr/share/nginx/html/tweaks-panel.jsx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
