'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js_17.part.js": "50c7c798f3cca8470309b24b86f1f8f4",
"main.dart.js_51.part.js": "e4ee92e5f65718b0f4b03ee80af67c25",
"main.dart.js_152.part.js": "39a33aa3df7578005f93740d0890e8c3",
"main.dart.js_124.part.js": "379b6989b028e48b465456ddb93a2f58",
"main.dart.js_140.part.js": "3dad392d34e1863b49fa81599149d224",
"main.dart.js_134.part.js": "fd52ecf86ba4252553096f45dab004c1",
"main.dart.js_118.part.js": "f4b83f20ac97701bfe524060fb270cd9",
"main.dart.js_158.part.js": "da5fad197e53050f982d2d2c772bbc7a",
"main.dart.js_112.part.js": "0cc5d35b4a74f1383ebf9488e9e51780",
"main.dart.js_89.part.js": "36ecaa5670f9aec97dc794b3f0b4c853",
"main.dart.js_9.part.js": "72abb642de63c716efd99ded361b50ba",
"main.dart.js_76.part.js": "e4cb3931a8491647adf537986b2bec3f",
"main.dart.js_145.part.js": "90ec447eb3431b722633f5b41c4205d5",
"main.dart.js_155.part.js": "5c0c011064e4a36024c292c48253168c",
"main.dart.js_136.part.js": "4ece116f856262225a7b27afaa0625a3",
"main.dart.js_149.part.js": "15a22bea5f64b5e660b9a4b6cc7be33b",
"flutter_bootstrap.js": "56b90829f1df28972aa962e2f3eb2325",
"main.dart.js_19.part.js": "c4c1f7f826f21da7186a5e4d76efa107",
"main.dart.js_148.part.js": "1de534eea45eb2d06f8e258d12608498",
"main.dart.js_81.part.js": "58ad9968b6b6fafa2407574ac9293898",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"main.dart.js_130.part.js": "12ae7205c72c91ab7eba8ce0391bd10a",
"styles/styles.min.css": "475bd591ea075b76cfc1467fd0bad787",
"main.dart.js_103.part.js": "1e980bf5ce5171c9ff847cc6a7834a52",
"main.dart.js_142.part.js": "1eeaefe3aa6926f9be4efc463ffc091a",
"main.dart.js_10.part.js": "bb7427eac033c81537d9db11decde1db",
"main.dart.js_129.part.js": "a895a659db826a1ae639bdd71881faee",
"main.dart.js_99.part.js": "e0448fa1c7e218b48baf5d522e4682de",
"main.dart.js_94.part.js": "bebd9357598e0b3e2502e620aef8a103",
"main.dart.js_133.part.js": "12d12d5da79c7cfdf712a463fd0a7cfd",
"main.dart.js_35.part.js": "adfcf731ad04d8ffd3ff93d66b97d8ec",
"icons/icon-192-maskable.png": "860626b316e91052e6224b086722f81f",
"icons/apple-touch-icon.png": "e2cfa565ad61d71bf686b19ee2f050ee",
"icons/favicon.ico": "5811c87cc0008d10ab2a618f46fc4b04",
"icons/Icon-512.png": "3a2749aebf735c07df2da06d737c296d",
"icons/icon-512-maskable.png": "1c99db99875f30231f14961d7d4ee8ff",
"icons/Icon-192.png": "1a62cb3549d9d82cb54cd66482e4ffcc",
"manifest.json": "1cea1359fe51b46ed4f3acd405cbc3af",
"main.dart.js_60.part.js": "679a4ae2702d7c4a20197b1a5c116c1d",
"main.dart.js_78.part.js": "cb5981af0b08a8acfe985fb759956e17",
"main.dart.js_102.part.js": "4f880e9d5741cf478483f7d656683a48",
"main.dart.js_106.part.js": "8abd4ba94d0d7d97996113572148eabf",
"main.dart.js_85.part.js": "4ea9240469b147003b0e38a9b03f1d71",
"main.dart.js_62.part.js": "8ec4f0b468c5d3585125999aaa210de4",
"main.dart.js_24.part.js": "b9f30398223a6bcbcc9301088d68d3fe",
"main.dart.js_141.part.js": "0bfbbda345e2cc13ad31acd4768531d3",
"messages.js": "04b7f2a9ab4b16734860359a796d2937",
"main.dart.js_151.part.js": "f5493964b7d5217195a4ad85d2ff2143",
"main.dart.js_153.part.js": "8656c387a0696f4e4686d70404cbd089",
"main.dart.js_117.part.js": "9b1d5bbea213c389b2ed98a0b6460536",
"main.dart.js_2.part.js": "0a750d79803eadd8cc85454328f138da",
"main.dart.js_109.part.js": "fc4002d3a57686e68c8c55975d0abfe3",
"main.dart.js_131.part.js": "677fa36fb58c48b60a3d15fd663f6318",
"main.dart.js_97.part.js": "86bbbae9ba8ac569397d01186103d924",
"version.json": "260a60def41a7524c56eb9bb9b16239a",
"main.dart.js_126.part.js": "8296d15b274dfa5e95cd13240b3a9f64",
"main.dart.js_132.part.js": "8a55fd2a43fa7e53b181afaeee35741d",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"main.dart.js_154.part.js": "9281ada6fc89f0e008d490bcc8d4501a",
"main.dart.js_80.part.js": "462f7cf324220e735aba930f5352d30d",
"main.dart.js_147.part.js": "50a91d56b33094c1b099169084903864",
"main.dart.js_63.part.js": "0f80afd5581e78f6d7f3ed48bb7f0dad",
"main.dart.js_83.part.js": "6e801b000df20a1a30ecad00ecd09da8",
"main.dart.js_90.part.js": "2fae5abe62437dcf9a9ac95a393fd329",
"main.dart.js_125.part.js": "9343df807556454f903622cee3de64d6",
"main.dart.js_1.part.js": "143796f91a3ee8bb6e7b82e84b50088f",
"main.dart.js_87.part.js": "9e8cafb37b8173f416a568ea7729d772",
"main.dart.js_122.part.js": "aafdacbe5a265242a7e2df546ec8d70c",
"main.dart.js_46.part.js": "b002dbfc2240304f59dac54d79f658c7",
"main.dart.js_137.part.js": "399632136b283004e41bee2950840659",
"main.dart.js_69.part.js": "c2372c57eaab2228deb6a002afdcc43c",
"main.dart.js_25.part.js": "0d0c839a4aaf77d761143ce4184e8ab2",
"main.dart.js_159.part.js": "aef60794765718085503da8c1aeacf6d",
"main.dart.js_114.part.js": "56c2bdc1325cb6b649c73ff9b419e27c",
"main.dart.js_150.part.js": "6e374fe5cd141ffba840069daa0bc364",
"main.dart.js_120.part.js": "8b75581a86ad7ea70af0ac1a1d069084",
"main.dart.js": "d941b028da7e3bc8516e192c19d270b1",
"main.dart.js_111.part.js": "451b3b4f6fab2ab345f6375a4f0f11b3",
"main.dart.js_156.part.js": "0253a38fd03c0047305428a5974c7d71",
"main.dart.js_43.part.js": "4c464c5c0672b9e7692427003a5b2002",
"main.dart.js_144.part.js": "574243b1394d2c51e15bad34148e257b",
"main.dart.js_88.part.js": "bf1a644c8f9a819f5c3b98062750463c",
"main.dart.js_119.part.js": "0325031fa6ac7b0d5c3ed72ef349999a",
"main.dart.js_113.part.js": "9c1c85c504da30020fce06566f4899f7",
"main.dart.js_128.part.js": "1e6cc500011a08f813ffeb9116a9ca19",
"main.dart.js_116.part.js": "c00c447d7dca8d6554be2ecce66da651",
"main.dart.js_146.part.js": "54163dcc5a028ced58e7a7cf9546bebf",
"main.dart.js_139.part.js": "6b662af9416c3d3ed1510b87ac05afb3",
"main.dart.js_100.part.js": "4302c780b8dcfb85cbf7a4631d0bf4eb",
"main.dart.js_157.part.js": "0662795608024bb59918fe998b55e0a8",
"main.dart.js_26.part.js": "081dfe902c816514677b69184287f8d1",
"index.html": "369f4b9928f8068b9f85437b096eebed",
"/": "369f4b9928f8068b9f85437b096eebed",
"main.dart.js_14.part.js": "09c1bc5a156aa947a049850e8e0f957d",
"main.dart.js_108.part.js": "1a4db8ae812628d1aa67c2d2f00cfae4",
"main.dart.js_121.part.js": "a3a24deb180a28b2cc4e0186e012de04",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "7932ebe05caf7c90634b1bfd84ad5b25",
"assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/AssetManifest.bin": "0b0a3415aad49b6e9bf965ff578614f9",
"assets/AssetManifest.bin.json": "a1fee2517bf598633e2f67fcf3e26c94",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "390e3b95b92978dac11e7ff490cf96b2",
"main.dart.js_12.part.js": "46e5fe8035d8ad23ddf44c20dc74d811",
"main.dart.js_75.part.js": "7d3e8c87b6dc560d808368783f5b62d7"};
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
