CREATE TABLE  "JENIS" 
   (	"ID_JENIS" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"JENIS_KAMAR" VARCHAR2(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"HARGA" NUMBER(10,2) NOT NULL ENABLE, 
	 CONSTRAINT "JENIS_PK" PRIMARY KEY ("ID_JENIS")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "KAMAR" 
   (	"ID_KAMAR" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"LANTAI" VARCHAR2(10 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"JENIS_ID_JENIS" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "KAMAR_PK" PRIMARY KEY ("ID_KAMAR")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "CUSTOMER" 
   (	"ID_CUSTOMER" VARCHAR2(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NAMA_CUSTOMER" VARCHAR2(35) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"ALAMAT_CUSTOMER" CLOB COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOTELP_CUSTOMER" NUMBER(15,0), 
	"RESERVASI_ID_RESERVASI" VARCHAR2(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("ID_CUSTOMER")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "KARYAWAN" 
   (	"ID_KARYAWAN" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NAMA_KARYAWAN" VARCHAR2(20 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"ALAMAT_KARYAWAN" CLOB COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"JABATAN" VARCHAR2(15 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "KARYAWAN_PK" PRIMARY KEY ("ID_KARYAWAN")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "RESERVASI" 
   (	"ID_RESERVASI" VARCHAR2(8 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"TGL_CHECKIN" DATE NOT NULL ENABLE, 
	"TGL_CHECKOUT" DATE NOT NULL ENABLE, 
	"CUSTOMER_ID_CUSTOMER" VARCHAR2(8 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"KARYAWAN_ID_KARYAWAN" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP", 
	"KAMAR_ID_KAMAR" VARCHAR2(5 CHAR) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	 CONSTRAINT "RESERVASI_PK" PRIMARY KEY ("ID_RESERVASI")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
ALTER TABLE  "KAMAR" ADD CONSTRAINT "KAMAR_JENIS_FK" FOREIGN KEY ("JENIS_ID_JENIS")
	  REFERENCES  "JENIS" ("ID_JENIS") ENABLE
/
ALTER TABLE  "RESERVASI" ADD CONSTRAINT "RESERVASI_CUSTOMER_FK" FOREIGN KEY ("CUSTOMER_ID_CUSTOMER")
	  REFERENCES  "CUSTOMER" ("ID_CUSTOMER") ENABLE
/
ALTER TABLE  "RESERVASI" ADD CONSTRAINT "RESERVASI_KAMAR_FK" FOREIGN KEY ("KAMAR_ID_KAMAR")
	  REFERENCES  "KAMAR" ("ID_KAMAR") ENABLE
/
ALTER TABLE  "RESERVASI" ADD CONSTRAINT "RESERVASI_KARYAWAN_FK" FOREIGN KEY ("KARYAWAN_ID_KARYAWAN")
	  REFERENCES  "KARYAWAN" ("ID_KARYAWAN") ENABLE
/
CREATE UNIQUE INDEX  "CUSTOMER__IDX" ON  "CUSTOMER" ("RESERVASI_ID_RESERVASI")
/
CREATE UNIQUE INDEX  "RESERVASI__IDX" ON  "RESERVASI" ("CUSTOMER_ID_CUSTOMER")
/
