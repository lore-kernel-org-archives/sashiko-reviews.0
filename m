Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE35403126
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589285; cv=pass; b=KkKRzslvg/sSWlnTGZm54D6dWsr2rOOOkNskCUNvXDCcQ7UFe4vLzzoaMhhyIH+vteux2GKtKCLrXA4CJsYkcKjTWcBtQmxU86Uy12sVWklOMICBluFySe3SwEB7hfXjwzEF4VKbVtcAnv8wuMDG3CLooHdNGGpqA2Xdq0Nn44c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589285; c=relaxed/simple;
	bh=mekk8Qs9paOr/JOz+cCQQowV22V0kdNKPamGxe5W2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CC55xeVK2i9NWo1Elxz4bmyiiL2QNAQKaE4NFbY/v8tjoFvZgK08iMiDJisurF8SJAdOn0Q2DIFdydHNQCGnVozzjXbB/jfV05oOPc0zvkjs1b6uXw40dzK5/YTwlbSK5mBWDrfT6z1Oa0O0Usn5N5DpEKR4w/4NhEwlcJ2dIBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GhQqvYtA; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GhQqvYtA"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664cb440f9eso736439d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 02:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783589271; cv=none;
        d=google.com; s=arc-20260327;
        b=pDBvO+afYVY6WXpjhOKwWzStxbPfNBoPcl4Ri/FZ1k07gGlefcm2ZK4u14AT8ANBfK
         qxg16q8+K4QvlOZR921DNvnwpWF9t4u+sDXMwMYPF1IeMxLPTQry8QASrq/neB1Ha/DJ
         w/VsFfRackOWrp5jBpqDN6GK6I7ub7THDh+z8UimMSyDZ7kc2cV6Jwct5ysO0XNApDrE
         dFJkshaknzs3ALQk9N94m4/Jrh31HXTmXUeF8bZ1JCpOG1BqdC0G1Vdll2nIUC8UCVcZ
         EgYf7dIIA6yolBMiB71K90nbXcPBKdODUzToPg0UC8yzIc/U1Hl7x8R79RwCySz9TPXg
         Bwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        fh=Dcsate2Q5+LeS9EBFWreJHWg2I7PTdSXNFgEHIV76Us=;
        b=F4VYoudnVm6RYCdzSsy2gsAYkKe+xSONwUs8rodQ/xp/H23y5qxO/5iOIoj0cPTj48
         bRnsB9kN//zdTsVTbf4THQuzSo4/mKP/7UEXhvDj8RWbLZc9XvwHW3SGk0Lmst4ZtbKv
         dmCdR1pPITSIm8BRLIu57Ol4WVQfJjRqwKbrvIIVTwcTR+j3ncA1T9EGjVwKLqhjyteo
         FVQQHMgTyyWXfsdjleETChYz7I+UM/jtW1AwtgaLxRhbYbvGLwRyqsU/iN9+XKr9UNkG
         x4hpj6Z8GGQFsxPIxf0bxVoFoK9OZnR4rbbhxYx2y9EEFLNDD+90ktWa5x52Sp489yd9
         5gUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783589271; x=1784194071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=GhQqvYtAmyHsfAB+leSqUrLx1MQlkjGib2ZlIlqNRBiL6LJZPjpb7gJkqlvKrPJNhv
         8BJ5+HcYx1ygfuDst0Xs5jXWKXEB7kmb/N3T5E6u0w/DwuwNBRyJ8Y9uns/hTzkGh9T3
         aLC48MEk4Yzm+AY7hH7nb890w3jIw9QW3wMiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783589271; x=1784194071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=Zrasd1f3rtMRSDF0XZnSrzhagG3DxKE/fgGurDzG5giwipQlfVgphNw2c5QdcQMXMt
         9ZA2upSP9f34K8s2SHqd74QRhwRLBhsrFkyU/6Pi5N2XhJb/7Uv55/7oJ4mvdaPnDq6O
         ry1xIX+aV2gDKlqsEP3QlxMVRbUEf+Ti7szL4Pjbrk04FhcxDLTP3zsLhXNQOnzjcLp9
         tif0PEhYy4VTSd6q4nWuw6JzZGqPNdy5CRZe6pR1fBsPoX034CtpLweDngYmlxXXs5iK
         C84khj6YkPyYTqGOVHZj2SvvOGNlan+wCFkomYHOC8K6qqyM1YfBX87M7g8JLxeUyZY+
         y4UA==
X-Gm-Message-State: AOJu0Yzv9Q/uNMeXWqLgZn3AmZ8z2H7VlIyitND5SP0bLF5NaUGvW3iU
	Z+HxSEkiDVWMiMHcYevYZilK0BA47RldDQaJ7celdpMBhyFBXFV+bV0xQunofAUE8UcYvsbPWAc
	6z0xuOF+wlMHw2cilWNhdsEjW2tHit1R2XtvSx7ppN4sqGQTUNlHg4g==
X-Gm-Gg: AfdE7cn2ZOsd5Nz2vb+ztzSrNTA93BXE3h4/uJDIsKiuSZAG2jpZ5Zx272kjdnK5dtX
	iyjvSOVSa5MbPWui8U2/6LM1UJYV2kOQKXfTJm6xoDOwUBkDQu+/ih3h9AIVCMbsKk8sd1AiV9r
	jQ7p681X2vCLcTnTE6IOkHCrgRNKbRHAObMwrdJeyxK1L/5lww4wYRnv/fC5xaC1X4whx6wc57V
	qsQ0qWrDQ9bPYz/ponpmBQF7Oq8guRf1rF60I2UlvsPOPXI/F/L+B3BlHyPy6oqNfqmYg1WEnHB
	IMaYoKngrs68TjQIdQXfZX+S/5E=
X-Received: by 2002:a05:690e:134a:b0:667:b262:16bd with SMTP id
 956f58d0204a3-667b26234b2mr2825271d50.81.1783589271117; Thu, 09 Jul 2026
 02:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
In-Reply-To: <20260709083024.330381F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 17:27:39 +0800
X-Gm-Features: AUfX_mx_3xgToBgzkBmOX1DPVDvwVrzb4et6fk5WWd8Ysjgsr4mMAnsSLQdDprs
Message-ID: <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: sashiko-reviews@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315_PP=
 mode ganging in the regulator driver, causing silent cross-talk between th=
e CPU and EMI VDDQ regulators.
> - [Low] Grammatical error in the comment explaining the firmware workarou=
nd.
> --
>
> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319=
 PMIC ---
> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
>
> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> DRAM.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 8e423504ec052..af05315092f53 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> [ ... ]
> > @@ -1225,6 +1235,70 @@ &spi2 {
> >       status =3D "okay";
> >  };
> >
> > +&spmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spmi_pins>;
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     pmic@6 {
> > +             compatible =3D "mediatek,mt6319-regulator", "mediatek,mt6=
315-regulator";
> > +             reg =3D <0x6 SPMI_USID>;
>
> [Severity: High]
> Does this fallback compatible trigger incorrect mode ganging?
>
> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, which
> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> pp0600_emi_vddq.
>
> If a mode change happens on vbuck1 (which is allowed by the
> regulator-allowed-modes property), the driver will apply the ganged
> mask and silently overwrite vbuck4's mode bits in the PMIC, potentially
> forcing the RAM supply into an unexpected mode.
>
> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> lead to memory voltage instability?

This discrepency is actually bigger than Sashiko mentions. The ganging
supported by the driver only applies to the PMICs in the Asuarada design:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)

On the Cherry design we have:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+3+4 (big cores)

On the Corsola designs with beefier chips:

  - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused

On the Geralt design (this one):

  - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)

Any ideas on what to do about this mess?

Another thing is that I kind of wonder why the mode configuration register
setting isn't ganged in hardware like the enable and voltage settings.


Thanks
ChenYu

> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     /*
> > +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> > +                      *
> > +                      * However, this device originally shipped with a=
 broken
> > +                      * firmware that causes register reads over SPMI =
fail.
> > +                      * This is fixed in firmware version 15842.175.0,=
 which
> > +                      * is included in ChromeOS releases R150-16700.22=
.0 or
> > +                      * R151-16721.0.0 and later.
> > +                      *
> > +                      * Assigning the cpu-supply properties for CPU6 a=
nd CPU7
> > +                      * without the fix will likely cause CPU DVFS to =
stop
> > +                      * working. Hence the assignment is left out to a=
void a
> > +                      * regression of the function. If the user is con=
fident
> > +                      * that their system has the fix, they can added =
the
>
> [Severity: Low]
> This isn't a bug, but there is a typo in this comment. It should say
> "they can add the property themselves".
>
> > +                      * property themselves.
> > +                      */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928.61=
2294-1-wenst@chromium.org?part=3D1
