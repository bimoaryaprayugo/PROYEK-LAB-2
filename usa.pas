program NilaiMahasiswa;

uses crt;

type
  TMahasiswa = record
    nim   : string[10];
    nama  : string[30];
    tugas : integer;
    uts   : integer;
    uas   : integer;
    na    : real;
    grade : char;
  end;

var
  mhs  : array[1..100] of TMahasiswa;
  n, i, pilih : integer;

{ ============================= }
{ Fungsi Hitung Nilai Akhir }
{ ============================= }
function HitungNA(tugas, uts, uas: integer): real;
begin
  HitungNA := (tugas * 0.3) + (uts * 0.3) + (uas * 0.4);
end;

{ ============================= }
{ Fungsi Tentukan Grade }
{ ============================= }
function TentukanGrade(na: real): char;
begin
  if na >= 93 then TentukanGrade := 'A'
  else if na >= 70 then TentukanGrade := 'B'
  else if na >= 60 then TentukanGrade := 'C'
  else if na >= 50 then TentukanGrade := 'D'
  else TentukanGrade := 'E';
end;

{ ============================= }
{ Input Data }
{ ============================= }
procedure InputData;
begin
 clrscr;
  write('Masukkan jumlah mahasiswa: ');
  readln(n);

  for i := 1 to n do
  begin
    writeln('--- Data Mahasiswa ke-', i, ' ---');
    write('NIM   : '); readln(mhs[i].nim);
    write('Nama  : '); readln(mhs[i].nama);
    write('Nilai Tugas : '); readln(mhs[i].tugas);
    write('Nilai UTS   : '); readln(mhs[i].uts);
    write('Nilai UAS   : '); readln(mhs[i].uas);

    mhs[i].na := HitungNA(mhs[i].tugas, mhs[i].uts, mhs[i].uas);
    mhs[i].grade := TentukanGrade(mhs[i].na);
  end;

  writeln('Data berhasil disimpan...');
  readln;
end;

{ ============================= }
{ Tampil Data (Tabel Kotak) }
{ ============================= }
procedure TampilData;
begin
  clrscr;
  writeln('==================================================================');
  writeln('| NIM       | Nama             | Tugas | UTS | UAS |  NA  | Grade |');
  writeln('==================================================================');

  for i := 1 to n do
  begin
    writeln('| ', mhs[i].nim:-9,
            ' | ', mhs[i].nama:-15,
            ' | ', mhs[i].tugas:5,
            ' | ', mhs[i].uts:3,
            ' | ', mhs[i].uas:3,
            ' | ', mhs[i].na:4:1,
            ' | ', mhs[i].grade:5, ' |');
  end;

  writeln('==================================================================');
  readln;
end;

{ ============================= }
{ Cari Mahasiswa + Opsi }
{ ============================= }
procedure CariMahasiswa;
var
  cariNIM : string;
  ketemu  : boolean;
  pilihan : char;
begin
  repeat
    clrscr;
    write('Masukkan NIM yang dicari: ');
    readln(cariNIM);

    ketemu := false;

    for i := 1 to n do
    begin
      if mhs[i].nim = cariNIM then
      begin
        writeln('Data Ditemukan!');
        writeln('Nama        : ', mhs[i].nama);
        writeln('Nilai Akhir : ', mhs[i].na:4:1);
        writeln('Grade       : ', mhs[i].grade);
        ketemu := true;
      end;
    end;

    if ketemu = false then
    begin
      writeln;
      writeln('Data tidak ditemukan.');
      writeln('1. Cari lagi');
      writeln('2. Kembali ke menu utama');
      write('Pilih: ');
      readln(pilihan);

      if pilihan = '2' then exit;
    end
    else
    begin
      writeln;
      writeln('Tekan ENTER untuk kembali ke menu utama...');
      readln;
      exit;
    end;

  until false;
end;

{ ============================= }
{ Menu Utama }
{ ============================= }
begin
  repeat
    clrscr;
    writeln('=== PROGRAM NILAI MAHASISWA ===');
    writeln('1. Input Data');
    writeln('2. Tampil Data');
    writeln('3. Cari Mahasiswa');
    writeln('4. Keluar');
    write('Pilih menu: ');
    readln(pilih);

    case pilih of
      1: InputData;
      2: TampilData;
      3: CariMahasiswa;
    end;

  until pilih = 4;
end.