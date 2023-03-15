# Nginx Gateway Microservice Template

This template contains a complete stack utilising a `Node` API and `React` frontend with both
backend and frontend `TypeScript` configured.

# Usage

- To run this project for `development` with the `gateway` run: `make all`
- To run this project for `development` without the `gateway` run: `make dev`
- To run this project for `production` run: `make all` but remove the EXPOSED ports in the service containers

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