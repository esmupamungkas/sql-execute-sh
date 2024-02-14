<h3 align="center">
<em>"With everyone's super. No one will be."</em><br>
-- Syndrome (The Incredibles)
</h3>

## Overview

### # About Project
This project was made to run an SQL query on cronjob automatically with retries on failed execution and logging.

- Currently supports MySQL or MariaDB.
- Log any success or failed attempt.
- Logging includes query output and timestamp based on inserted timezone.
- Checking on existing log folder and file, create if they don't exists.

*Ideally this script was used for cronjob, but you can use it to execute query manually right from the server.*

### # Running Script
Clone or copy bash script in this repository to your desired location and set as executable :
```bash
chmod +x /your/desired/location/execute-query.sh
```
Run the script manually by inserting timezone for log timestamp (I'm using my local timezone) :
```bash
execute-query.sh Asia/Jakarta
```
Or set a cronjob to run this script automatically (eg. daily on midnight in my local timezone) :
```bash
0 0 * * * /your/desired/location/execute-query.sh Asia/Jakarta
```

<br>
<h1 align="center"> Me no speak Americano? </h1>

### # Tentang Proyek
Proyek ini dibuat untuk menjalankan SQL query dengan cronjob secara otomatis dengan pengulagan jika eksekusi gagal dan log.

- Saat ini hanya mendukung MySQL atau MariaDB.
- Log semua eksekusi yang berhasil atau gagal.
- Log menyertakan output query dan waktu berdasarkan timezone yang dimasukkan.
- Pengecekan pada folder dan file log jika ada, buat baru jika belum ada..

*Idealnya script ini digunakan untuk cronjob, tapi bisa digunakan untuk melakukan eksekusi query manual di server.*

### # Menjalankan Script
Clone atau salin bash script pada repository ini ke lokasi yang diinginkan dan set sebagai executable :
```bash
chmod +x /your/desired/location/execute-query.sh
```
Jalankan script secara manual dengan menambahkan timezone untuk waktu log (contoh menggunakan timezone lokal saya) :
```bash
execute-query.sh Asia/Jakarta
```
Atau buat cronjob untuk menjalankan script ini secara otomatis (contoh setiap tengah malam pada timezone lokal saya) :
```bash
0 0 * * * /your/desired/location/execute-query.sh Asia/Jakarta
```