﻿Перем ЗначениеНеЗаполнено;

Процедура ВыбратьДаты(ДатаНач,ДатаКон)
	НастройкаПериода = Новый НастройкаПериода;
	НастройкаПериода.РедактироватьКакИнтервал = Истина;
	НастройкаПериода.РедактироватьКакПериод = Истина;
	НастройкаПериода.ВариантНастройки = ВариантНастройкиПериода.Период;
	НастройкаПериода.УстановитьПериод(ДатаНач, ?(ДатаКон='0001-01-01', ДатаКон, КонецДня(ДатаКон)));
	Если НастройкаПериода.Редактировать() Тогда
		ДатаНач= НастройкаПериода.ПолучитьДатуНачала();
		ДатаКон= НастройкаПериода.ПолучитьДатуОкончания();
	КонецЕсли;
КонецПроцедуры

Процедура ДанныеДляСравненияСценарийПриИзменении(Элемент)
	Если ЗначениеНеЗаполнено И ЗначениеЗаполнено(Элемент.Значение) Тогда
		ВыбратьДаты(ЭлементыФормы.ДанныеДляСравнения.ТекущаяСтрока.ДатаНач,ЭлементыФормы.ДанныеДляСравнения.ТекущаяСтрока.ДатаКон);
	КонецЕсли;
КонецПроцедуры

Процедура ДанныеДляСравненияСценарийНачалоВыбора(Элемент, СтандартнаяОбработка)
	ЗначениеНеЗаполнено=Не ЗначениеЗаполнено(Элемент.Значение);
КонецПроцедуры

Процедура ОсновныеДействияФормыГотово(Кнопка)
	Оповестить("СценарииВыбраны",,ЭтаФорма);
	Закрыть();
КонецПроцедуры
