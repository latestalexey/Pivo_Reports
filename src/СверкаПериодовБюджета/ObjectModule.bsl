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
	УниверсальныйОтчет.ИмяРегистра = "";
	
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
	ТекстЗапроса = "ВЫБРАТЬ РАЗРЕШЕННЫЕ
	               |	ИсточникДанных.ПодКонтролем,
	               |	ИсточникДанных.КоличествоОборот КАК Количество,
	               |	ИсточникДанных.СуммаОборот КАК Сумма,
	               |	ИсточникДанных.ВидБюджета,
	               |	ИсточникДанных.СтатьяБюджета,
	               |	ИсточникДанных.Проект,
	               |	ИсточникДанных.Подразделение,
	               |	ИсточникДанных.Контрагент,
	               |	ИсточникДанных.Номенклатура,
	               |	ИсточникДанных.Сценарий,
	               |	ИсточникДанных.Порядок,
	               |	ВЫБОР
	               |		КОГДА (ИсточникДанных.Период) = 1
	               |			ТОГДА ""Январь""
	               |		КОГДА (ИсточникДанных.Период) = 2
	               |			ТОГДА ""Февраль""
	               |		КОГДА (ИсточникДанных.Период) = 3
	               |			ТОГДА ""Март""
	               |		КОГДА (ИсточникДанных.Период) = 4
	               |			ТОГДА ""Апрель""
	               |		КОГДА (ИсточникДанных.Период) = 5
	               |			ТОГДА ""Май""
	               |		КОГДА (ИсточникДанных.Период) = 6
	               |			ТОГДА ""Июнь""
	               |		КОГДА (ИсточникДанных.Период) = 7
	               |			ТОГДА ""Июль""
	               |		КОГДА (ИсточникДанных.Период) = 8
	               |			ТОГДА ""Август""
	               |		КОГДА (ИсточникДанных.Период) = 9
	               |			ТОГДА ""Сентябрь""
	               |		КОГДА (ИсточникДанных.Период) = 10
	               |			ТОГДА ""Октябрь""
	               |		КОГДА (ИсточникДанных.Период) = 11
	               |			ТОГДА ""Ноябрь""
	               |		КОГДА (ИсточникДанных.Период) = 12
	               |			ТОГДА ""Декабрь""
	               |	КОНЕЦ КАК Месяц
	               |{ВЫБРАТЬ
	               |	ПодКонтролем,
	               |	Количество,
	               |	Сумма,
	               |	ВидБюджета.*,
	               |	СтатьяБюджета.*,
	               |	Проект.*,
	               |	Подразделение.*,
	               |	Контрагент.*,
	               |	Сценарий,
	               |	Порядок,
	               |	Номенклатура.*,
	               |	Месяц}
	               |ИЗ
	               |	(ВЫБРАТЬ
	               |		IT_УчетБюджетовОбороты.ПодКонтролем КАК ПодКонтролем,
	               |		IT_УчетБюджетовОбороты.КоличествоОборот КАК КоличествоОборот,
	               |		IT_УчетБюджетовОбороты.СуммаОборот КАК СуммаОборот,
	               |		Месяц(IT_УчетБюджетовОбороты.Период) КАК Период,
	               |		IT_АналитикаВидаБюджета.ВидБюджета КАК ВидБюджета,
	               |		IT_АналитикаУчетаБюджета.СтатьяБюджета КАК СтатьяБюджета,
	               |		IT_АналитикаУчетаБюджета.Проект КАК Проект,
	               |		IT_АналитикаУчетаБюджета.Подразделение КАК Подразделение,
	               |		IT_АналитикаУчетаБюджета.Контрагент КАК Контрагент,
	               |		IT_АналитикаУчетаБюджета.Номенклатура КАК Номенклатура,
	               |		""Факт"" КАК Сценарий,
	               |		0 КАК Порядок
	               |	ИЗ
	               |		РегистрНакопления.IT_УчетБюджетов.Обороты(&ДатаНач, &ДатаКон, Месяц, ) КАК IT_УчетБюджетовОбороты
	               |			ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.IT_АналитикаВидаБюджета КАК IT_АналитикаВидаБюджета
	               |			ПО IT_УчетБюджетовОбороты.АналитикаВидаБюджета = IT_АналитикаВидаБюджета.КлючАналитикиВидаБюджета
	               |			ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.IT_АналитикаУчетаБюджета КАК IT_АналитикаУчетаБюджета
	               |			ПО IT_УчетБюджетовОбороты.АналитикаУчетаБюджета = IT_АналитикаУчетаБюджета.КлючАналитикиУчетаБюджета
	               |	ГДЕ
	               |		IT_АналитикаВидаБюджета.СценарийБюджета = &ПустойСценарий
	               |	{ГДЕ
	               |		IT_УчетБюджетовОбороты.ПодКонтролем,
	               |		IT_АналитикаВидаБюджета.ВидБюджета.*,
	               |		IT_АналитикаВидаБюджета.СценарийБюджета.*,
	               |		IT_АналитикаУчетаБюджета.СтатьяБюджета.*,
	               |		IT_АналитикаУчетаБюджета.Проект.*,
	               |		IT_АналитикаУчетаБюджета.Подразделение.*,
	               |		IT_АналитикаУчетаБюджета.Контрагент.*,
	               |		IT_АналитикаУчетаБюджета.Номенклатура.*}
				   |//%ОБЪЕДИНИТЬ_ВСЕ%
				   |) КАК ИсточникДанных
	               |{УПОРЯДОЧИТЬ ПО
	               |	ПодКонтролем,
	               |	Количество,
	               |	Сумма,
	               |	ВидБюджета.*,
	               |	СтатьяБюджета.*,
	               |	Проект.*,
	               |	Подразделение.*,
	               |	Контрагент.*,
	               |	Номенклатура.*,
	               |	Порядок,
	               |	Период}
	               |ИТОГИ
	               |	СУММА(Количество),
	               |	СУММА(Сумма)
	               |ПО
	               |	ОБЩИЕ
	               |{ИТОГИ ПО
	               |	ПодКонтролем,
	               |	ВидБюджета.*,
	               |	СтатьяБюджета.*,
	               |	Проект.*,
	               |	Подразделение.*,
	               |	Контрагент.*,
	               |	Сценарий,
	               |	Порядок,
	               |	Номенклатура.*,
	               |	Месяц}
	               |АВТОУПОРЯДОЧИВАНИЕ";
	//Собираем дополнительные данные
	ДопТекст="";
	Оригинал="ВЫБРАТЬ
	         |	IT_УчетБюджетовОбороты.ПодКонтролем КАК ПодКонтролем,
	         |	IT_УчетБюджетовОбороты.КоличествоОборот КАК КоличествоОборот,
	         |	IT_УчетБюджетовОбороты.СуммаОборот КАК СуммаОборот,
	         |	МЕСЯЦ(IT_УчетБюджетовОбороты.Период) КАК Период,
	         |	IT_АналитикаВидаБюджета.ВидБюджета КАК ВидБюджета,
	         |	IT_АналитикаУчетаБюджета.СтатьяБюджета КАК СтатьяБюджета,
	         |	IT_АналитикаУчетаБюджета.Проект КАК Проект,
	         |	IT_АналитикаУчетаБюджета.Подразделение КАК Подразделение,
	         |	IT_АналитикаУчетаБюджета.Контрагент КАК Контрагент,
	         |	IT_АналитикаУчетаБюджета.Номенклатура КАК Номенклатура,
	         |	&ПердставлениеСценария КАК Сценарий,
	         |	&Порядок КАК Порядок
	         |ИЗ
	         |	РегистрНакопления.IT_УчетБюджетов.Обороты(&ДатаНач, &ДатаКон, Месяц, ) КАК IT_УчетБюджетовОбороты
	         |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.IT_АналитикаВидаБюджета КАК IT_АналитикаВидаБюджета
	         |		ПО IT_УчетБюджетовОбороты.АналитикаВидаБюджета = IT_АналитикаВидаБюджета.КлючАналитикиВидаБюджета
	         |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.IT_АналитикаУчетаБюджета КАК IT_АналитикаУчетаБюджета
	         |		ПО IT_УчетБюджетовОбороты.АналитикаУчетаБюджета = IT_АналитикаУчетаБюджета.КлючАналитикиУчетаБюджета
	         |ГДЕ
	         |	IT_АналитикаВидаБюджета.СценарийБюджета = &Сценарий
	         |{ГДЕ
	         |	IT_УчетБюджетовОбороты.ПодКонтролем,
	         |	IT_АналитикаВидаБюджета.ВидБюджета.*,
	         |	IT_АналитикаВидаБюджета.СценарийБюджета.*,
	         |	IT_АналитикаУчетаБюджета.СтатьяБюджета.*,
	         |	IT_АналитикаУчетаБюджета.Проект.*,
	         |	IT_АналитикаУчетаБюджета.Подразделение.*,
	         |	IT_АналитикаУчетаБюджета.Контрагент.*,
	         |	IT_АналитикаУчетаБюджета.Номенклатура.*}";
	Для Каждого СтрокаТЧ ИЗ ДанныеДляСравнения Цикл
		НовТекст=Оригинал;
		НовТекст=СтрЗаменить(НовТекст,"&ДатаНач","&ДатаНач"+СтрокаТЧ.НомерСтроки);
		НовТекст=СтрЗаменить(НовТекст,"&ДатаКон","&ДатаКон"+СтрокаТЧ.НомерСтроки);
		НовТекст=СтрЗаменить(НовТекст,"&ПердставлениеСценария","&ПердставлениеСценария"+СтрокаТЧ.НомерСтроки);
		НовТекст=СтрЗаменить(НовТекст,"&Сценарий","&Сценарий"+СтрокаТЧ.НомерСтроки);
		НовТекст=СтрЗаменить(НовТекст,"&Порядок",СтрокаТЧ.НомерСтроки);
		ДопТекст=ДопТекст+"ОБЪЕДИНИТЬ ВСЕ "+НовТекст;
		УниверсальныйОтчет.ПостроительОтчета.Параметры.Вставить("ДатаНач"+СтрокаТЧ.НомерСтроки,СтрокаТЧ.ДатаНач);
		УниверсальныйОтчет.ПостроительОтчета.Параметры.Вставить("ДатаКон"+СтрокаТЧ.НомерСтроки,СтрокаТЧ.ДатаКон);
		УниверсальныйОтчет.ПостроительОтчета.Параметры.Вставить("Сценарий"+СтрокаТЧ.НомерСтроки,СтрокаТЧ.Сценарий);
		УниверсальныйОтчет.ПостроительОтчета.Параметры.Вставить("ПердставлениеСценария"+СтрокаТЧ.НомерСтроки,?(ЗначениеЗаполнено(СтрокаТЧ.Сценарий),СтрокаТЧ.Сценарий.Наименование,"Факт")+ПредставлениеПериода(НачалоДня(СтрокаТЧ.ДатаНач),КонецДня(СтрокаТЧ.ДатаКон)));
	КонецЦикла;			
	Если ДопТекст<>"" Тогда
		ТекстЗапроса=СтрЗаменить(ТекстЗапроса,"//%ОБЪЕДИНИТЬ_ВСЕ%",ДопТекст);
	КонецЕсли;
	//// В универсальном отчете включен флаг использования свойств и категорий.
	//Если УниверсальныйОтчет.ИспользоватьСвойстваИКатегории Тогда
	//	
	//	// Добавление свойств и категорий поля запроса в таблицу полей.
	//	// Необходимо вызывать для каждого поля запроса, предоставляющего возможность использования свойств и категорий.
	//	
	//	// УниверсальныйОтчет.ДобавитьСвойстваИКатегорииДляПоля(<ПсевдонимТаблицы>.<Поле> , <ПсевдонимПоля>, <Представление>, <Назначение>);
	//	
	//	// Добавление свойств и категорий в исходный текст запроса.
	//	УниверсальныйОтчет.ДобавитьВТекстЗапросаСвойстваИКатегории(ТекстЗапроса);
	//	
	//КонецЕсли;
		
	// Инициализация текста запроса построителя отчета
	УниверсальныйОтчет.ПостроительОтчета.Текст = ТекстЗапроса;
	
	УниверсальныйОтчет.ПостроительОтчета.Параметры.Вставить("ПустойСценарий",Справочники.IT_СценарийБюджета.ПустаяСсылка());
	
	// Представления полей отчета.
	// Необходимо вызывать для каждого поля запроса.
	// УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить(<ИмяПоля>, <ПредставлениеПоля>);
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("ПодКонтролем",	"Под контролем");
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("ВидБюджета",		"Вид бюджета");
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("Сценарий",		"Сценарий бюджета");
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("СтатьяБюджета",	"Статья бюджета");
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("КоличествоФакт",	"Кол-во");
	УниверсальныйОтчет.мСтруктураПредставлениеПолей.Вставить("Сумма",			"Сумма");
	
	
	// Добавление показателей
	// Необходимо вызывать для каждого добавляемого показателя.
	// УниверсальныйОтчет.ДобавитьПоказатель(<ИмяПоказателя>, <ПредставлениеПоказателя>, <ВключенПоУмолчанию>, <Формат>, <ИмяГруппы>, <ПредставлениеГруппы>);
	УниверсальныйОтчет.ДобавитьПоказатель("Количество", "Количество",	Ложь,		"ЧЦ=15; ЧДЦ=3",);
	УниверсальныйОтчет.ДобавитьПоказатель("Сумма",		"Сумма", 		Истина,	"ЧЦ=15; ЧДЦ=2",);
	
	// Добавление предопределенных группировок строк отчета.
	// Необходимо вызывать для каждой добавляемой группировки строки.
	// УниверсальныйОтчет.ДобавитьИзмерениеСтроки(<ПутьКДанным>);
	УниверсальныйОтчет.ДобавитьИзмерениеСтроки("Подразделение",ТипИзмеренияПостроителяОтчета.Иерархия);
	УниверсальныйОтчет.ДобавитьИзмерениеКолонки("Сценарий");
	УниверсальныйОтчет.ДобавитьИзмерениеСтроки("СтатьяБюджета",ТипИзмеренияПостроителяОтчета.Иерархия);
	
	УниверсальныйОтчет.ДобавитьИзмерениеКолонки("Месяц");
	
	// Добавление предопределенных группировок колонок отчета.
	// Необходимо вызывать для каждой добавляемой группировки колонки.
	// УниверсальныйОтчет.ДобавитьИзмерениеКолонки(<ПутьКДанным>);
	
	// Добавление предопределенных отборов отчета.
	// Необходимо вызывать для каждого добавляемого отбора.
	// УниверсальныйОтчет.ДобавитьОтбор(<ПутьКДанным>);
	
	УниверсальныйОтчет.ДобавитьОтбор("ВидБюджета",Истина,ВидСравнения.Равно,Перечисления.IT_ВидыБюджета.БДР,,,Истина);
	УниверсальныйОтчет.ДобавитьОтбор("Подразделение",,,,,,Истина);
	
	// Установка представлений полей
	// УниверсальныйОтчет.УстановитьПредставленияПолей(УниверсальныйОтчет.мСтруктураПредставлениеПолей, УниверсальныйОтчет.ПостроительОтчета);
	УниверсальныйОтчет.УстановитьПредставленияПолей(УниверсальныйОтчет.мСтруктураПредставлениеПолей, УниверсальныйОтчет.ПостроительОтчета);
	
	// Установка типов значений свойств в отборах отчета
	УниверсальныйОтчет.УстановитьТипыЗначенийСвойствДляОтбора();
	
	// Заполнение начальных настроек универсального отчета
	УниверсальныйОтчет.УстановитьНачальныеНастройки(Ложь);
	
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
