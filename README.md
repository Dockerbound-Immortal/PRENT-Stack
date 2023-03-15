# Nginx Gateway Microservice Template

This template contains a complete stack utilising a `Node` API and `React` frontend with both
backend and frontend `TypeScript` configured.

# Usage

To use this project for development you can run the makefile. You will need to ensure
the networks build prior to the containers for the Nginx gateway to function correctly.

To develop on your local machine you will need to run `yarn install` in both the client and api.
These applications will still work without this as `node_modules` is mounted within the container.

# Ports

The ports are exposed for development on `3000` and `3001`. These ports should not be exposed
on production, instead you should allow the gateway to forward traffic in the network. The reason
for this is that the direct access to the application is faster for development.

- Client: `8080` || `3000`
- API: `8080/api/` || `3001`

# Technologies
- `Node`
- `React`
- `TypeScript`
- `Vite`
- `Nginx`
- `Jest`
- `React Testing Library`
- `Jest`
- `JestDom`
- `Vitest`
- `Nodemon`