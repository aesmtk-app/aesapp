importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: 'AIzaSyA62woIwGhUHn282wIi2B1-yclGLY_LzeU',
  appId: '1:590479197727:web:8395586d20b6bc9372b72a',
  messagingSenderId: '590479197727',
  projectId: 'aesmtk-app-test',
  authDomain: 'aesmtk-app-test.firebaseapp.com',
  storageBucket: 'aesmtk-app-test.appspot.com',
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
