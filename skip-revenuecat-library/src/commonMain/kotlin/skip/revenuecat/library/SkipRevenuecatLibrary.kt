package skip.revenuecat.library

object Singleton {
    fun stringFunction(): String {
        return "Hello"
    }
}

/**
 * A basic Kotlin class that will be exposed to Objective-C via KMP.
 */
class SampleClass(var stringField: String, var intField: Int, val doubleField: Double) {
    /**
     * Adds the intField and doubleField together.
     */
    fun addNumbers() : Double {
        return intField + doubleField
    }

    /**
     * Throws an Exception, always.
     */
    @Throws(Exception::class)
    fun throwingFunction() {
        throw Exception("This function always throws")
    }
}
