﻿////////////////////////////////////////////////////////////////////////////////
// ПЕРЕМЕННЫЕ
//

Перем СоответствиеНастройкаРезультат Экспорт;         // Соответствие, в котором хранятся все результаты при текущем открытии отчета
Перем ПредставлениеНастройки         Экспорт;         // Представление настройки при редактировании отдельной настройки
Перем ПанельНастроекНарисована       Экспорт;         // Флаг, означающий что панель настроек после открытия нарисована
Перем ДействияЭлементовФормы         Экспорт;         // Структура, содеражащая действия элементов формы, формируемых программно

// ДЕЙСТВИЯ С РЕЗУЛЬТАТОМ

Процедура ДействияСРезультатомПечатьНажатие(Элемент)
	
	ТиповыеОтчеты.ПечатьТиповогоОтчета(ЭлементыФормы.Результат);
	
КонецПроцедуры

Процедура ДействияСРезультатомВывестиКопиюРезультатаВТабличныйДокумент(Кнопка)

	ТиповыеОтчеты.ПоказатьКопиюРезультата(ЭлементыФормы.Результат);
	
КонецПроцедуры

Процедура ДействияСРезультатомСохранитьРезультатВНастройке(Кнопка)
	
	ТиповыеОтчеты.СохранитьРезультатВНастройке(ЭтотОбъект, ЭтаФорма);
	                                                                         
КонецПроцедуры                                                                    

Процедура ДействияСРезультатомСравнитьТекущийРезультатССохраненным(Кнопка)
	
	ТиповыеОтчеты.СохранитьРезультатССохраненным(ЭтотОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура ДействияСРезультатомЗаголовок(Кнопка)
	
	Кнопка.Пометка = Не Кнопка.Пометка;
	ТиповыеОтчеты.УправлениеОтображениемЭлементовФормыТиповогоОтчета(ЭтотОбъект, ЭтаФорма);
	ТиповыеОтчеты.УправлениеОтображениемЗаголовкаТиповогоОтчета(ЭтотОбъект, ЭтаФорма.ЭлементыФормы.Результат);
	
КонецПроцедуры

// ОБЩИЕ ПРОЦЕДУРЫ

Процедура ОбновитьОтчет() Экспорт
	СостояниеМодифицированности = Модифицированность;
	Если ПанельНастроекНарисована <> Истина Тогда
		ОбновлениеОтображения();
	КонецЕсли;
	ТиповыеОтчеты.ЗагрузитьВРеквизитЗначенияНастроекПанелиПользователя(ЭтотОбъект, ЭтаФорма);
	ПараметрыПанели  = ТиповыеОтчеты.ПолучитьПараметрыПанелиПользователяОбъекта(ОтчетОбъект);
	ЗначенияНастроек = ТиповыеОтчеты.ПолучитьЗначенияНастроекПанелиПользователяОбъекта(ОтчетОбъект);
	Отказ = ложь;
	ТиповыеОтчеты.ПроверитьЗначенияПараметров(ЗначенияНастроек, ПараметрыПанели, Отказ);
	Если Отказ тогда
		Возврат;
	КонецЕсли;
	СформироватьОтчет(ЭлементыФормы.Результат, ДанныеРасшифровки);
	УправлениеОтчетами.УстановитьКолонтитулыПоУмолчанию(ЭлементыФормы.Результат, Заголовок, Строка(ПараметрыСеанса.ТекущийПользователь));
	Модифицированность = СостояниеМодифицированности;
КонецПроцедуры

// ОБРАБОТЧИКИ КНОПОК ФОРМЫ

Процедура ДействияФормыСформировать(Кнопка)
	
	ОбновитьОтчет();
	
КонецПроцедуры

Процедура ДействияФормыСохранитьНастройку(Кнопка)
	
	ТиповыеОтчеты.СохранитьТекущуюНастройку(ЭтотОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура ДействияФормыСохранитьНастройкуКак(Кнопка)
	
	ТиповыеОтчеты.СохранитьТекущуюНастройкуКак(ЭтотОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура КнопкаСписокВариантовНажатие(Кнопка)
	
	СохранениеНастроек.ВыбратьНастройкуФормы(СохраненнаяНастройка, ЭтаФорма, ТиповыеОтчеты.ПолучитьИдентификаторОбъекта(ОтчетОбъект), Ложь);
	ПанельНастроекНарисована = ложь;
	
	Если Не РежимРедактированияНастройки Тогда
		ТиповыеОтчеты.ОбновитьТаблицуДоступныхНастроекПользователю(ЭтотОбъект);
		ТиповыеОтчеты.ОбновитьКнопкиВыбораНастроек(ЭтаФорма, ЭтотОбъект, ПредставлениеНастройки, РежимРедактированияНастройки);
	КонецЕсли;
	
	Модифицированность = Ложь;
	
КонецПроцедуры

Процедура ДействияФормыРедактироватьНастройкуСтруктуры(Кнопка)
	РезультатРедактирования = ТиповыеОтчеты.РедактироватьСтруктуруОтчета(ЭтотОбъект, ЭтаФорма);
	Если РезультатРедактирования Тогда
		ОбновитьОтчет();
	КонецЕсли;
КонецПроцедуры

Процедура ДействияФормыРедактироватьПанельПользователя(Кнопка)
	
	ТиповыеОтчеты.РедактироватьПанельПользователя(ЭтотОбъект, ЭтаФорма);
		
КонецПроцедуры

Процедура ДействияФормыРедактироватьОписаниеИПользователей(Кнопка)
	
	ТиповыеОтчеты.ОткрытьФормуСохраненнойНастройки(ЭтотОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура КоманднаяПанельПанельВариантов(Кнопка)
	
	Кнопка.Пометка = Не Кнопка.Пометка;
	ТиповыеОтчеты.УправлениеОтображениемПанелиВариантов(ЭтаФорма);
	
КонецПроцедуры

Процедура КоманднаяПанельПанельПользователя(Кнопка)
	
	Кнопка.Пометка = Не Кнопка.Пометка;
	ТиповыеОтчеты.УправлениеОтображениемПанелиПользователя(ЭтаФорма);
	
КонецПроцедуры

// ОБРАБОТЧИКИ ФОРМЫ

Процедура ПриОткрытии()
	
	// Реквизит формы и компоновщик отчета ссылаются на один компоновщик
	//КомпоновщикНастроек = ЭтотОбъект.КомпоновщикНастроек;
	
	ТиповыеОтчеты.ОбновитьТаблицуДоступныхНастроекПользователю(ЭтотОбъект);
	ТиповыеОтчеты.УстановитьВариантПоУмолчанию(ЭтотОбъект, ЭтаФорма);
	
	// Нарисуем кнопки выбора настроек на верхней панели
	ТиповыеОтчеты.ОбновитьКнопкиВыбораНастроек(ЭтаФорма, ЭтотОбъект, ПредставлениеНастройки, РежимРедактированияНастройки);
	ТиповыеОтчеты.ОбновитьФормуТиповогоОтчетаПоКомпоновщику(ЭтотОбъект, ЭтаФорма);
	ТиповыеОтчеты.УстановитьВидимостьПанелиВариантовПоУмолчанию(ЭтотОбъект, ЭтаФорма);
	ТиповыеОтчеты.УстановитьВидимостьПанелиПользователяПоУмолчанию(ЭтотОбъект, ЭтаФорма);
	ТиповыеОтчеты.ВосстановитьНастройкиФормыОтчета(ЭтотОбъект, ЭтаФорма);
	ТиповыеОтчеты.УправлениеОтображениемПанелиВариантов(ЭтаФорма);
	ТиповыеОтчеты.УправлениеОтображениемПанелиПользователя(ЭтаФорма);
	ЭтаФорма.ЭлементыФормы.Результат.Защита = УправлениеДопПравамиПользователей.ЗащитаТаблиц();
	
КонецПроцедуры

Процедура ОбновлениеОтображения() Экспорт
	
	Если ПанельНастроекНарисована <> Истина И Не Модифицированность Тогда
		
		// Инициализация компоновщиков настроек и, если необходимо, загрузка настроек по умолчанию
		ЗагружатьНастройкиПоУмолчанию = Не РежимРедактированияНастройки И Не ЭтоОтработкаРасшифровки И СохраненнаяНастройка.Пустая();
		Схема = ТиповыеОтчеты.ИнициализироватьКомпоновщикНастроек(ЭтотОбъект, , ЗагружатьНастройкиПоУмолчанию);
		КомпоновщикНастроекПользователя.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(Схема));
		
		Если Не ЭтоОтработкаРасшифровки И Не РежимРедактированияНастройки Тогда
			ПрименитьНастройку();
			ТиповыеОтчеты.ПрименитьНастройкуПользователяНастройкиОтчета(ЭтотОбъект);
			ТиповыеОтчеты.ОбработкаФормыПослеПримененияНастройки(ЭтотОбъект, ЭтаФорма);
		Иначе
			// Отработаем изменение отображение панели настроек
			ТиповыеОтчеты.УправлениеОтображениемЭлементовФормыТиповогоОтчета(ЭтотОбъект, ЭтаФорма);
			ТиповыеОтчеты.ПерерисоватьПанельНастроек(ЭтотОбъект, ЭтаФорма, );
			
		КонецЕсли;
		
		ПанельНастроекНарисована = Истина;
		
	КонецЕсли;
	ТиповыеОтчеты.ОбновитьЗаголовокТиповогоОтчета(ЭтотОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура ОбработкаВыбора(ЗначениеВыбора, Источник)
	
	ТиповыеОтчеты.ОбработкаВыбораФормыОтчета(ЭтотОбъект, ЭтаФорма, ЗначениеВыбора, Источник);
	
КонецПроцедуры

Процедура РезультатОбработкаРасшифровки(Элемент, Расшифровка, СтандартнаяОбработка)
	ДопСписок = Новый СписокЗначений;
	ТиповыеОтчеты.ОбработкаРасшифровкиТиповогоОтчета(Расшифровка, СтандартнаяОбработка, ЭтотОбъект, ЭтаФорма, ДопСписок); 
	
	//ТиповыеОтчеты.СтандартнаяОбработкаРасшифровкиТиповогоОтчета(ОтчетОбъект, ЭтаФорма, Расшифровка, СтандартнаяОбработка);
КонецПроцедуры

Процедура ПередЗакрытием(Отказ, СтандартнаяОбработка)
	
	Если РежимРедактированияНастройки Тогда
		СтандартнаяОбработка = Ложь;
		Возврат;
	КонецЕсли;
	
	ТиповыеОтчеты.ОбработкаЗакрытияНастройкиОтчета(ЭтотОбъект, ЭтаФорма, Отказ, СтандартнаяОбработка);
	Если Не ЭтоОтработкаРасшифровки И Не РежимРедактированияНастройки Тогда
		ТиповыеОтчеты.СохранитьПоследнююИспользуемуюНастройку(ЭтотОбъект);
	КонецЕсли;
	
КонецПроцедуры

// ОБРАБОТЧИКИ ЭЛЕМЕНТОВ ФОРМЫ НА ПАНЕЛИ

Процедура ОтборПриВыводеСтроки(Элемент, ОформлениеСтроки, ДанныеСтроки)
	
	ОформлениеСтроки.Ячейки.ЛевоеЗначениеДляКраткогоОтображенияЭлемента.ОтображатьКартинку = Ложь;
	
КонецПроцедуры

Процедура ОбработкаНажатияКнопкиСохраненнойНастройки(Элемент)
	
	ТиповыеОтчеты.ВыборВариантаОтчетаНаПанелиВариантов(ЭтотОбъект, ЭтаФорма, Элемент);
		
КонецПроцедуры

Процедура ДействияПанелиСохранитьСписок(Элемент)
	
	ТиповыеОтчеты.СохранитьСписокВТабличномПоле(ЭтотОбъект, ЭлементыФормы, Элемент);
		
КонецПроцедуры

Процедура ДействияПанелиЗагрузитьСписок(Элемент)
	
	ТиповыеОтчеты.ЗагрузитьСписокВТабличноеПоле(ЭтотОбъект, ЭлементыФормы, Элемент);
		
КонецПроцедуры

Процедура ДействияПанелиСтандартныйПериодПользователяПриИзменении(Элемент)
	
	ТиповыеОтчеты.ДействияПанелиСтандартныйПериодПользователяПриИзменении(ЭтаФорма, Элемент);
	
КонецПроцедуры

Процедура ДействияПанелиСтандартнаяДатаНачалаПользователяПриИзменении(Элемент)
	
	СтандартнаяДатаНачала.Вариант = ?(Элемент.Значение = Неопределено, ВариантСтандартнойДатыНачала.ПроизвольнаяДата, Элемент.Значение);
	
КонецПроцедуры

Процедура ДействияПанелиДатаСтандартногоПериодаПриИзменении(Элемент)
	
	ЭлементыФормы.ДинамическийОтборСтандартныйПериодПользователя.Значение = ВариантСтандартногоПериода.ПроизвольныйПериод;
	
КонецПроцедуры

Процедура ДействияПанелиДатаСтандартнойДатыНачалаПриИзменении(Элемент)
	
	ЭлементыФормы.ДинамическийОтборСтандартнаяДатаНачалаПользователя.Значение = ВариантСтандартнойДатыНачала.ПроизвольнаяДата;
	
КонецПроцедуры

Процедура ДействияПанелиИзменениеЗначенияДинамическогоОтбора(Элемент)
	
	ТиповыеОтчеты.ОбработкаИзмененияЗначенияДинамическогоОтбора(ЭлементыФормы, Элемент, ЭтаФорма);
	
КонецПроцедуры

Процедура ДействияПанелиОкончаниеРедактированиеТабличногоПоля(Элемент, НоваяСтрока, ОтменаРедактирования)
	
	ТиповыеОтчеты.ОбновитьИзмененияТабличногоПоля(ЭлементыФормы, Элемент);
	
КонецПроцедуры

Процедура ДействияПанелиУдалениеСтрокиТабличногоПоля(Элемент)
	
	ТиповыеОтчеты.ОбновитьИзмененияТабличногоПоля(ЭлементыФормы, Элемент);
	
КонецПроцедуры
                                                              
Процедура ДействияПанелиКнопкаПодборНажатие(Элемент)
	ТиповыеОтчеты.ОбработкаНажатияКнопкиПодбор(ЭтотОбъект, ЭтаФорма, Элемент);
КонецПроцедуры

//Процедура ДействияПанелиИзменениеЗначенияДинамическогоПараметра(Элемент)
//	
//КонецПроцедуры

//Процедура ДействияПанелиНачалоВыбораЗначенияДинамическогоОтбора(Элемент, СтандартнаяОбработка)
//	
//КонецПроцедуры

//Процедура ДействияПанелиНачалоВыбораЗначенияТабличногоПоля(Элемент, СтандартнаяОбработка)
//	
//КонецПроцедуры

//Процедура ДействияПанелиНачалоВыбораЗначенияДинамическогоПараметра(Элемент, СтандартнаяОбработка)
//	
//КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////////////////////

//Процедура ПослеВыводаПанелиПользователя(ЗначениеНастроек) Экспорт
//	
//КонецПроцедуры

//Процедура ПриПолучениеНастроекПользователя(ЗначенияНастроек) Экспорт
//	
//КонецПроцедуры

//Процедура ПослеВыводаПериода(СтруктураЭлементовУправления) Экспорт
//	
//КонецПроцедуры

//Процедура ПослеВыводаПараметра(СтруктураЭлементовУправления) Экспорт
//	
//КонецПроцедуры

//Процедура ПослеВыводаГруппировки(СтруктураЭлементовУправления) Экспорт
//	
//КонецПроцедуры

//Процедура ПослеВыводаОтбора(СтруктураЭлементовУправления) Экспорт
//	
//КонецПроцедуры

Процедура ПриНажатииНаКнопкуВверх(Кнопка)
	Типовыеотчеты.ПриНажатииКнопкиВверхВниз(ЭтаФорма, ОтчетОбъект, Кнопка);
КонецПроцедуры

Процедура ПриНажатииНаКнопкуВниз(Кнопка)
	Типовыеотчеты.ПриНажатииКнопкиВверхВниз(ЭтаФорма, ОтчетОбъект, Кнопка);
КонецПроцедуры

//Процедура ДействияПанелиИзменениеФлажкаДопНастроек(Элемент)
//	 
//КонецПроцедуры

Процедура ПриЗакрытии()
	
	ТиповыеОтчеты.СохранитьНастройкиФормыОтчета(ОтчетОбъект, ЭтаФорма);
	
КонецПроцедуры

Процедура ГруппировкиПриПолученииДанных(Элемент, ОформленияСтрок)
	
	ТиповыеОтчеты.ГруппировкаПриПолученииДанных(Элемент, ОформленияСтрок);
	
КонецПроцедуры

Процедура ДействияПанелиДинамическийОтборПериодВыборПриИзменении(Элемент)
	
	ТиповыеОтчеты.ДействияПанелиДинамическийОтборПериодВыборПриИзменении(ЭтаФорма, Элемент)
	
КонецПроцедуры	
	
Процедура ДействияПанелиДинамическийОтборПериодВыборПриНачалеВыбораИзСписка(Элемент, СтандартнаяОбработка)
	
	ТиповыеОтчеты.ДействияПанелиДинамическийОтборПериодВыборПриНачалеВыбораИзСписка(ЭтаФорма, Элемент, СтандартнаяОбработка)
	
КонецПроцедуры	
	
Процедура ДействияПанелиДинамическийОтборПериодВыборАвтоПодборТекста(Элемент, Текст, ТекстАвтоПодбора, СтандартнаяОбработка) 
	
	ТиповыеОтчеты.ДействияПанелиДинамическийОтборПериодВыборАвтоПодборТекста(ЭтаФорма, Элемент, Текст, ТекстАвтоПодбора, СтандартнаяОбработка)
	
КонецПроцедуры	
	
Процедура ДействияПанелиДинамическийОтборПериодВыборОчистка(Элемент, СтандартнаяОбработка) 
	
	ТиповыеОтчеты.ДействияПанелиДинамическийОтборПериодВыборОчистка(ЭтаФорма, Элемент, СтандартнаяОбработка)
	
КонецПроцедуры	
	
Процедура ДействияПанелиДинамическийОтборПериодВыборОкончаниеВводаТекста(Элемент, Текст, Значение, СтандартнаяОбработка) 
	
	ТиповыеОтчеты.ДействияПанелиДинамическийОтборПериодВыборОкончаниеВводаТекстаОкончаниеВводаТекста(ЭтаФорма, Элемент, Текст, Значение, СтандартнаяОбработка)
	
КонецПроцедуры	

СоответствиеНастройкаРезультат = Новый Соответствие;

ДействияЭлементовФормы = Новый Структура;

ДействияЭлементовФормы.Вставить("ДействияПанелиДинамическийОтборПериодВыборПриИзменении", Новый Действие("ДействияПанелиДинамическийОтборПериодВыборПриИзменении"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДинамическийОтборПериодВыборПриНачалеВыбораИзСписка", Новый Действие("ДействияПанелиДинамическийОтборПериодВыборПриНачалеВыбораИзСписка"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДинамическийОтборПериодВыборАвтоПодборТекста", Новый Действие("ДействияПанелиДинамическийОтборПериодВыборАвтоПодборТекста"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДинамическийОтборПериодВыборОчистка", Новый Действие("ДействияПанелиДинамическийОтборПериодВыборОчистка"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДинамическийОтборПериодВыборОкончаниеВводаТекста", Новый Действие("ДействияПанелиДинамическийОтборПериодВыборОкончаниеВводаТекста"));

ДействияЭлементовФормы.Вставить("ОбработкаНажатияКнопкиСохраненнойНастройки", Новый Действие("ОбработкаНажатияКнопкиСохраненнойНастройки"));
ДействияЭлементовФормы.Вставить("ДействияПанелиСохранитьСписок", Новый Действие("ДействияПанелиСохранитьСписок"));
ДействияЭлементовФормы.Вставить("ДействияПанелиЗагрузитьСписок", Новый Действие("ДействияПанелиЗагрузитьСписок"));
ДействияЭлементовФормы.Вставить("ДействияПанелиСтандартныйПериодПользователяПриИзменении", Новый Действие("ДействияПанелиСтандартныйПериодПользователяПриИзменении"));
ДействияЭлементовФормы.Вставить("ДействияПанелиСтандартнаяДатаНачалаПользователяПриИзменении", Новый Действие("ДействияПанелиСтандартнаяДатаНачалаПользователяПриИзменении"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДатаСтандартногоПериодаПриИзменении", Новый Действие("ДействияПанелиДатаСтандартногоПериодаПриИзменении"));
ДействияЭлементовФормы.Вставить("ДействияПанелиДатаСтандартнойДатыНачалаПриИзменении", Новый Действие("ДействияПанелиДатаСтандартнойДатыНачалаПриИзменении"));
ДействияЭлементовФормы.Вставить("ДействияПанелиИзменениеЗначенияДинамическогоОтбора", Новый Действие("ДействияПанелиИзменениеЗначенияДинамическогоОтбора"));
//ДействияЭлементовФормы.Вставить("ДействияПанелиНачалоВыбораЗначенияДинамическогоОтбора", Новый Действие("ДействияПанелиНачалоВыбораЗначенияДинамическогоОтбора"));
//ДействияЭлементовФормы.Вставить("ДействияПанелиНачалоВыбораЗначенияТабличногоПоля", Новый Действие("ДействияПанелиНачалоВыбораЗначенияТабличногоПоля"));
ДействияЭлементовФормы.Вставить("ДействияПанелиОкончаниеРедактированиеТабличногоПоля", Новый Действие("ДействияПанелиОкончаниеРедактированиеТабличногоПоля"));
ДействияЭлементовФормы.Вставить("ДействияПанелиУдалениеСтрокиТабличногоПоля", Новый Действие("ДействияПанелиУдалениеСтрокиТабличногоПоля"));
ДействияЭлементовФормы.Вставить("ДействияПанелиКнопкаПодборНажатие", Новый Действие("ДействияПанелиКнопкаПодборНажатие"));
//ДействияЭлементовФормы.Вставить("ДействияПанелиИзменениеЗначенияДинамическогоПараметра", Новый Действие("ДействияПанелиИзменениеЗначенияДинамическогоПараметра"));
//ДействияЭлементовФормы.Вставить("ДействияПанелиНачалоВыбораЗначенияДинамическогоПараметра", Новый Действие("ДействияПанелиНачалоВыбораЗначенияДинамическогоПараметра"));
//ДействияЭлементовФормы.Вставить("ДействияПанелиИзменениеФлажкаДопНастроек", Новый Действие("ДействияПанелиИзменениеФлажкаДопНастроек"));
ДействияЭлементовФормы.Вставить("ПриНажатииНаКнопкуВверх", Новый Действие("ПриНажатииНаКнопкуВверх"));
ДействияЭлементовФормы.Вставить("ПриНажатииНаКнопкуВниз", Новый Действие("ПриНажатииНаКнопкуВниз"));
ДействияЭлементовФормы.Вставить("ГруппировкиПриПолученииДанных", Новый Действие("ГруппировкиПриПолученииДанных"));
