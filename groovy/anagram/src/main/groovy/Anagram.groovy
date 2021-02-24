class Anagram {
    private String word

    Anagram(String word) {
        this.word = word
    }

    // private helper methods
    private String sort(String word) {
        return word.toLowerCase().toList().sort()
    }

    private String lower(String word) {
        return word.toLowerCase()
    }

    // relevant method
    List<String> find(List<String> candidates) {
        def toReturn = []
        candidates.each { candidate ->
            if (sort(candidate) == sort(word) && lower(candidate) != lower(word)) {
                toReturn.add(candidate)
            }
        }
        return toReturn
    }

    public static void main(String[] args) {
        def ana = new Anagram('good')
        println ana.find(['dog', 'goody', 'odog'])
    }
}