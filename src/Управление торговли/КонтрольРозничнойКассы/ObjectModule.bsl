﻿#Если Клиент Тогда
	
////////////////////////////////////////////////////////////////////////////////
// ПРОЦЕДУРЫ И ФУНКЦИИ НАЧАЛЬНОЙ НАСТРОЙКИ ОТЧЕТА

// Процедура установки начальных настроек отчета с использованием текста запроса
//
Процедура УстановитьНачальныеНастройки(ДополнительныеПараметры = Неопределено) Экспорт
	
	// Настройка общих параметров универсального отчета
	
	// Содержит название отчета, которое будет выводиться в шапке.
	// Тип: Строка.
	// Пример:
	// УниверсальныйОтчет.мНазваниеОтчета = "Название отчета";
	УниверсальныйОтчет.мНазваниеОтчета = СокрЛП(ЭтотОбъект.Метаданные().Синоним);
	
	// Содержит признак необходимости отображения надписи и поля выбора раздела учета в форме настройки.
	// Тип: Булево.
	// Значение по умолчанию: Истина.
	// Пример:
	// УниверсальныйОтчет.мВыбиратьИмяРегистра = Истина;
	УниверсальныйОтчет.мВыбиратьИмяРегистра = Ложь;
	
	// Содержит имя регистра, по метаданным которого будет выполняться заполнение настроек отчета.
	// Тип: Строка.
	// Пример:
	// УниверсальныйОтчет.ИмяРегистра = "ТоварыНаСкладах";
	УниверсальныйОтчет.ИмяРегистра = "РозничнаяВыручка";
	
	// Содержит признак необходимости вывода отрицательных значений показателей красным цветом.
	// Тип: Булево.
	// Значение по умолчанию: Ложь.
	// Пример:
	// УниверсальныйОтчет.ОтрицательноеКрасным = Истина;
	УниверсальныйОтчет.ОтрицательноеКрасным = Истина;
	
	// Содержит признак необходимости вывода в отчет общих итогов.
	// Тип: Булево.
	// Значение по умолчанию: Ложь.
	// Пример:
	// УниверсальныйОтчет.ВыводитьОбщиеИтоги = Ложь;
	
	// Содержит признак необходимости вывода детальных записей в отчет.
	// Тип: Булево.
	// Значение по умолчанию: Ложь.
	// Пример:
	// УниверсальныйОтчет.ВыводитьДетальныеЗаписи = Истина;
	
	// Содержит признак необходимости отображения флага использования свойств и категорий в форме настройки.
	// Тип: Булево.
	// Значение по умолчанию: Истина.
	// Пример:
	// УниверсальныйОтчет.мВыбиратьИспользованиеСвойств = Ложь;
	УниверсальныйОтчет.мВыбиратьИспользованиеСвойств = Истина;
	
	// Содержит признак использования свойств и категорий при заполнении настроек отчета.
	// Тип: Булево.
	// Значение по умолчанию: Истина.
	// Пример:
	// УниверсальныйОтчет.ИспользоватьСвойстваИКатегории = Истина;
	//УниверсальныйОтчет.ИспользоватьСвойстваИКатегории = Истина;
	
	// Содержит признак использования простой формы настроек отчета без группировок колонок.
	// Тип: Булево.
	// Значение по умолчанию: Ложь.
	// Пример:
	// УниверсальныйОтчет.мРежимФормыНастройкиБезГруппировокКолонок = Истина;
	
	// Дополнительные параметры, переданные из отчета, вызвавшего расшифровку.
	// Информация, передаваемая в переменной ДополнительныеПараметры, может быть использована
	// для реализации специфичных для данного отчета параметрических настроек.
	
	// Описание исходного текста запроса.
	// При написании текста запроса рекомендуется следовать правилам, описанным в следующем шаблоне текста запроса:
	//
	//ВЫБРАТЬ
	//	<ПсевдонимТаблицы.Поле> КАК <ПсевдонимПоля>,
	//	ПРЕДСТАВЛЕНИЕ(<ПсевдонимТаблицы>.<Поле>),
	//	<ПсевдонимТаблицы.Показатель> КАК <ПсевдонимПоказателя>
	//	//ПОЛЯ_СВОЙСТВА
	//	//ПОЛЯ_КАТЕГОРИИ
	//{ВЫБРАТЬ
	//	<ПсевдонимПоля>.*,
	//	<ПсевдонимПоказателя>,
	//	Регистратор,
	//	Период,
	//	ПериодДень,
	//	ПериодНеделя,
	//	ПериодДекада,
	//	ПериодМесяц,
	//	ПериодКвартал,
	//	ПериодПолугодие,
	//	ПериодГод
	//	//ПОЛЯ_СВОЙСТВА
	//	//ПОЛЯ_КАТЕГОРИИ
	//}
	//ИЗ
	//	<Таблица> КАК <ПсевдонимТаблицы>
	//	//СОЕДИНЕНИЯ
	//{ГДЕ
	//	<ПсевдонимТаблицы.Поле>.* КАК <ПсевдонимПоля>,
	//	<ПсевдонимТаблицы.Показатель> КАК <ПсевдонимПоказателя>,
	//	<ПсевдонимТаблицы>.Регистратор КАК Регистратор,
	//	<ПсевдонимТаблицы>.Период КАК Период,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, ДЕНЬ) КАК ПериодДень,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, НЕДЕЛЯ) КАК ПериодНеделя,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, ДЕКАДА) КАК ПериодДекада,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, МЕСЯЦ) КАК ПериодМесяц,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, КВАРТАЛ) КАК ПериодКвартал,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, ПОЛУГОДИЕ) КАК ПериодПолугодие,
	//	НАЧАЛОПЕРИОДА(<ПсевдонимТаблицы>.Период, ГОД) КАК ПериодГод
	//	//ПОЛЯ_СВОЙСТВА
	//	//ПОЛЯ_КАТЕГОРИИ
	//}
	//{УПОРЯДОЧИТЬ ПО
	//	<ПсевдонимПоля>.*,
	//	<ПсевдонимПоказателя>,
	//	Регистратор,
	//	Период,
	//	ПериодДень,
	//	ПериодНеделя,
	//	ПериодДекада,
	//	ПериодМесяц,
	//	ПериодКвартал,
	//	ПериодПолугодие,
	//	ПериодГод
	//	//УПОРЯДОЧИТЬ_СВОЙСТВА
	//	//УПОРЯДОЧИТЬ_КАТЕГОРИИ
	//}
	//ИТОГИ
	//	АГРЕГАТНАЯ_ФУНКЦИЯ(<ПсевдонимПоказателя>)
	//	//ИТОГИ_СВОЙСТВА
	//	//ИТОГИ_КАТЕГОРИИ
	//ПО
	//	ОБЩИЕ
	//{ИТОГИ ПО
	//	<ПсевдонимПоля>.*,
	//	Регистратор,
	//	Период,
	//	ПериодДень,
	//	ПериодНеделя,
	//	ПериодДекада,
	//	ПериодМесяц,
	//	ПериодКвартал,
	//	ПериодПолугодие,
	//	ПериодГод
	//	//ПОЛЯ_СВОЙСТВА
	//	//ПОЛЯ_КАТЕГОРИИ
	//}
	//АВТОУПОРЯДОЧИВАНИЕ
	ТекстЗапроса = "";
	
	// В универсальном отчете включен флаг использования свойств и категорий.
	//Если УниверсальныйОтчет.ИспользоватьСвойстваИКатегории Тогда
	//	
	//	// Добавление свойств и категорий поля запроса в таблицу полей.
	//	// Необходимо вызывать для каждого поля запроса, предоставляющего возможность использования свойств и категорий.
	//	
	//	// УниверсальныйОтчет.ДобавитьСвойстваИКатегорииДляПоля(<ПсевдонимТаблицы>.<Поле> , <ПсевдонимПоля>, <Представление>, <Назначение>);
	//	
	//	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Пример
	//	//УниверсальныйОтчет.ДобавитьСвойстваИКатегорииДляПоля( "РегЗаказы.Номенклатура" ,               "Номенклатура",               "Номенклатура",                ПланыВидовХарактеристик.НазначенияСвойствКатегорийОбъектов.Справочник_Номенклатура);
	//	
	//	
	//	// Добавление свойств и категорий в исходный текст запроса.
	//	УниверсальныйОтчет.ДобавитьВТекстЗапросаСвойстваИКатегории(ТекстЗапроса);
	//	
	//КонецЕсли;
	
	УниверсальныйОтчет.УстановитьНачальныеНастройки(Истина);
		
	// Инициализация текста запроса построителя отчета
	//УниверсальныйОтчет.ПостроительОтчета.Текст = ТекстЗапроса;
	
	// Представления полей отчета.
	// Необходимо вызывать для каждого поля запроса.
	// УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить(<ИмяПоля>, <ПредставлениеПоля>);
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Пример
	//УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить( "КоличествоОстаток",          "Количество");
	
	
	// Добавление показателей
	// Необходимо вызывать для каждого добавляемого показателя.
	// УниверсальныйОтчет.ДобавитьПоказатель(<ИмяПоказателя>, <ПредставлениеПоказателя>, <ВключенПоУмолчанию>, <Формат>, <ИмяГруппы>, <ПредставлениеГруппы>);
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Пример
	//УниверсальныйОтчет.ДобавитьПоказатель("КоличествоОстаток", "Количество", Истина, "ЧЦ=15; ЧДЦ=3");
	
	// Добавление предопределенных группировок строк отчета.
	// Необходимо вызывать для каждой добавляемой группировки строки.
	// УниверсальныйОтчет.ДобавитьИзмерениеСтроки(<ПутьКДанным>);
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Пример
	УниверсальныйОтчет.ДобавитьИзмерениеСтроки("РозничнаяТочка");
	
	// Добавление предопределенных группировок колонок отчета.
	// Необходимо вызывать для каждой добавляемой группировки колонки.
	// УниверсальныйОтчет.ДобавитьИзмерениеКолонки(<ПутьКДанным>);
	
	// Добавление предопределенных отборов отчета.
	// Необходимо вызывать для каждого добавляемого отбора.
	// УниверсальныйОтчет.ДобавитьОтбор(<ПутьКДанным>);
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Пример
	УниверсальныйОтчет.ДобавитьОтбор("РозничнаяТочка");
	
	// Установка связи подчиненных и родительских полей
	// УниверсальныйОтчет.УстановитьСвязьПолей(<ПутьКДанным>, <ПутьКДанным>);
	
	// Установка представлений полей
	// УниверсальныйОтчет.УстановитьПредставленияПолей(УниверсальныйОтчет.мСтруктураПредставлениеПолей, УниверсальныйОтчет.ПостроительОтчета);
	УниверсальныйОтчет.УстановитьПредставленияПолей(УниверсальныйОтчет.мСтруктураПредставлениеПолей, УниверсальныйОтчет.ПостроительОтчета);
	
	// Установка типов значений свойств в отборах отчета
	УниверсальныйОтчет.УстановитьТипыЗначенийСвойствДляОтбора();
	
	// Заполнение начальных настроек универсального отчета
	УниверсальныйОтчет.УстановитьНачальныеНастройки(Истина);
	
	// Добавление дополнительных полей
	// Необходимо вызывать для каждого добавляемого дополнительного поля.
	// УниверсальныйОтчет.ДобавитьДополнительноеПоле(<ПутьКДанным>);
	
КонецПроцедуры // УстановитьНачальныеНастройки()

////////////////////////////////////////////////////////////////////////////////
// ПРОЦЕДУРЫ И ФУНКЦИИ ФОРМИРОВАНИЯ ОТЧЕТА 
	
// Процедура формирования отчета
//
Процедура СформироватьОтчет(ТабличныйДокумент) Экспорт
	
	// Перед формирование отчета можно установить необходимые параметры универсального отчета.
	
	УниверсальныйОтчет.СформироватьОтчет(ТабличныйДокумент);

КонецПроцедуры // СформироватьОтчет()

////////////////////////////////////////////////////////////////////////////////
// ПРОЦЕДУРЫ И ФУНКЦИИ ОБЩЕГО НАЗНАЧЕНИЯ

// Процедура обработки расшифровки
//
Процедура ОбработкаРасшифровки(Расшифровка, Объект) Экспорт
	
	// Дополнительные параметры в расшифровывающий отчет можно передать
	// посредством инициализации переменной "ДополнительныеПараметры".
	
	ДополнительныеПараметры = Неопределено;
	УниверсальныйОтчет.ОбработкаРасшифровкиУниверсальногоОтчета(Расшифровка, Объект, ДополнительныеПараметры);
	
КонецПроцедуры // ОбработкаРасшифровки()

// Формирует структуру для сохранения настроек отчета
//
Процедура СформироватьСтруктуруДляСохраненияНастроек(СтруктураСНастройками) Экспорт
	
	УниверсальныйОтчет.СформироватьСтруктуруДляСохраненияНастроек(СтруктураСНастройками);
	
КонецПроцедуры // СформироватьСтруктуруДляСохраненияНастроек()

// Заполняет настройки отчета из структуры сохраненных настроек
//
Функция ВосстановитьНастройкиИзСтруктуры(СтруктураСНастройками) Экспорт
	
	Возврат УниверсальныйОтчет.ВосстановитьНастройкиИзСтруктуры(СтруктураСНастройками, ЭтотОбъект);
	
КонецФункции // ВосстановитьНастройкиИзСтруктуры()

// Содержит значение используемого режима ввода периода.
// Тип: Число.
// Возможные значения: 0 - произвольный период, 1 - на дату, 2 - неделя, 3 - декада, 4 - месяц, 5 - квартал, 6 - полугодие, 7 - год
// Значение по умолчанию: 0
// Пример:
УниверсальныйОтчет.мРежимВводаПериода = 0;

#КонецЕсли
