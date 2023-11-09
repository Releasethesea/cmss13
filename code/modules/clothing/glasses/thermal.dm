
// thermal goggles

/obj/item/clothing/glasses/thermal
	name = "Optical Thermal Scanner"
	gender = NEUTER
	desc = "Thermals in the shape of glasses."
	icon_state = "thermal"
	item_state = "glasses"
	toggleable = TRUE
	vision_flags = SEE_MOBS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	darkness_view = 12
	invisa_view = 2
	eye_protection = EYE_PROTECTION_NEGATIVE
	deactive_state = "goggles_off"
	fullscreen_vision = /atom/movable/screen/fullscreen/thermal
	var/blinds_on_emp = TRUE

/obj/item/clothing/glasses/thermal/emp_act(severity)
	. = ..()
	if(blinds_on_emp)
		if(istype(src.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/M = src.loc
			to_chat(M, SPAN_WARNING("The Optical Thermal Scanner overloads and blinds you!"))
			if(M.glasses == src)
				M.SetEyeBlind(3)
				M.EyeBlur(5)
				if(!(M.disabilities & NEARSIGHTED))
					M.disabilities |= NEARSIGHTED
					spawn(100)
						M.disabilities &= ~NEARSIGHTED


/obj/item/clothing/glasses/thermal/syndi //These are now a traitor item, concealed as mesons. -Pete
	name = "Optical Meson Scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	deactive_state = "degoggles"
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/thermal/syndi/bug_b_gone
	name = "Bug-B Gone Thermal Goggles"
	gender = PLURAL
	desc = "For all your bug hunting needs!"
	icon_state = "rwelding-g"
	deactive_state = "rwelding-gup"

/obj/item/clothing/glasses/thermal/monocle
	name = "Thermoncle"
	desc = "A monocle thermal."
	icon_state = "thermoncle"
	flags_atom = null //doesn't protect eyes because it's a monocle, duh
	toggleable = FALSE
	flags_armor_protection = 0

/obj/item/clothing/glasses/thermal/eyepatch
	name = "Optical Thermal Eyepatch"
	desc = "An eyepatch with built-in thermal optics"
	icon_state = "eyepatch"
	item_state = "eyepatch"
	toggleable = FALSE
	flags_armor_protection = 0

/obj/item/clothing/glasses/thermal/jensen
	name = "Optical Thermal Implants"
	gender = PLURAL
	desc = "A set of implantable lenses designed to augment your vision"
	icon_state = "thermalimplants"
	item_state = "syringe_kit"
	toggleable = FALSE

/obj/item/clothing/glasses/thermal/empproof
	desc = "Thermals in the shape of glasses. This one is EMP proof."
	blinds_on_emp = FALSE
