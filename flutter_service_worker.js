'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js_113.part.js": "b77fc81021dfafa23ee286e8c1206e00",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "3a2749aebf735c07df2da06d737c296d",
"icons/Icon-192.png": "1a62cb3549d9d82cb54cd66482e4ffcc",
"icons/apple-touch-icon.png": "e2cfa565ad61d71bf686b19ee2f050ee",
"icons/icon-512-maskable.png": "1c99db99875f30231f14961d7d4ee8ff",
"icons/favicon.ico": "5811c87cc0008d10ab2a618f46fc4b04",
"icons/icon-192-maskable.png": "860626b316e91052e6224b086722f81f",
"main.dart.js_88.part.js": "c650f7475a7318012fa0801748a2ab6e",
"main.dart.js_112.part.js": "d77405af9ea53359e46feb59164d9732",
"main.dart.js_148.part.js": "c4d00db8582615c58e7e227e1cc1d6e4",
"main.dart.js_120.part.js": "fb372be29b8287062347f5ab472283ce",
"main.dart.js_76.part.js": "33b591f01d47a71ae0db7ea89398927a",
"main.dart.js_137.part.js": "314d2a05eac6729fc28bea113c377f9c",
"main.dart.js_1.part.js": "79e4db4f22ef4e93e2b1d8efca4ec786",
"manifest.json": "1cea1359fe51b46ed4f3acd405cbc3af",
"main.dart.js_87.part.js": "7e0cb02572b93a17f1124f087882085e",
"main.dart.js_63.part.js": "472ab5cc4c60fde1e8450cbca576832d",
"main.dart.js_124.part.js": "0dadb5703344aa5caf3ebeb97ce541f5",
"main.dart.js_136.part.js": "08012fc17c11891c357b643f9071701c",
"main.dart.js_106.part.js": "a840d76d2e694cf7ee162fad41e9626c",
"main.dart.js_14.part.js": "919a81576607f3feef8104e766fa4ae9",
"main.dart.js_19.part.js": "57669a3c8239a801341c6dedf9efdab6",
"main.dart.js_132.part.js": "cace3b37da7378c0fb8434f8364be7d4",
"main.dart.js_81.part.js": "0c02408555b16c674e5aeb78ebee4d34",
"main.dart.js_140.part.js": "a95990da601308ae141e69ebfe5ba788",
"main.dart.js_117.part.js": "a2ea6f8c4f571c7c45a3f1a3789014ec",
"main.dart.js_126.part.js": "a01d09095edc1800afc1e6e80d9b05b5",
"main.dart.js_100.part.js": "9ec9aa9ad0aed1159313656631e4720d",
"main.dart.js_130.part.js": "5f3eb3679c4dfac62a0dc5b28a67174a",
"main.dart.js_156.part.js": "67cb9749e608c79e89788cc4f171ea61",
"index.html": "369f4b9928f8068b9f85437b096eebed",
"/": "369f4b9928f8068b9f85437b096eebed",
"main.dart.js_35.part.js": "aa973bc85286595fcb4aea0a5901d2d2",
"main.dart.js_102.part.js": "0990c417cda1a49c8c97fa73580a14d2",
"main.dart.js_119.part.js": "23f7dcfffc420a8db6306f5636917416",
"main.dart.js_10.part.js": "8be3b685d5037585255845166ccd6bb0",
"main.dart.js_151.part.js": "09aa3466a9d9ef75efbeeb266aa9d0b6",
"main.dart.js_2.part.js": "8cd542a0d6191088a4d3e90e144f95a1",
"main.dart.js_78.part.js": "afaf299273d9176543d412adadb76627",
"main.dart.js_75.part.js": "ef3af59a5e690cb0c6b63edfe957c318",
"main.dart.js_122.part.js": "ac8a091c2822fd2c094ff724102f4e78",
"main.dart.js_134.part.js": "c2eb3623c6c1b99c72ff3fe1a86a0da6",
"main.dart.js_149.part.js": "f40441d9cbf1209ece288bae062729ec",
"main.dart.js_114.part.js": "004f3af44546055af1092720e6a30e59",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "a1fee2517bf598633e2f67fcf3e26c94",
"assets/fonts/MaterialIcons-Regular.otf": "390e3b95b92978dac11e7ff490cf96b2",
"assets/NOTICES": "40b765888235d4f90179b78e199908cb",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin": "0b0a3415aad49b6e9bf965ff578614f9",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"main.dart.js_69.part.js": "f8a578072c9d28fc264bb630d3ed0128",
"main.dart.js_60.part.js": "edb933b86de5970371428792fbdaea03",
"main.dart.js_89.part.js": "0bb24bcfc9e7630a608a53f751c58f26",
"main.dart.js_103.part.js": "63966419946d52c827c9774e21e610f6",
"messages.js": "04b7f2a9ab4b16734860359a796d2937",
"main.dart.js_144.part.js": "a6751213052843be9420316ae651ffa7",
"main.dart.js_152.part.js": "105e62a658ed5a8d90776bd4fa93e760",
"main.dart.js_141.part.js": "e6f4c46b852b979fa1bda2ee12fc52b4",
"main.dart.js_154.part.js": "f97b2aa8a2db2749b1069d01d26eb12d",
"main.dart.js_142.part.js": "776e65f1592a6f6460a9069460b2a5dc",
"main.dart.js_43.part.js": "7368da16a69286eb202e23d7c1a300ee",
"main.dart.js_131.part.js": "bc4edda612e92dfd1609d3c6d905c907",
"main.dart.js_97.part.js": "9df712410f25598e19a335358e02fcf2",
"main.dart.js_46.part.js": "0bae7ce8e06e10d056c06871cc3246ed",
"main.dart.js_158.part.js": "eeae0d308de8f39d99366b75ac916a6f",
"main.dart.js_85.part.js": "cb94637c2f526b864a832b95a8b1aa3a",
"main.dart.js_150.part.js": "ab62b4d4dd07be432cc07e6416d2b562",
"main.dart.js_128.part.js": "5b3a309001475fb4fb1c593ed2ade885",
"main.dart.js_109.part.js": "98b316024fde2ea309003b5363773f3d",
"main.dart.js_147.part.js": "cd78160e3fb281b5466b936a8d7c7ee4",
"main.dart.js_25.part.js": "a3f7ba30f327df81615d996451333ff7",
"main.dart.js_90.part.js": "2c592bae76e2d2c0e50633a590abcd94",
"main.dart.js_62.part.js": "da3f18f74daa961de1b67a7a22b0b938",
"main.dart.js_129.part.js": "7ed3b56a354225b384fc24bbe186cd60",
"main.dart.js_133.part.js": "068e917afcb6b5e448e0727368fa61d5",
"main.dart.js_24.part.js": "308216e40442f5e7046ff5bfda31362e",
"main.dart.js_145.part.js": "bb9cfd1edbb1b05053fcca5e17d287b5",
"main.dart.js_121.part.js": "4f60bab9e395749c9e2a4a8445a22951",
"main.dart.js_108.part.js": "273c9657e55a711671d8d4e7a47047ad",
"main.dart.js_12.part.js": "3f274e9fafab1c024b7471ce1b702e8d",
"main.dart.js_139.part.js": "2c28090098b0bd0df8e7d87e1b67b678",
"main.dart.js_83.part.js": "eebe9be2f97063f8e23a525ca8573daf",
"main.dart.js_111.part.js": "1a2186dc337758cc14c2911279c4c249",
"flutter_bootstrap.js": "56b90829f1df28972aa962e2f3eb2325",
"main.dart.js_9.part.js": "3c4b29810ebe0019dbc5cc3556ae354c",
"main.dart.js_26.part.js": "062bde17bbe607b91137cdac1e322292",
"main.dart.js_125.part.js": "8a4e6aa972ef4bf81e48c9b2a74e4d86",
"main.dart.js_155.part.js": "69bcfb1191ba7783bad6279462b83478",
"version.json": "260a60def41a7524c56eb9bb9b16239a",
"main.dart.js_146.part.js": "e6a1823945ce8b400270f08efe1248d0",
"main.dart.js_157.part.js": "f4df93554e3ca2426d943ff2de632de1",
"main.dart.js": "60b89ce7ae8879059794f8116715a5e6",
"main.dart.js_159.part.js": "1145735bbc6b0e44b1a9ab1daba45739",
"main.dart.js_51.part.js": "96860fa89e82e789b427b9c8144c92a2",
"main.dart.js_116.part.js": "9dbe431a0eb39c67e42e24189b2f6c38",
"main.dart.js_94.part.js": "a555373e82416f53df389468453ee6fd",
"main.dart.js_99.part.js": "99c5f583480efb76b6d169afcf64eac5",
"main.dart.js_17.part.js": "fb2439a5f30a2d3ef53c02c497bcb354",
"main.dart.js_153.part.js": "3ec962ed156c2134da00ffbad150f0dc",
"styles/styles.min.css": "475bd591ea075b76cfc1467fd0bad787",
"main.dart.js_80.part.js": "f4164c5ae0ad482c3a60e856c1d72176",
"main.dart.js_118.part.js": "397e5af1db5141ae0e991e3ca2711864"};
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
