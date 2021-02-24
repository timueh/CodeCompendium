class TwoFer {

    static String twoFer(String name = "you") {
        if (name.isEmpty()) {
            name = "you"
        }
        return "One for $name, one for me."
    }

    // just for double-checkingbr
    public static void main(String[] args) {
        print new TwoFer().twoFer("Alice")
        print new TwoFer().twoFer()
        print new TwoFer().twoFer("")
    }
}