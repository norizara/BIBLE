package DOCMANAGE;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    private static final double MAX_STORAGE = 1024.0;
    private static double usedStorage = 0;
    private static ArrayList<Document> documents = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.in);


    public static void clearScreen(){
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
    public static void main(String[] args) {
        while (true) {
            clearScreen();
            System.out.println("\n=== Hov Document Management ===");
            System.out.println("1. Register New Document");
            System.out.println("2. View All Documents");
            System.out.println("3. Change Document Status to Approved");
            System.out.println("4. Exit");
            System.out.println("Storage tersedia: " + (MAX_STORAGE - usedStorage) + " MB");
            System.out.print("Pilih menu: ");
            
            int choice = 0;
            choice = scanner.nextInt();
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    registerNewDocument();
                    break;
                case 2:
                    viewAllDocuments();
                    break;
                case 3:
                    changeDocumentStatus();
                    break;
                case 4:
                    System.out.println("Terima kasih telah menggunakan aplikasi.");
                    return;
                default:
                    System.out.println("Pilihan tidak valid, coba lagi.");
            }
        }
    }

    private static void registerNewDocument() {
        System.out.print("Masukkan nama dokumen: ");
        String name = scanner.nextLine();
        Integer currentStorage = (int) (MAX_STORAGE - usedStorage);
        System.out.print("Masukkan ukuran dokumen (1-"+ currentStorage +"): ");
        double size = getValidDoubleInput();

        if (size > (MAX_STORAGE - usedStorage)) {
            System.out.println("Gagal menambahkan dokumen. Storage penuh!");
            return;
        }

        Document newDoc = new Document(name, size);
        documents.add(newDoc);
        usedStorage += size;
        System.out.println("Dokumen berhasil ditambahkan!");
    }

    private static void viewAllDocuments() {
        if (documents.isEmpty()) {
            System.out.println("Tidak ada dokumen terdaftar.");
            return;
        }
        System.out.println("\n=== Daftar Dokumen ===");
        for (Document doc : documents) {
            System.out.println(doc);
        }
        System.out.println("Tekan enter untuk melanjutkan...");
        scanner.nextLine();
    }

    private static void changeDocumentStatus() {
        if (documents.isEmpty()) {
            System.out.println("Tidak ada dokumen terdaftar.");
            return;
        }
        viewAllDocuments();
        System.out.print("Masukkan nama dokumen yang ingin diubah statusnya: ");
        String name = scanner.next();
        
        for (Document doc : documents) {
            if (doc.getName().equalsIgnoreCase(name)) {
                doc.setStatus("Approved");
                System.out.println("Status dokumen berhasil diubah menjadi Approved.");
                return;
            }
        }
        System.out.println("Dokumen tidak ditemukan.");
    }

    private static double getValidDoubleInput() {
        while (!scanner.hasNextDouble()) {
            System.out.println("Input tidak valid. Masukkan angka yang benar!");
            scanner.next();
        }
        return scanner.nextDouble();
    }
}
