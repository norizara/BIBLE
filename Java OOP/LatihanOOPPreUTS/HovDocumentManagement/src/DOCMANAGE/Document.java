package DOCMANAGE;
 
class Document {
    private String name;
    private double size; // in MB
    private String status;

    public Document(String name, double size){
        this.name = name;
        this.size = size;
        this.status = "Draft";
    }

    public String getName() {
        return name;
    }

    public double getSize() {
        return size;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Nama: " + name + ", Ukuran: " + size + " MB, Status: " + status;
    }
}
