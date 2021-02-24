class Isogram {
    static boolean isIsogram(String phrase) {
        // pre-processing
        def charsToReplace = [" ", "-"]
        charsToReplace.each {
            phrase = phrase.replace(it,"")
        }
        // check for isogram
        return phrase.size() == phrase.toLowerCase().toSet().size()
    }

    public static void main(String[] args) {
        def testWords = ["isogram", "isograms", "iso-grams"]
        def iso = new Isogram()
        testWords.each {
            println iso.isIsogram(it)
        }
    }
}