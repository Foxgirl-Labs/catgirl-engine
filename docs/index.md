---
---

## Wasm Test

<link rel="manifest" href="/manifest.json" />
<link rel="icon" type="image/png" href="/assets/vanilla/texture/logo/logo-1024x1024-color.png" />
<link rel="icon" type="image/svg+xml" href="/assets/vanilla/texture/logo/logo.svg" />
<link rel="license" href="/pkg/LICENSE" />
<canvas id="catgirl-engine-canvas"></canvas>
<!-- <script type="text/javascript">console.clear();</script> -->
<script type="text/javascript">
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register("/service-worker.js");
    }
</script>
<script type="module">
    import init, * as engine from "./pkg/catgirl-engine.js";

    window.addEventListener('load', async function () {
        await init();

        console.log("WASM Loaded");
        console.debug("%cYou can gain access to the engine's functions by calling %cgetEngine()", "color: orange; font-weight: bold; font-size: 200%", "color: purple; font-weight: bold; font-size: 200%");
        // engine.print_version();
        // engine.print_dependencies();
    });

    /**
        * Allows retrieving engine
        * @returns {engine} Exported engine functions
        */
    export function getEngine() {
        return engine;
    }

    // Allows retrieving engine from console
    //   as window.getEngine()
    globalThis.getEngine = getEngine
</script>
