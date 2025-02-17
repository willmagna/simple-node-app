ARG NODE_VERSION=22

FROM node:${NODE_VERSION}-alpine

# Install required tools
RUN apk add --no-cache bash tzdata

# Set the timezone to São Paulo
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ENV DATABASE_URL=postgresql://postgres:MIEVRPTvWlghAACHUnWZzGsvLqvUMkLU@autorack.proxy.rlwy.net:48586/railway
# ENV DATABASE_URL=postgresql://postgres:MIEVRPTvWlghAACHUnWZzGsvLqvUMkLU@postgres.railway.internal:5432/railway?connect_timeout=300

WORKDIR /app

# Copy package.json and yarn.lock to cache dependencies
COPY package*.json ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the project files
COPY . .

# Build the project
RUN yarn run build

# Command to start the worker
CMD ["yarn", "start"]
