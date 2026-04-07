# Multi-stage build for optimized React application

# Stage 1: Build stage
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files for dependency installation
COPY package*.json ./

# Install dependencies (including devDependencies for build)
RUN npm ci --only=production=false

# Copy application source code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Production stage
FROM node:18-alpine AS production

# Install runtime dependencies required by startup.sh
# AWS CLI is needed to fetch parameters from SSM
# bash is needed to run the startup script
RUN apk add --no-cache \
    bash \
    aws-cli \
    && rm -rf /var/cache/apk/*

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S reactuser -u 1001 -G nodejs

# Set working directory
WORKDIR /app

# Copy package files and install only production dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy built application from builder stage
COPY --from=builder --chown=reactuser:nodejs /app/build ./build
COPY --from=builder --chown=reactuser:nodejs /app/public ./public
COPY --from=builder --chown=reactuser:nodejs /app/src ./src

# Copy and set permissions for startup script
COPY --chown=reactuser:nodejs startup.sh /startup.sh
RUN chmod +x /startup.sh

# Create directories for runtime files and set ownership
RUN mkdir -p /app/logs /app/temp && \
    chown -R reactuser:nodejs /app

# Switch to non-root user
USER reactuser

# Expose port for React development server
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production

# Use startup script as entrypoint
ENTRYPOINT ["sh", "/startup.sh"]