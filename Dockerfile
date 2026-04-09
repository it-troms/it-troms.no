FROM nginxinc/nginx-unprivileged:alpine-slim

COPY --chown=nginx:nginx site/ /usr/share/nginx/html/

RUN cat > /etc/nginx/conf.d/default.conf <<'EOF'
server {
    listen 8080;
    root /usr/share/nginx/html;
    index index.html;

    try_files $uri $uri.html $uri/ =404;

    location ~* \.(css|js|jpg|jpeg|png|gif|svg|ico|woff2?)$ {
        expires 7d;
        add_header Cache-Control "public, immutable";
    }

    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;

    error_page 404 /404.html;
}
EOF
