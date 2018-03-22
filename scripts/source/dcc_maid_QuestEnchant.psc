Scriptname dcc_maid_QuestEnchant extends Quest
{make the buttplugs enchantable by appending the plug keyword to the
enchantment form lists.}

FormList Property dcc_maid_ListEnchantLists Auto
{list of lists i want to edit.}

Keyword Property dcc_maid_KeywordArmorEnchant Auto
{what i want to inject.}

Event OnInit()

	Int Count = dcc_maid_ListEnchantLists.GetSize()
	FormList Current = None
	Bool Added = FALSE

	While(Count > 0)
		Count -= 1
		Current = dcc_maid_ListEnchantLists.GetAt(Count) as FormList

		If(Current && !Current.HasForm(dcc_maid_KeywordArmorEnchant))
			Current.AddForm(dcc_maid_KeywordArmorEnchant)
			Added = TRUE
		EndIf
	EndWhile

	If(Added)
		Debug.Notification("Maid pieces should be enchantable now.")
	EndIf

	Return
EndEvent
