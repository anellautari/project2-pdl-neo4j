# Project 2 - Eksplorasi DBMS NoSQL Graph Database Neo4j

## Deskripsi

Repository ini berisi implementasi eksplorasi **Graph Database Neo4j** pada studi kasus **Jaringan Riset Akademik** untuk mata kuliah IF4040 Pemodelan Data Lanjut.
Studi kasus ini memodelkan hubungan antar entitas dalam ekosistem publikasi ilmiah, seperti hubungan antara peneliti, institusi, paper, topik penelitian, dan konferensi.
Selain implementasi menggunakan Neo4j, dilakukan juga perbandingan dengan **Relational Database Management System (RDBMS) PostgreSQL** dari sisi pemodelan data dan performa query.

---

## Studi Kasus

### Node
- Researcher
- Institution
- Paper
- Topic
- Conference

### Relationship
- AFFILIATED_WITH
- AUTHORED
- PUBLISHED_IN
- COVERS
- CITES

---

## Struktur Repository

```
project2-pdl-neo4j
│
├── data    
├── diagram
├── query_cypher
├── query_sql
├── seed
└── README.md
```

### data
Berisi dataset CSV yang digunakan untuk proses import database.

### diagram
Berisi:
- Graph diagram Neo4j
- ERD
- Relational diagram PostgreSQL

### query_cypher
Berisi query Neo4j menggunakan Cypher:
- dml
- read

### query_sql
Berisi query PostgreSQL sebagai pembanding:
- dml
- read

### seed
Berisi proses pembuatan dan import data:
- generate_data.py
- constraint.cypher
- import_node.cypher
- import_relationship.cypher
- postgres_seed.sql

---

## Cara Menjalankan

### 1. Generate Dataset

Sebelum melakukan import database, jalankan generator data terlebih dahulu.

Masuk ke folder seed:

```
cd seed
```

Jalankan:

```
python generate_data.py
```

File ini akan menghasilkan dataset CSV yang digunakan pada proses seed database.

---

## Implementasi PostgreSQL

### 2. Import Database PostgreSQL

Pastikan PostgreSQL sudah aktif dan database sudah dibuat.

Jalankan perintah berikut pada terminal:

```
psql -U username -d nama_database -f path/postgres_seed.sql
```

Contoh:

```
psql -U postgres -d jurnalakademik -f seed/postgres_seed.sql
```

File `postgres_seed.sql` akan membuat tabel, constraint, dan melakukan import data dari CSV.

---

## Implementasi Neo4j AuraDB

### 3. Import Constraint

Masuk ke Neo4j AuraDB, kemudian jalankan query pada file:

```
seed/constraint.cypher
```

### 4. Import Node

Jalankan query pada file:

```
seed/import_node.cypher
```

Query ini akan membuat seluruh node:
- Researcher
- Institution
- Paper
- Topic
- Conference

### 5. Import Relationship

Jalankan query pada file:

```
seed/import_relationship.cypher
```

Query ini akan membuat relationship:
- AFFILIATED_WITH
- AUTHORED
- PUBLISHED_IN
- COVERS
- CITES

Setiap file Cypher dijalankan satu per satu pada Neo4j AuraDB.

---

## Menjalankan Query

### Neo4j

Query Cypher pada folder:

```
query_cypher/
```

dapat langsung dijalankan pada Neo4j AuraDB dengan cara membuka file query kemudian melakukan copy-paste query ke editor Cypher dan menjalankannya.

---

### PostgreSQL

Query SQL pada folder:

```
query_sql/
```

dapat dijalankan melalui terminal PostgreSQL atau SQL editor.

Contoh:

```
psql -U username -d nama_database
```

Kemudian copy-paste query SQL dan jalankan.

---

## Dataset

Dataset dibuat menggunakan Python Faker untuk menghasilkan data sintetis.
Dataset digunakan untuk membandingkan performa query antara Neo4j dan PostgreSQL.

---

## Tools

- Neo4j AuraDB
- PostgreSQL
- Python Faker
- Cypher Query Language
- SQL
- GitHub

---

## Author

| Nama | NIM |
|---|---|
| Anella Utari Gunadi | 13523078 |
