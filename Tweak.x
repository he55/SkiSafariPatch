/*
// Namespace:
public class Profile // TypeDefIndex: 2129
{
	// Fields
	private int m_coins; // 0x18

	// Methods

	// RVA: 0xFD7A4 Offset: 0xFD7A4 VA: 0x1000FD7A4
	public void .ctor(string udid) { }

	// RVA: 0xFE860 Offset: 0xFE860 VA: 0x1000FE860
	public int get_Coins() { }

	// RVA: 0xFE868 Offset: 0xFE868 VA: 0x1000FE868
	public void set_Coins(int value) { }
}

// Namespace:
public class GUIShopCoinButton : GUIButton // TypeDefIndex: 2052
{
	// Fields
	public GUIShopTabButton productTabButton; // 0x60
	public int productItemIndex; // 0x68
	public GameObject clickEffectPrefab; // 0x70
	public GameObject coinCountText; // 0x78
	private GameObject m_clickEffect; // 0x80

	// Methods

	// RVA: 0xBC0D0 Offset: 0xBC0D0 VA: 0x1000BC0D0
	public void .ctor() { }

	// RVA: 0xB5858 Offset: 0xB5858 VA: 0x1000B5858
	public void OnBuyFail() { }

	// RVA: 0xBC0D8 Offset: 0xBC0D8 VA: 0x1000BC0D8
	private void ShowClickEffect() { }

	// RVA: 0xBC1AC Offset: 0xBC1AC VA: 0x1000BC1AC Slot: 4
	public override void Click(Vector3 position) { }

	// RVA: 0xBC2B0 Offset: 0xBC2B0 VA: 0x1000BC2B0 Slot: 7
	protected override void OnActivate() { }
}
*/

#include <mach-o/dyld.h>
#include <substrate.h>

struct UnityEngine_Vector3_Fields {
    float x;
    float y;
    float z;
};

struct UnityEngine_Vector3_o {
    struct UnityEngine_Vector3_Fields fields;
};


void *profile_o;

int32_t (*Profile__get_Coins) (void* __this, const void* method);
void (*Profile__set_Coins) (void* __this, int32_t value, const void* method);


void (*Profile___ctor) (void* __this, void* udid, const void* method);
void new_Profile___ctor (void* __this, void* udid, const void* method) {
    if (!profile_o) {
        profile_o = __this;
    }
    Profile___ctor(__this, udid, method);
}

void (*GUIShopCoinButton__Click) (void* __this, struct UnityEngine_Vector3_o position, const void* method);
void new_GUIShopCoinButton__Click (void* __this, struct UnityEngine_Vector3_o position, const void* method) {
    if (profile_o) {
        int32_t coins = Profile__get_Coins(profile_o, NULL) + 1000;
        Profile__set_Coins(profile_o, coins, NULL);
    }
}

%ctor {
    intptr_t slide = _dyld_get_image_vmaddr_slide(0);
    Profile__get_Coins = (void *)(slide + 0x1000FE860);
    Profile__set_Coins = (void *)(slide + 0x1000FE868);

    MSHookFunction((void *)(slide + 0x1000FD7A4), (void *)new_Profile___ctor, (void **)&Profile___ctor);
    MSHookFunction((void *)(slide + 0x1000BC1AC), (void *)new_GUIShopCoinButton__Click, (void **)&GUIShopCoinButton__Click);
}
