# Use an official base image with necessary tools
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Download the pre-built binary
RUN curl -L https://github.com/rabilrbl/jiotv_go/releases/download/v3.6.0/jiotv_go-linux-amd64 -o jiotv_go-linux-amd64

# Make the binary executable
RUN chmod +x jiotv_go-linux-amd64

# Set the default command to run your binary
CMD ["./jiotv_go-linux-amd64", "run"]
