﻿
Процедура ПриКомпоновкеРезультата(ДокументРезультат, ДанныеРасшифровки, СтандартнаяОбработка)
	СпНоменклатуры=КомпоновщикНастроек.Настройки.ПараметрыДанных.НайтиЗначениеПараметра(Новый ПараметрКомпоновкиДанных("СпНоменклатуры"));
	СпНом=Новый СписокЗначений;
	Выборка=Справочники.Номенклатура.Выбрать(Справочники.Номенклатура.НайтиПоКоду("00000000129"));
	Пока Выборка.Следующий() Цикл
		Если не Выборка.ПометкаУдаления Тогда
			СпНом.Добавить(Выборка.Ссылка);
		КонецЕсли;
	КонецЦикла;
	СпНоменклатуры.Значение=СпНом;
	СпНоменклатуры.Использование=Истина;
КонецПроцедуры
