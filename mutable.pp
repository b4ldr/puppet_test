class classtest1 ($classfoobar) {
    inline_template('<% @classfoobar.each {|i| i.upcase! } %>')
    notice($classfoobar)
}
class classtest2 ($classfoobar) {
    inline_template('<% @classfoobar.each {|i| i.upcase! } %>')
    notice($classfoobar)
}
class classtest3 ($classfoobar = ['foo', 'bar']) {
    inline_template('<% @classfoobar.each {|i| i.upcase! } %>')
    notice($classfoobar)
}
define test ($classfoobar) {
    inline_template('<% @classfoobar.each {|i| i.upcase! } %>')
    notice($classfoobar)
}
$foo = "foobar"
inline_template('<% @foo.upcase! %>')
notice($foo)

$bar = [$foo]
notice($bar)

inline_template('<% @bar.each {|i| i.downcase! } %>')
notice($bar)

inline_template('<% @bar << "stuff"  %>')
notice($bar)

$foobar = ['foo', 'bar']
class{'classtest1': classfoobar => ['foo', 'bar'] }
class{'classtest2': classfoobar => $foobar }
include classtest3


# The following fail with: "can't modify frozen String"
test{'test1': classfoobar => $foobar }
inline_template('<% @foobar.each {|i| i.upcase! } %>')
notice($foobar)
