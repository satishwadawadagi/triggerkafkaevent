# ---------- Base Image ----------
FROM node:18-alpine

# ---------- App Directory ----------
WORKDIR /app

# ---------- Install Dependencies ----------
COPY package*.json ./
RUN npm install --only=production

# ---------- Copy App ----------
COPY . .

# ---------- Expose Port ----------
EXPOSE 3000

# ---------- Healthcheck ----------
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost:3000/health || exit 1

# ---------- Start App ----------
CMD ["node", "app.js"]
