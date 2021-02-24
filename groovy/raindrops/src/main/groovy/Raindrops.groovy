class Raindrops {

    def convert(num) {
        def map = [3: 'Pling', 5: 'Plang', 7: 'Plong']
        def res = ""
        map.each { divisor, sound ->
            if (num % divisor == 0) {
                res += sound
            }
        }
        if (res.isEmpty()) {
            res = num.toString()
        }
        return res
    }

    public static void main(String[] args) {
        def raindrop = new Raindrops()
        // do some tests
        def nums = [1, 3, 5, 15, 105]
        nums.each { entry ->
            println raindrop.convert(entry)
        }   
    }
}