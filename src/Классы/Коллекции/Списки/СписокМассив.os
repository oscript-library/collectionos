#Использовать fluent

#Использовать "../../../internal"

Перем Массив;        // Внутренний массив
Перем ЕстьИтераторы; // Признак того что из списка были созданы итераторы

Функция Итератор() Экспорт

	ЕстьИтераторы = Истина;

	Возврат Новый СписокИтераторМассив(Массив, ЭтотОбъект);

КонецФункции

Процедура ДляКаждого(Знач Алгоритм) Экспорт

	Если ТипЗнч(Алгоритм) = Тип("Строка") Тогда
		Алгоритм = Лямбда.Выражение(Алгоритм)
			.Интерфейс(ФункциональныеИнтерфейсы.УниПроцедура())
			.ВДействие();
	КонецЕсли;

	Для Каждого Элемент Из Массив Цикл
		Алгоритм.Выполнить(Элемент);
	КонецЦикла;

КонецПроцедуры

Функция Содержит(Элемент) Экспорт
	Возврат Индекс(Элемент) <> -1;
КонецФункции

Функция СодержитВсе(Коллекция) Экспорт

	Результат = Истина;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Не Содержит(Итератор.Следующий()) Тогда
			Результат = Ложь;
			Прервать;
		КонецЕсли;

	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция Пусто() Экспорт
	Возврат Количество() = 0;
КонецФункции

Функция ПроцессорКоллекции() Экспорт
	Возврат ПроцессорыКоллекций.ИзКоллекции(ВМассив());
КонецФункции

Функция Количество() Экспорт
	Возврат Массив.Количество();
КонецФункции

Функция Получить(Индекс) Экспорт
	Возврат Массив.Получить(Индекс);
КонецФункции

Функция Индекс(Элемент) Экспорт

	Результат = Массив.Найти(Элемент);

	Если Результат = Неопределено Тогда
		Результат = -1;
	КонецЕсли;

	Возврат Результат;

КонецФункции

Функция ПоследнийИндекс(Элемент) Экспорт
	
	Индекс = ВГраница();

	Пока Индекс >= 0 Цикл

		Если Получить(Индекс) = Элемент Тогда
			Возврат Индекс;
		КонецЕсли;

		Индекс = Индекс - 1;

	КонецЦикла;

	Возврат -1;

КонецФункции

Функция ВГраница() Экспорт
	Возврат Массив.ВГраница();
КонецФункции

Функция ВМассив() Экспорт
	Возврат Массивы.Скопировать(Массив);
КонецФункции

Функция Добавить(Элемент) Экспорт

	Массив.Добавить(Элемент);

	ОповеститьОбИзмененииКоллекции();

	Возврат Истина;

КонецФункции

Функция ДобавитьВсе(Коллекция) Экспорт

	БылДобавленХотяБыОдинЭлемент = Ложь;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		БылДобавленХотяБыОдинЭлемент = Добавить(Итератор.Следующий())
			Или БылДобавленХотяБыОдинЭлемент;

	КонецЦикла;

	Возврат БылДобавленХотяБыОдинЭлемент;

КонецФункции

Процедура Очистить() Экспорт
	
	Массив.Очистить();

	ОповеститьОбИзмененииКоллекции();

КонецПроцедуры

Функция Удалить(Элемент) Экспорт
	
	ИндексЭлемента = Индекс(Элемент);

	Если ИндексЭлемента <> -1 Тогда
	
		Массив.Удалить(ИндексЭлемента);
		ОповеститьОбИзмененииКоллекции();

		Возврат Истина;
	
	КонецЕсли;

	Возврат Ложь;

КонецФункции

Функция УдалитьВсе(Коллекция) Экспорт

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		БылУдаленХотяБыОдинЭлемент = Удалить(Итератор.Следующий()) 
			Или БылУдаленХотяБыОдинЭлемент;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Функция УдалитьЕсли(Знач Предикат) Экспорт

	Если ТипЗнч(Предикат) = Тип("Строка") Тогда
		Предикат = Лямбда.Выражение(Предикат)
			.Интерфейс(ФункциональныеИнтерфейсы.УниФункция())
			.ВДействие();
	КонецЕсли;

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Предикат.Выполнить(Итератор.Следующий()) Тогда
			
			Итератор.Удалить();

			БылУдаленХотяБыОдинЭлемент = Истина;

		КонецЕсли;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Функция СохранитьВсе(Коллекция) Экспорт

	БылУдаленХотяБыОдинЭлемент = Ложь;

	Итератор = Итератор();

	Пока Итератор.ЕстьСледующий() Цикл

		Если Не Коллекция.Содержит(Итератор.Следующий()) Тогда
			
			Итератор.Удалить();

			БылУдаленХотяБыОдинЭлемент = Истина;

		КонецЕсли;

	КонецЦикла;

	Возврат БылУдаленХотяБыОдинЭлемент;

КонецФункции

Функция Вставить(Индекс, Элемент) Экспорт
	
	Массив.Вставить(Индекс, Элемент);

	ОповеститьОбИзмененииКоллекции();

	Возврат Истина;

КонецФункции

Функция ВставитьВсе(Индекс, Коллекция) Экспорт

	БылВставленХотяБыОдинЭлемент = Ложь;

	СчетчикВставленныхЭлементов = 0;

	Итератор = Коллекция.Итератор();

	Пока Итератор.ЕстьСледующий() Цикл
		
		Вставить(Индекс + СчетчикВставленныхЭлементов, Итератор.Следующий());

		БылВставленХотяБыОдинЭлемент = Истина;
		СчетчикВставленныхЭлементов  = СчетчикВставленныхЭлементов + 1;

	КонецЦикла;

	Возврат БылВставленХотяБыОдинЭлемент;

КонецФункции

Процедура ЗаменитьВсе(Знач Алгоритм) Экспорт

	Если ТипЗнч(Алгоритм) = Тип("Строка") Тогда
		Алгоритм = Лямбда.Выражение(Алгоритм)
			.Интерфейс(ФункциональныеИнтерфейсы.УниФункция())
			.ВДействие();
	КонецЕсли;

	Для Индекс = 0 По ВГраница() Цикл
		Установить(Индекс, Алгоритм.Выполнить(Получить(Индекс)));
	КонецЦикла;

КонецПроцедуры

Процедура Сортировать(Знач СравнениеЗначений) Экспорт

	Если ТипЗнч(СравнениеЗначений) = Тип("Строка") Тогда
		СравнениеЗначений = Лямбда.Выражение(СравнениеЗначений)
			.Интерфейс(ФункциональныеИнтерфейсы.БиФункция())
			.ВДействие();
	КонецЕсли;

	Для Индекс = 0 По ВГраница() Цикл
		
		Флаг = Ложь;
		Счетчик = ВГраница();

		Пока Счетчик > Индекс Цикл
			
			Элемент          = Получить(Счетчик - 1);
			СледующийЭлемент = Получить(Счетчик);

			РезультатСравнения = СравнениеЗначений.Выполнить(
				Элемент,
				СледующийЭлемент
			);
			
			Если РезультатСравнения > 0 Тогда
				
				Установить(Счетчик - 1, СледующийЭлемент);
				Установить(Счетчик, Элемент);

				Флаг = Истина;

			КонецЕсли;
			
			Счетчик = Счетчик - 1;
		
		КонецЦикла;
		
		Если НЕ Флаг Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;	

КонецПроцедуры

Функция УдалитьПоИндексу(Индекс) Экспорт
	
	Результат = Получить(Индекс);

	Массив.Удалить(Индекс);

	ОповеститьОбИзмененииКоллекции();
	
	Возврат Результат;

КонецФункции

Функция Установить(Индекс, Значение) Экспорт

	Результат = Получить(Индекс);

	Массив.Установить(Индекс, Значение);
	
	ОповеститьОбИзмененииКоллекции();

	Возврат Результат;

КонецФункции

Процедура ОповеститьОбИзмененииКоллекции()
	
	Если ЕстьИтераторы Тогда
		ВызватьСобытие("КоллекцияМодифицирована", Новый Массив);
	КонецЕсли;

КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Представление, СтандартнаяОбработка) // BSLLS:UnusedLocalMethod-off
	КоллекцииСлужебный.ОбработчикПолученияПредставленияКоллекции(ЭтотОбъект, Представление, СтандартнаяОбработка);
КонецПроцедуры

Функция ПолучитьИтератор() // BSLLS:UnusedLocalMethod-off
	Возврат Новый СлужебныйИтераторДляДвижка(Итератор());
КонецФункции

&Обходимое
&Реализует("Список")
Процедура ПриСозданииОбъекта(Коллекция = Неопределено)

	Массив        = Новый Массив;
	ЕстьИтераторы = Ложь;

	Если Коллекция <> Неопределено Тогда
		ДобавитьВсе(Коллекция);
	КонецЕсли;

КонецПроцедуры
