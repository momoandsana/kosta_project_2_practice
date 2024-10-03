public class PriceHistoryDTO {
    private String date;
    private int price;

    public PriceHistoryDTO(String date, int price) {
        this.date = date;
        this.price = price;
    }

    // Getters and Setters
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
