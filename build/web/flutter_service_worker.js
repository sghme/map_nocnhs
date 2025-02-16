'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2b77c28d0442768926e43230367653c7",
"assets/AssetManifest.bin.json": "4c5a01326be8468f054093a16f7841c6",
"assets/AssetManifest.json": "57523e4be7b4c8c1a5da2a64c3750752",
"assets/assets/images/1.png": "b4047f7b05a78ce34c50bd21e04a4be8",
"assets/assets/images/10.png": "45a18d44b53b48ecd0fabfc3777c30b0",
"assets/assets/images/11.png": "9835acd0ac45d8517d2acd2814e3646a",
"assets/assets/images/12.png": "6eb436607d0a721981e51ae5d312daa1",
"assets/assets/images/13.png": "fb1dfbaff87f4174db32324cbf1d67e7",
"assets/assets/images/14.png": "b5cbb66ccfde6ac1a7c028c0682e32e3",
"assets/assets/images/15.png": "3fbc4b3431361b53f3a8d728f7fe1de8",
"assets/assets/images/16.png": "cfe364d5eda05ac8f2aa8d304ce420cc",
"assets/assets/images/17.png": "6ac87643c506279c66b6baa95acb36a7",
"assets/assets/images/18.png": "6d7210edb32ce3d8a15610b9cb6032df",
"assets/assets/images/19.png": "e9b2b980d117eb50194146251c15c1fc",
"assets/assets/images/2.png": "2bf5e64bd92c00d33229a326c0f9248d",
"assets/assets/images/20.png": "74559893fb40f33048ff8d8e11016e8c",
"assets/assets/images/21.png": "0e07530c15ea910f8a4ab0c216540ce1",
"assets/assets/images/22.png": "d3ccf5a1d1becc61989e7f27b3c3319e",
"assets/assets/images/23.png": "43ef7e29d95c9b3256a367b8e27195eb",
"assets/assets/images/24.png": "9805079dd69235ee5eaa27247ba3d344",
"assets/assets/images/25.png": "e16ba18422597acb4b1e71191e5636b2",
"assets/assets/images/26.png": "242c1c01e1db45f1d2dbf72c3536a9d5",
"assets/assets/images/27.png": "fb7900b7329c01c46f298179679a9785",
"assets/assets/images/27_1.png": "7aaacb6c44ae2e6d5985cc6d1b1b0c1b",
"assets/assets/images/27_2.png": "2eba678b78269419e8e147b099e7950a",
"assets/assets/images/27_3.png": "8a9fc877dd7aec75258ae7f083208f2f",
"assets/assets/images/27_4.png": "92237e1445c7fd0ab134787ccf65f668",
"assets/assets/images/28.png": "984059e71e74c2a17aab8fcc85382d0b",
"assets/assets/images/29.png": "e0195dd0ba836735b91e5901f49f3d17",
"assets/assets/images/3.png": "92e87816a28dc9d8b33072e51b8622c3",
"assets/assets/images/31.png": "1499f5d767612163e38fd21a377938f9",
"assets/assets/images/32.png": "895dcf477726008f75c5bc6cc574fedf",
"assets/assets/images/33.png": "da22c0198cf2b509e2f5e1899f8be8a6",
"assets/assets/images/34.png": "4dd2d12b0757121f14447aadbc15420d",
"assets/assets/images/35.png": "9a6dd87f6727cb621e3725994cfcdff6",
"assets/assets/images/36.png": "c5d0400beb64fe590978443cfb6c9a60",
"assets/assets/images/37.png": "3c376523fb6a70813085995d110de749",
"assets/assets/images/38.png": "450c1f6f7019b31747b157dc95440b3c",
"assets/assets/images/4.png": "6de3665c9292e0487828988b486fdd52",
"assets/assets/images/5.png": "fa7e48170c2f18e9616921b91377d164",
"assets/assets/images/6.png": "e9acb706113b4b1e9d33a7d1eb9c0eff",
"assets/assets/images/7.png": "d5a7a4ba5196a5f2ce7f2ffc12ed3e12",
"assets/assets/images/8.png": "cd90ed8665650d78df2f5beb73929bb1",
"assets/assets/images/9.png": "695d39350281a51e514b8a70453589b4",
"assets/assets/images/evsu.png": "7df503472f5032c50deae2626588a1dc",
"assets/assets/images/logo.png": "7ba6f53428f44d0f135ea421c592fc0e",
"assets/assets/images/nlogo.png": "f7c468160aa53f0f2533f07f96e7f13b",
"assets/assets/images/nocnhsn.png": "78c1dcd7d18deb2ada0619189efc49b3",
"assets/assets/images/noimage.jpg": "dd8f29c9d8653969701a614147a4135f",
"assets/assets/images/noreport.png": "b258f947cb99720ca39049323a84ff2c",
"assets/assets/images/xtriventech.png": "14037ef33e063ed8a2f172d00a6682da",
"assets/assets/north-compass.png": "50c78188a631aee03d1e9d0a8823f93d",
"assets/assets/south-compass.png": "3b4f7d223df2b661e10ac099a9016b5a",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "bd93df733276e411f6f88c816f5dfa82",
"assets/NOTICES": "89f5e31a554130b701405c3a2fd80bdd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "7c4b6132910bf44da37afd47729ea136",
"icons/android-chrome-192x192.png": "89bc7d7a1147b755fc59f0019fe06fc9",
"icons/android-chrome-512x512.png": "4ea23ed2a814768428f82fa31ec78390",
"icons/apple-touch-icon.png": "c3f7a44ba85fd2349528e5171e9a626a",
"index.html": "ce9ca8d015165ae9c77ac839c389a432",
"/": "ce9ca8d015165ae9c77ac839c389a432",
"logoni.png": "89bc7d7a1147b755fc59f0019fe06fc9",
"main.dart.js": "b6fd35fd31fc1e7cf787b39f255fc2d7",
"manifest.json": "99b07ae4b4407c049466a7a9148134e1",
"version.json": "a63d0695ffba9074eacaef28c3c03882"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
