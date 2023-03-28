// BSLLS:FunctionShouldHaveReturn-off

// Проверяет что есть следующий элемент коллекции
//
//  Возвращаемое значение:
//   Булево - Истина, если есть следующий элемент коллекции
//
Функция ЕстьСледующий() Экспорт
КонецФункции

// Возвращает следующий элемент коллекции
//
//  Возвращаемое значение:
//   Произвольный - следующий элемент коллекции
//
Функция Следующий() Экспорт
КонецФункции

// Выполняет переданный алгоритм для каждого элемента коллекции
//  начиная с того на который указывает итератор
//
// Параметры:
//   Действие - Действие - Делегат на процедуру с одним параметром
//    которая принимает элемент коллекции
//            - Строка - Лямбда выражение с одним параметром
//    которая принимает элемент коллекции
//
// Пример:
//    Итератор.ДляКаждогоОставшегося(Элемент -> Сообщить(Элемент));
//
Процедура ДляКаждогоОставшегося(Действие) Экспорт
КонецПроцедуры

&Интерфейс
Процедура ПриСозданииОбъекта()
	ВызватьИсключение "Нельзя создать экземпляр интерфейса";
КонецПроцедуры
