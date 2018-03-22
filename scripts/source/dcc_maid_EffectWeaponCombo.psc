ScriptName dcc_maid_EffectWeaponCombo extends ActiveMagicEffect

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String[] Property ComboList1 Auto
String[] Property ComboList2 Auto
String[] Property ComboList3 Auto
String[] Property ComboList4 Auto

Spell Property Action1 Auto
Spell Property Action2 Auto
Spell Property Action3 Auto
Spell Property Action4 Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Property ComboNumber = -1 Auto Hidden
Int Property ComboStage = 0 Auto Hidden

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnEffectStart(Actor Who, Actor From)
	self.ResetCombo()
	self.RegisterForEvents(Who)
	Return
EndEvent

Event OnEffectFinish(Actor Who, Actor From)

	Return
EndEvent

Event OnAnimationEvent(ObjectReference What, String EventName)

	String InputName = self.GetInputEventName(EventName)
	Int Found = 0
	Int FoundCombo = 0

	If(self.ComboStage < self.ComboList1.Length)
		If(InputName == self.ComboList1[self.ComboStage])
			Found += 1
			FoundCombo = 1
			Return
		EndIf
	EndIf

	If(self.ComboStage < self.ComboList2.Length)
		If(InputName == self.ComboList2[self.ComboStage])
			Found += 1
			FoundCombo = 2
			Return
		EndIf
	EndIf

	If(self.ComboStage < self.ComboList3.Length)
		If(InputName == self.ComboList3[self.ComboStage])
			Found += 1
			FoundCombo = 3
			Return
		EndIf
	EndIf

	If(self.ComboStage < self.ComboList4.Length)
		If(InputName == self.ComboList4[self.ComboStage])
			Found += 1
			FoundCombo = 4
			Return
		EndIf
	EndIf

	;;;;;;;;

	If(Found == 0)
		If(self.ComboStage > -1)
			self.ResetCombo()
		EndIf
		Return
	EndIf

	;;;;;;;;

	If(Found == 1) 
		self.ComboStage += 1
		self.ComboNumber = FoundCombo

		If(self.ComboList[self.ComboNumber])

		Return
	EndIf

	Return
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function GetInputEventName(String EventName)

	If(EventName == "AttackPowerForward_FXstart")
		Return "up"
	ElseIf(EventName == "AttackPowerBackward_FXstart")
		Return "down"
	ElseIf(EventName == "AttackPowerLeft_FXstart")
		Return "left"
	ElseIf(EventName == "AttackPowerRight_FXstart")
		Return "right"
	ElseIf(EventName == "AttackPowerStanding_FXstart")
		Return "stand"
	EndIf

	Return
EndFunction

Function RegisterForEvents(Actor Who)
	self.RegisterForAnimationEvent(Who,"AttackPowerStanding_FXstart")
	self.RegisterForAnimationEvent(Who,"AttackPowerRight_FXstart")
	self.RegisterForAnimationEvent(Who,"AttackPowerLeft_FXstart")
	self.RegisterForAnimationEvent(Who,"AttackPowerBackward_FXstart")
	self.RegisterForAnimationEvent(Who,"AttackPowerForward_FXstart")
	Return
EndFunction

Function UnregisterForEvents(Actor Who)
	self.UnregisterForAnimationEvent(Who,"AttackPowerStanding_FXstart")
	self.UnregisterForAnimationEvent(Who,"AttackPowerRight_FXstart")
	self.UnregisterForAnimationEvent(Who,"AttackPowerLeft_FXstart")
	self.UnregisterForAnimationEvent(Who,"AttackPowerBackward_FXstart")
	self.UnregisterForAnimationEvent(Who,"AttackPowerForward_FXstart")
	Return
EndFunction

Function ResetCombo()
	self.ComboStage = -1
	self.ComboNumber = -1
	Return
EndFunction
