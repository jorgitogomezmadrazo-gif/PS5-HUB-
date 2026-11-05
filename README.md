# Game Hub

`index.html` is the whole hub (one file). `sw.js` + `scramjet/` + `controller/` are the Scramjet proxy files it uses for linked games.

## Put it on GitHub and run it (GitHub Pages)
1. Create a new GitHub repository and upload **everything in this folder** (keep the `.github` folder).
2. Repo **Settings → Pages → Build and deployment → Source: GitHub Actions**.
3. Push/upload to `main`. The "Deploy Game Hub" action downloads the official Scramjet files and publishes the site.
   Your hub opens at `https://<you>.github.io/<repo>/`.
4. Open `config.js`, set `wisp` to your Wisp server (`wss://.../wisp/`), commit. Without a Wisp server the proxy toggle can't connect;
   the hub then loads links directly instead.

## Run it on your own computer
```
npm install
npm run fetch-scramjet
npx serve .        # or any static server; http://localhost works for service workers
```

## About jsDelivr
jsDelivr is a file CDN, not a website host: as far as I know it serves `.html` as plain text and a service worker must come from the
same origin as the page, so the hub itself (and the proxy) can't run from a `cdn.jsdelivr.net` link. Use GitHub Pages (above).
jsDelivr is fine for the hub's other files — games, covers and music are already loaded from it.
