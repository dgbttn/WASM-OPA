## Build the WebAssembly binary for the example policy:

> The syntax shown below requires OPA v0.20.5+

There is an example [rego](https://www.openpolicyagent.org/docs/latest/#rego) policy included with the example, see [wasm.rego](./wasm.rego)

```bash
opa build -t wasm -e 'wasm/test' ./wasm.rego
tar -xzf ./bundle.tar.gz /policy.wasm
```

This will create a bundle tarball with the WASM binary included, and then unpack just the `policy.wasm` from the bundle.

## Use .wasm file in js

See [app.js](./app.js)
