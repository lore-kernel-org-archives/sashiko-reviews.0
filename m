Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E13E1713
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672160; cv=pass; b=tffuOLE3/AQ2MpBOw9ZB5TYKMGO870SDurbBaXNo8aDjJWYA+fh3erohO5gyoxh2Ofty/SmIG/nHIItTodJpSZfnXeKc9YgsYHpZSWoUXfvDWeuSTXRFBkxUISZHmHNizkTJw+6343806OCo3/H87FlCAAHmHSzZlEWInXB4meE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672160; c=relaxed/simple;
	bh=p0/dPgVbPuapVdCqzOBsxdrszU2WBAq4JUc01Bho6Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKRyOcaacMxd2+JnWOkBqLBXlt+XOt6w9sDlMhTH8SjkNtwCPYBh9lj+ak/VFkW+3GxDR5x+tHHlb5yw+PExOeqza0jydFLD6Q2553wZU+wmrxXgoq0kHDyzaWBeEZG4wK2pgS2Zy7S064Qmt5JSyukEVRWQf6vhB6LY1EMg1ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lo02DXRd; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lo02DXRd"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6676fc59e59so936642d50.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783672157; cv=none;
        d=google.com; s=arc-20260327;
        b=fshxpiA0JfqfhUF2Ln2UTELsE3AEaCmgcL9NZIm8D6bZ1qY096IhyLBazK2ZHM8PX9
         E5G66RBDTFKaJjQkOgsiSpSj/rRagKTrRPFl3fz+dx1YKxn3TYvplrLAhmTc6TuOaxMh
         4oNPs3+vyqNqkWyqXSrrNbGg7m3ILXeVg2l+zPEDgf5VJjLME1ERLGs/V6FkqR2lFQkC
         nUQd4ipSNgEJbcdJ3wR0nSRZMwNUMLEwNq4GxTMKoBNOUi+XBjyNs5PYb+DVfB6c9bSG
         7ttQ67+Xb98wQkGGOEIDC/IlTtjAyk6XyMRZCmKrCHvxjHqnm0/qeimyfdGsdabcuCwQ
         LJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        fh=U2hNZTMdLm8sLN3Vq+RMr/a792gXEsw93VuPh9zEpWI=;
        b=gHxIWZICuNGhIoDBqGDNqidyIerREplvJz3LjTU7DlGgG2wmgF7rp+lKj8HWTh6HIS
         /sZyvZWF63HBSKkopaGt/XwdeP/0T+I+gTY4YB2YK1wdTKZwVgx+w/8C6ZUJzKzML0uS
         ZYW6trT+6eqs72GLHP31vk5+xpNN0AW+ABYL9LpuPXex3bDS7ljAWr7X3/MlqLg7zs24
         8rBxpLsTEavUYGOSfvll0lxDKu80Q1wVU9+wdGKvGCEXCQdWN5nNwXPy9RxrWJN53Qy+
         06WH/otuyW4XL/behR6yvXP+4mVRDlAWzr/OgM/cpNgC2AQkFUhzIFvEtyiQi+JDj2Ro
         UUVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783672157; x=1784276957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=lo02DXRdjan3D2Z3M3oAcVtFIeSBrlzJohlGMwqTKghrmPB4ItpLVWjynm7r3DyxhB
         B2iFXq2vJxcWFHhyi1C7bAJ5wrYuMpkJZSzIVdYug+08YqZSgwp6lD0HUkUaxtQtngHC
         1DvZOyPQAPmptHMJmy+zHoAREOHp3r+8exPg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672157; x=1784276957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=jiqZ/BsdAnT1FRQC5spGB7ZukQrK7FAtXSHKDi89GNJl1z+dyVDkl5eG3Ok7Ht0Q6A
         mG5DwESMVttcSLhanl3G/sBv43as2SUVjJSLowjVO3AyYMinY7d5Ne1OirR6nQJzkNb/
         /6K17RUUafw2fAFarSOC/yb0r4bdMYBPw5pQqwW3oCAj+y/zAT7AOUr2/HDOS/Iw/lBn
         ZXDCLL/ycSady3VknpczCotAFG3K7w+zt75InSmB6kSaKSj/Q4fzkajudUGu4nkiJPDY
         Fj1xXbL6f7HBEQ/7tH5Ua6BzAsoanN1aWSZPsi7LFKRuISWMu134bjRhV18dSYj08mM5
         ohjQ==
X-Gm-Message-State: AOJu0YzV0kiG8zCuSsQVvsD0W12zxxTF9uY5NPqA9Ve2WD1u2sZZlv65
	fj7o2HxaY3dMOsNEyzycLNHKullBIrfhuhBb8aE+fndU8dHmrlzdb1nQlO+WETXlOKNysdmTaPP
	Fj2sPylix7hQ+/jtz8T2VFoJQ7JZp5/R2+8043wR1
X-Gm-Gg: AfdE7cljLhw1vr1puSLRiTQt+y04tT4YV2M/DamRe7i4248jLaLlLpDDaVKE8c+oXDN
	kEzFWq0m2wnA1UsdksIr9/ZogcuGSKlQyOGpOrHy0klsRQ31Gd6u9u+1xujl1BrNQNPcm9nDsUo
	x7HJdCWNkwb+EKM3M318UY0GkfNCl0HxWIN9U64xKY1VxXXmcGlm7Lt8coGK8F/R7GBr0LaVFPF
	vt3eYJwuW7LJceyr7xvOJQFnJnX4O9l8GHWwQZMtnTkRBTJcAV3KAkAUvAdYF/AKigVhYOBsMQ=
X-Received: by 2002:a05:690e:d44:b0:667:8a32:fae1 with SMTP id
 956f58d0204a3-6679f0a52dcmr6501916d50.41.1783672157223; Fri, 10 Jul 2026
 01:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
 <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com> <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
In-Reply-To: <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Jul 2026 16:29:06 +0800
X-Gm-Features: AVVi8CckLfX-jPmLiB6-FBxM08KapSlFQ-lWffFShhwa4hHsSl2udMCCyyq6MUY
Message-ID: <CAGXv+5Ey+hvVZP-wu3-5oSwXQ9Rdxr8kf9BuiA-Qr3_px7uPGg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/9/26 11:27, Chen-Yu Tsai wrote:
> > On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315=
_PP mode ganging in the regulator driver, causing silent cross-talk between=
 the CPU and EMI VDDQ regulators.
> >> - [Low] Grammatical error in the comment explaining the firmware worka=
round.
> >> --
> >>
> >> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6=
319 PMIC ---
> >> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> >> Author: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
> >>
> >> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4=
X
> >> DRAM.
> >>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> index 8e423504ec052..af05315092f53 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >> [ ... ]
> >>> @@ -1225,6 +1235,70 @@ &spi2 {
> >>>        status =3D "okay";
> >>>   };
> >>>
> >>> +&spmi {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&spmi_pins>;
> >>> +     #address-cells =3D <2>;
> >>> +     #size-cells =3D <0>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     pmic@6 {
> >>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek,m=
t6315-regulator";
> >>> +             reg =3D <0x6 SPMI_USID>;
> >>
> >> [Severity: High]
> >> Does this fallback compatible trigger incorrect mode ganging?
> >>
> >> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, whic=
h
> >> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> >> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> >> pp0600_emi_vddq.
> >>
> >> If a mode change happens on vbuck1 (which is allowed by the
> >> regulator-allowed-modes property), the driver will apply the ganged
> >> mask and silently overwrite vbuck4's mode bits in the PMIC, potentiall=
y
> >> forcing the RAM supply into an unexpected mode.
> >>
> >> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> >> lead to memory voltage instability?
> >
> > This discrepency is actually bigger than Sashiko mentions. The ganging
> > supported by the driver only applies to the PMICs in the Asuarada desig=
n:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)
> >
> > On the Cherry design we have:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+3+4 (big cores)
> >
> > On the Corsola designs with beefier chips:
> >
> >    - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused
> >
> > On the Geralt design (this one):
> >
> >    - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)
> >
> > Any ideas on what to do about this mess?
>
> wenst, I think that the only way to fix that properly is to add generic s=
upport
> for buck phases ganging in the regulator API... because AFAIK there's not=
hing
> right now.
>
>  From what I remember from last time I looked, MediaTek PMICs wouldn't be=
 the
> only ones, there's something else that also has ganged bucks, and again i=
f I
> remember correctly, I remember seeing one platform data struct for each o=
f the
> ganging combinations in that driver.

Grepping through the kernel tree, I see LP8755 and TPS6594 having multiphas=
e
settings. Not sure which one you saw. Also, some of the X-powers PMICs used
with Allwinner Socs also support multiphase. For these we currently just
read out the multi-phase setting from the PMIC and don't register the
regulators for the secondary phases; however it seems with some recent
project, we actually need to program the ganging from the kernel [1].

> So.. especially because MTK wouldn't be the first, I think the addition o=
f some
> kind of generic properties (and callbacks) for this kind of configuration=
 in
> the API would be both profitable and welcome.
>
> Mark, any considerations?

Quoting Mark's response:

> > Unlike separate regulators that are ganged together, in the AXP PMICs i=
t
> > seems that when buck outputs are ganged, only the controls for the firs=
t
> > output have any actual effect. In such cases I don't know if we should
> > just ignore / leave out the secondary outputs from both the description
> > and the runtime state.
>
> This is very common, I would expect any regulators that are ganged
> together into a single regulator like this to simply not appear in the
> DT.

So if specifying polyphase settings from the DT is needed, it would
probably be some custom property, either under the primary phase, or
at the chip level. (Because the secondary phases would be absent from
the DT, one can't just reference them using a generic property.)


ChenYu


[1] https://lore.kernel.org/linux-sunxi/20250919000020.16969-1-andre.przywa=
ra@arm.com/

> Cheers,
> Angelo
>
> >
> > Another thing is that I kind of wonder why the mode configuration regis=
ter
> > setting isn't ganged in hardware like the enable and voltage settings.
> >
> >
> > Thanks
> > ChenYu
> >
> >>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>> +
> >>> +             regulators {
> >>> +                     /*
> >>> +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> >>> +                      *
> >>> +                      * However, this device originally shipped with=
 a broken
> >>> +                      * firmware that causes register reads over SPM=
I fail.
> >>> +                      * This is fixed in firmware version 15842.175.=
0, which
> >>> +                      * is included in ChromeOS releases R150-16700.=
22.0 or
> >>> +                      * R151-16721.0.0 and later.
> >>> +                      *
> >>> +                      * Assigning the cpu-supply properties for CPU6=
 and CPU7
> >>> +                      * without the fix will likely cause CPU DVFS t=
o stop
> >>> +                      * working. Hence the assignment is left out to=
 avoid a
> >>> +                      * regression of the function. If the user is c=
onfident
> >>> +                      * that their system has the fix, they can adde=
d the
> >>
> >> [Severity: Low]
> >> This isn't a bug, but there is a typo in this comment. It should say
> >> "they can add the property themselves".
> >>
> >>> +                      * property themselves.
> >>> +                      */
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928=
.612294-1-wenst@chromium.org?part=3D1
>
