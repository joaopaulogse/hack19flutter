var functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const request = require('request-promise');
const _ = require('lodash');

// List of output languages.
const LANGUAGES = ['en', 'es', 'fr', 'ar', 'pt'];


exports.translate = functions.database.ref('/rooms/{roomId}/messages/{messageId}/message/{language}').onWrite((event, context) => {
  const snapshot = event.after;

  const promises = [];

  const { roomId, messageId, language } = context.params;

  if (!event.before.exists()) {
    _.each(LANGUAGES, (lang) => {
      if (lang !== language) {
        promises.push(createTranslationPromise(lang, snapshot, roomId, messageId));
      }
   })
  }

  return Promise.all(promises)

});


// URL to the Google Translate API.
function createTranslateUrl(lang, text) {
  return `https://www.googleapis.com/language/translate/v2?key=AIzaSyAFd14dHpUFOFzAl19fpll8EGvt9HJhLC4&target=${lang}&q=${text}`;
}

function createTranslationPromise(lang, snapshot, roomId, messageId) {
  const text = snapshot.val();

  let translation = {};

  if (!text.hasOwnProperty(lang)) {
    return request(createTranslateUrl(lang, text), {resolveWithFullResponse: true}).then(
      response => {
        if (response.statusCode === 200) {
          const resData = JSON.parse(response.body).data;

          translation[lang] = resData.translations[0].translatedText;

          return admin.database().ref(`/rooms/${roomId}/messages/${messageId}/message`)
              .update(translation);
        }
        else {
          throw response.body;
        }
      });
  }

  return null;
}