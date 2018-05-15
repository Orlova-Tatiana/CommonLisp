# Visp (Vector Lisp)

Макрос языка _Common Lisp_, позволяющий работать со списками в "облегченном" удобочитабельном варианте. Слово _Vector_
в названии языка выбрано, так как в первую очередь он вредназначен для работы с
[векторными](https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BA%D1%82%D0%BE%D1%80)
операциями. Однако, способен производить любые операции со списками.

### Синтаксис

```common-lisp
(=>
  тело
)
```

Любая цепочка векторных преобразований начинается с `=>`, все дальнейшие примеры работают только в пределах этой конструкции.

```common-lisp
(1 2 3) + (3 4 5)
```

Язык поэлементно применит операцию `+` к элементам на одинаковых позициях и вернет вектор `(4 6 8)`.
Это пример __бинарной операции__ между векторами. Не существует списка разрешенных операций,
подойдет любая функция от друх аргументов.
Чтобы избежать непредвиденного поведения, вектора должны быть одинаковой длины.

Так как операция вернула вектор, можно продолжать цепочку вычислений:
```common-lisp
(1 2 3) + (3 4 5) * (1 2 3)
```
Вернет `(4 12 24)`.

Следующий вид операций – __аккумулирующие__.
```common-lisp
(3 4 5) -> +
```
Такая операция сложит все числа в векторе и вернет `12`. При чем опять же, можно использовать любую бинарную операцию. Вот пример,
как это можно удобно и креативно использовать для переворачивания вектора:

```common-lisp
(defun revert (acc x)
	(if (listp acc)
		(cons x acc)
		(list acc x)
	)
)

(=> (1 2 3 4 5) -> revert)
```

Не смотря на то, что операция `(3 4 5) -> +` вернула число, это не значит, что цепочка оборвана! Язык так же хорошо работает и с числами!
```common-lisp
3 + 4 * 5
```

При этом, чтобы числа и вектора уживались вместе в одном выражении, при встрече такой конструкции
```common-lisp
(1 2 3) + 5
```
число `5` преобразуется в вектор `(5 5 5). Это очень удобно для векторных вычислений, и вот напирмер как:
```common-lisp
(2 4 4) expt 2
```
Этот код возведет каждый элемент вектора в квадрад.

Последний тип оперций __применяющие__. На вход принимают вектор целиком. Самый распространенный метод применения для вывода
результатов вычислений:

```common-lisp
(1 2 3) => print
```

```common-lisp
(1 2 3) => cdr => print ; (1 2)
```

### Ключевые слова

Может возникнуть желание использовать текущее значение выражения для вычислений. Например, возвести вектор в квадрат (забудем про
`expt 2`. Для дублирования текущего значения используется ключевое клово `self`. Пример:

```common-lisp
(2 4 4) * self
```

вернет все тот же квадрат вектора.

### Подключение

Чтобы использовать данный язык нужно положить
[файл языка](https://github.com/Orlova-Tatiana/CommonLisp/blob/master/language/lang.lisp)
в папку своего проекта и подключать через
```common-lisp
(require "путь_к_файлу")
```

### Применение

Больше примеро можно найти по [ссылке](https://github.com/Orlova-Tatiana/CommonLisp/blob/master/language/lang.lisp).

### Послесловие

В итоге получился очень удобный для списочных вычислений язык, который, несмотря на то, что затачивался под математические
векторные исчисления, очень свободно оперирует списками (как это было показано с примером переворота вектора).