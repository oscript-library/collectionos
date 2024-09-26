#Использовать asserts

#Использовать ".."
#Использовать "./ТестМодуль"

Перем ПроверяемоеЧисло; // Переменная в которую пишут фоновые задания
Перем Рефлектор;        // Рефлектор

&Тест
Процедура СинхронизированнаяОчередьСоздаётся() Экспорт

	// Дано

	// Когда

	Результат = Новый СинхронизированнаяОчередь(Новый ОчередьМассив);

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("СинхронизированнаяОчередь");

КонецПроцедуры

&Тест
Процедура Итератор() Экспорт

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(Новый ОчередьМассив);

	// Когда

	Результат = ПроверяемаяКоллекция.Итератор();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ИтераторМассив");

КонецПроцедуры

&Тест
Процедура ДляКаждого() Экспорт

	ПроверяемоеЧисло = 0;

	// Дано
	
	ОчередьМассив = Новый ОчередьМассив();
	
	// BSLLS:DuplicatedInsertionIntoCollection-off
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(1); 
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(1);
	// BSLLS:DuplicatedInsertionIntoCollection-on
	
	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДляКаждого",
		Новый Действие(ЭтотОбъект, "ДобавитьКПроверяемомуЧислу")
	);

	// Тогда

	Ожидаем.Что(ПроверяемоеЧисло).Равно(25);

КонецПроцедуры

&Тест
Процедура Содержит() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Содержит",
		2
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура СодержитВсе() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	ПроверяющаяКоллекция = Новый ОчередьМассив();
	ПроверяющаяКоллекция.Добавить(1);
	ПроверяющаяКоллекция.Добавить(2);
	ПроверяющаяКоллекция.Добавить(3);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"СодержитВсе",
		ПроверяющаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура Пусто() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Пусто"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоЛожь();
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура ПроцессорКоллекции() Экспорт

	// Дано

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(Новый ОчередьМассив);

	// Когда

	Результат = ПроверяемаяКоллекция.ПроцессорКоллекции();

	// Тогда

	Ожидаем.Что(Результат).ИмеетТип("ПроцессорКоллекций");

КонецПроцедуры

&Тест
Процедура Количество() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Количество"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).Равно(3);
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура ВМассив() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ВМассив"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		
		Ожидаем.Что(Результат)
			.ИмеетТип("Массив")
			.ИмеетДлину(3)
			.Содержит(1)
			.Содержит(2)
			.Содержит(3);

	КонецЦикла;

КонецПроцедуры

&Тест
Процедура Добавить() Экспорт

	// Дано

	Массив = Новый Массив;
	ОчередьМассив = Новый ОчередьМассив();

	Рефлектор.УстановитьСвойство(ОчередьМассив, "Массив", Массив);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Добавить",
		5
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(5);
	Ожидаем.Что(Массив[0]).Равно(5);
	Ожидаем.Что(Массив[1]).Равно(5);
	Ожидаем.Что(Массив[2]).Равно(5);
	Ожидаем.Что(Массив[3]).Равно(5);
	Ожидаем.Что(Массив[4]).Равно(5);

КонецПроцедуры

&Тест
Процедура ДобавитьВсе() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	ДобавляемаяКоллекция = Новый ОчередьМассив();
	ДобавляемаяКоллекция.Добавить(1);
	ДобавляемаяКоллекция.Добавить(2);
	ДобавляемаяКоллекция.Добавить(3);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"ДобавитьВсе",
		ДобавляемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат).ЭтоИстина();
	КонецЦикла;

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(15);

КонецПроцедуры

&Тест
Процедура Очистить() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();

	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Очистить"
	);

	// Тогда

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(0);

КонецПроцедуры

&Тест
Процедура Удалить() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Удалить",
		2
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(2);

КонецПроцедуры

&Тест
Процедура УдалитьВсе() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	УдаляемаяКоллекция = Новый ОчередьМассив();
	УдаляемаяКоллекция.Добавить(1);
	УдаляемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"УдалитьВсе",
		УдаляемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура УдалитьЕсли() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"УдалитьЕсли",
		Новый Действие(ЭтотОбъект, "БольшеИлиРавноДвум")
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура СохранитьВсе() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(3);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	СохраняемаяКоллекция = Новый ОчередьМассив();
	СохраняемаяКоллекция.Добавить(2);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"СохранитьВсе",
		СохраняемаяКоллекция
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетТип("Массив").ИмеетДлину(5);

	КоличествоИстина = 0;
	КоличествоЛожь   = 0;

	Для каждого Результат Из Результаты Цикл
		
		Если Результат Тогда
			КоличествоИстина = КоличествоИстина + 1;
		Иначе
			КоличествоЛожь = КоличествоЛожь + 1;
		КонецЕсли;

	КонецЦикла;

	Ожидаем.Что(КоличествоИстина).Равно(1);
	Ожидаем.Что(КоличествоЛожь).Равно(4);

	Ожидаем.Что(ОчередьМассив).ИмеетДлину(1);

КонецПроцедуры

&Тест
Процедура ПреставлениеПереопределяется() Экспорт

	// Дано

	ОчередьМассив = Новый ОчередьМассив();
	ОчередьМассив.Добавить(1);
	ОчередьМассив.Добавить(2);
	ОчередьМассив.Добавить(ТестМодуль.ОбъектЗаглушка());

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);
	ПроверяемаяКоллекция.Добавить(ПроверяемаяКоллекция); // BSLLS:SelfInsertion-off Тестовый случай

	// Когда
	
	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ТестМодуль,
		"ВСтроку",
		ПроверяемаяКоллекция
	);

	// Тогда

	Для каждого Результат Из Результаты Цикл
		Ожидаем.Что(Результат)
			.Равно("[1, 2, Заглушка, (Эта коллекция)]");
	КонецЦикла;

КонецПроцедуры

&Тест
Процедура Подсмотреть() Экспорт

	// Дано

	Массив = Новый Массив;
	Массив.Добавить(1);
	Массив.Добавить(2);
	Массив.Добавить(3);

	ОчередьМассив = Новый ОчередьМассив;

	Рефлектор.УстановитьСвойство(
		ОчередьМассив,
		"Массив",
		Массив
	);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	Результаты = ТестМодуль.ВыполнитьВПятьПотоков(
		ПроверяемаяКоллекция,
		"Подсмотреть"
	);

	// Тогда

	Ожидаем.Что(Результаты).ИмеетДлину(5);

	Для каждого Результат Из Результаты Цикл

		Ожидаем.Что(Результат).ИмеетТип("Опциональный");
		Ожидаем.Что(Результат.Пустой()).ЭтоЛожь();
		Ожидаем.Что(Результат.Получить()).Равно(1);
	
	КонецЦикла;

	Ожидаем.Что(Массив).ИмеетДлину(3);
	Ожидаем.Что(Массив[0]).Равно(1);
	Ожидаем.Что(Массив[1]).Равно(2);
	Ожидаем.Что(Массив[2]).Равно(3);

КонецПроцедуры

&Тест
Процедура ОбходитсяЦикломДляКаждого() Экспорт

	Если Не ТестМодуль.ЭтоДвижокВерсии2() Тогда
		Возврат;
	КонецЕсли;

	// Дано

	Массив = Новый Массив;
	Массив.Добавить(1);
	Массив.Добавить(2);

	ОчередьМассив = Новый ОчередьМассив;

	Рефлектор.УстановитьСвойство(
		ОчередьМассив,
		"Массив",
		Массив
	);

	ПроверяемаяКоллекция = Новый СинхронизированнаяОчередь(ОчередьМассив);

	// Когда

	// Тогда

	Для каждого Элемент Из ПроверяемаяКоллекция Цикл

		Ожидаем.Что(Элемент)
			.БольшеИлиРавно(1)
			.МеньшеИлиРавно(2);

	КонецЦикла;

КонецПроцедуры

Функция БольшеИлиРавноДвум(Элемент) Экспорт
	Два = 2;
	Возврат Элемент >= Два;
КонецФункции

Процедура ДобавитьКПроверяемомуЧислу(Элемент) Экспорт
	ПроверяемоеЧисло = ПроверяемоеЧисло + Элемент;
КонецПроцедуры

Рефлектор = Новый Рефлектор();
