## YTD101 - YoutubeDownloadBashScript

### Λόγοι δημιουργίας

Έχετε βαρεθεί να ψάχνετε για online μετατροπές youtube URL σε mp3 αρχεία; 

Χρησιμοποιείτε Linux; 

Αν και οι δύο απαντήσεις σας είναι ναι τότε αυτό το script θα σας λύσει τα χέρια από περιττές αναζητήσεις. 

### Προαπαιτούμενα

1. Linux σύστημα
2. youtube-dl command

Σε Debian/Ubuntu : ```sudo apt-get install youtube-dl```

Σε περίπτωση που υπάρχει ασυμβατότητα του youtube-dl στο σύστημα σας μπορείτε να εγκαταστήσετε το πακέτο μέσω του python-pip

``` sudo apt-get install python-pip```
``` sudo pip install youtube-dl```

Σε Arch : ```sudo pacman -S youtube-dl```

### Πρόσθετες Πληροφορίες

1. Το script δουλεύει με την παρακάτω μορφή.
   ```./ytd.sh format url

2. Προσθήκη αρχείου destination. Στο συγκεκριμένο αρχείο προσθέτουμε την διαδρομή του καταλόγου που θέλουμε να αποθηκεύονται τα αρχεία(Μην το διαγράψετε πρέπει να βρίσκεται στον ίδιο φάκελο με το script).

3. Format επιλογές:

   --mp3: Μετατρέπει τα youtube url σε mp3 μορφή. Αποθηκεύεται το thumbnail στο αρχείο του τραγουδιού

   --mp4: Μετατρέπει τα youtube url σε mp3 μορφή. Αποθηκεύεται το thumbnail στο αρχείο του τραγουδιού

   


