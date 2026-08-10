// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyC-blc_cnLHRLgY97oD-aQsj2j-Y7vOEdY",
  authDomain: "yuopni-app-create-79e68.firebaseapp.com",
  projectId: "yuopni-app-create-79e68",
  storageBucket: "yuopni-app-create-79e68.firebasestorage.app",
  messagingSenderId: "539912340957",
  appId: "1:539912340957:web:ecb0dbd123f4c48608a234",
  measurementId: "G-5CM0D7SSE8"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);