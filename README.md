# Manet container image for fly.io

Deploy [Manet](https://github.com/vbauer/manet) website screenshot service on [Fly.io](https://fly.io/).

Run the following commands in this folder:
```bash
fly auth login
fly launch
```
To redeploy it, instead of `fly launch`, run `fly deploy`.

Inspired by [pdelsante/manet-dockerfile](https://github.com/pdelsante/manet-dockerfile).
