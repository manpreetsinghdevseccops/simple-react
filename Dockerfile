# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Install build dependencies
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build

# Stage 2: Production
FROM node:18-alpine

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeuser -u 1001 -G nodejs

# Install runtime dependencies
# Using apk's python3 package and installing awscli via pip
RUN apk add --no-cache \
    python3 \
    py3-pip \
    bash \
    && pip3 install --no-cache-dir --break-system-packages awscli

WORKDIR /app

# Copy built files and runtime dependencies
COPY --from=builder /app/build ./build
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/startup.sh ./

# Install only production dependencies
RUN npm ci --only=production

# Set correct ownership
RUN chown -R nodeuser:nodejs /app && \
    chmod +x startup.sh

# Switch to non-root user
USER nodeuser

# Expose port for development server
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Use startup script as entrypoint
ENTRYPOINT ["sh", "startup.sh"]