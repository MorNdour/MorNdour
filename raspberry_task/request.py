import firebase_admin
from firebase_admin import credentials,firestore
import datetime

cred = credentials.Certificate("path/to/serviceAccountKey.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

#firebase = firebase.FirebaseApplication('', None)


def create():
    today = datetime.datetime.now()
    db.collection('historique').add(
      {
        'temperature': '30',
        'humidite':'45%',
        'image': 'index.png',
        'resultatTest':'health'
      }
    )

create()
