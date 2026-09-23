Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E5497B6E
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162555; cv=pass; b=t5rWMsevyE+exwH+2DK8L78DIk4YqLsbAlXSfs+DxXEcaQh1b8fK2+hkLO6WRo/6LJtrhJvcLV5stqqr2L14l4nOtdteSdDpb328vHwYu4ISfaB4tPnpl4IJ+wV3IBOqPHBuGrVZNBo3/TywBFzw5YAztDvqeOfUni+LXKoVCG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162555; c=relaxed/simple;
	bh=aslJG+w3cMQHAWQW9rbg0eDe2JUIpTkkt1yvgS0DwGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ3EqaMWSmFFd5IRBAdQVYAo1rESxJteTnhwgBv0g0tSjsExtUBZbWgOvSCYZbLMQkFxbCB/NPOHNtSsR0XT2hUhH13qe4r0ugTjvLlVBCnwjJv+7UsXpIEpq0gD32KMRUYKxaAg3E1sDka+is0/+ZxWB08n3TKEqhl1f9y9nKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3cxrTVv; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3cxrTVv"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76906adso15682101cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162553; cv=none;
        d=google.com; s=arc-20260327;
        b=iA+KC3CZgk7MKReVrib8jtjVocy0uBFFjf91EGQQkS3t8T1AfSEqV2jfXAIOjmqyKh
         YFrsQz+6Y9lTuTVUm2PvBZYLoFN203p2+RryDKW10VfoeVhFQvJOP/mFlNSzM8aatJNX
         H1ngYTJlQvuS1s1XREEWqMVjOyAX5Gu0gN0GzClst8+JLtdvhCoYrhyWHESarS7zLLUy
         LmmqMLp8GosVj8xDXB8nGHPrUyCt0MGkpjJJli8EXiBTC7uLuvcNerDP9qkQNQDqqOA0
         a9fageCr9VP64kTEu9b9pjH2xBWPJJM/U82WXX2rLPsEa1GFvl7Elxl7wQK/GBei202L
         zn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        fh=mDAuwFAhs2mIusZI9ah3F5O0wx0xm7KPAs+ghUnUShY=;
        b=o13Ih/wYGREtBWRoZ9SuYUJ/09VL8g5SZWEr9GBrLmMXmXIt6MrGc3LNQGVwQh2dnH
         K8n8JbTGUpR4wlCb5wVX6X6+jGlkgIqNY8YwkJ3eTqpdlKBnoz/McmS+sM5h/CGoGJXf
         iPYEL2F4y7Pz96hV2qgxjdwtgusagTgxrAhni3RMLd9zMZeF4TBkl5acURL18D0XeVkZ
         P5u9q0Zo/JcPsQidOQUp7/zywhL7O2u42xDcAfB23J45hG87eA50PyHumIM8ZQGg2OXE
         weCZC/FjAx5M0hG9lUmGo1487vruVI/YBPvjx9IraEeg/YDACJxx2cvydSdxsdLgQq+w
         DMmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162553; x=1790767353; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=h3cxrTVvBWJoCwGWK6QLhJAwVME5yQpXue8jWh3iCyltNaN+hk/JZ42vpLcL3BZhl0
         g0lt7kA8S2wpFzuHOahM6beyl95yZPLLLZSq78huR+x8RoFAJ2uum63Ust+9wTw522V3
         +1ykb78ppABfkn/E+2+2W5OcSG3iu2abgw7MZhUZDJDWJpS520U2suw3U3Scspe0h0Hr
         MvDuqxpCtofCUolTAF18YFYafNMaQypJAK/gebsxjGCZj0J+P/jKD1+uBpZPScIjWhNr
         I9BE69VUa1hqjpPaTMhS4gowbZz65E6DxmqyMpQbVs+n69NYWgkaufFBVeDn1HnlFb+c
         sIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162553; x=1790767353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=JOqkB12VuGsvKaGxGwChOpiI6ad14brp6vyjxUmCj/CqRTjeCzI0eEcFwXh3c0Gycw
         a4iES04aT6vkUM6fzpVD+TDlvUEqo/uwvxssFl0+4BY0bvWab0RzcVtbNqDI4/hpTjGA
         kMWtJMnS5XrH0i//F2Ita+Rg/ys1b48UPlC5rT//yevrNiOclF8YL8kyTiIXlWbjDWJ7
         03CWUMOWuzHVyVi7M0RfD32wBhECeJ65k4IlUfcDWdS1K/OtW7Y/tafXSu1AVYF6Y5Aj
         2Wjtjc6BB5uj/6iBj8Z0QanW7W/arNDQwNMUCDu5ds0pKXOwaE31exLL4vl/BJxnDRGg
         +SPg==
X-Gm-Message-State: AFuF++mEY6u45OKPVjBkyr1X1E6wBcUNPIV9uBM76+8d2/6OFNvSx6/S
	aue4/bNp0HiNBEjE3bP7ff51AHkh847Nq7Ye5c0CligrD8z6i9HKDBbZ0EtWXZEDcrVzJPKYVWl
	LvBGzUvKfOJwJJOS3O80ArR0taxU9avMoAoX+3wzJQ8V+
X-Gm-Gg: AYBFou1Vths8LINCYnuc+hj6uhSTHdZJ+mC2MQhIXckXCZ4wYLcpWmVMd1gIyx3Qh+7
	atJw8IHTBrMzqsju8K4yJxO+G8/rIxHvNKRfVsbvwrDctoV7fhBy9f4kbrdyaHuOyGBHlR5tmRa
	O+Wb0zulLwEuiGGgYIEPYtiZv9UAbzrbNODJshslHauGOFql9d0kuuJjGot254RsTIPOj2PO3gL
	9txBXWFAK9QKkagQKdFNcxtTMs4aK5SXvIr7NZKlVeisne+uS+9RgtYAkz4JjysYc5eZKNQy7Z6
	WO7EpWJjvcosrn+87sInL6XPvcIB+oKulniwimInjuo1r1vnkEJi23z84Q==
X-Received: by 2002:a05:6214:2e48:b0:912:5ac0:861f with SMTP id
 6a1803df08f44-9140c1b0f18mr35187016d6.0.1790162552706; Wed, 23 Sep 2026
 04:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
 <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
In-Reply-To: <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:22:21 +0500
X-Gm-Features: AclHuK-G7kblUAb1JNixL0kLwSeuWnesiMXkdWuZUry8w7-I-stza3Or0Pd8q9U
Message-ID: <CANHPwASywA3B6M+q8STWrVbknjXHywu8jp9ePS-DdqgAVv-v9g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion boar=
d.


=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:1=
1, =D0=92=D0=BB=D0=B0=D0=B4 =D0=A1=D0=92=D0=9D <anykey196@gmail.com>:
>
> Thanks for the review - you are right. The two buttons and the IR receive=
r are on the optional 24-pin expansion board. With the board detached the L=
RADC input and the IR receiver pin are undriven and float, which can lead t=
o phantom key presses and interrupt storms.
>
> v2 drops them from the base board .dts and provides them as a devicetree =
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry, fol=
lowing the existing sun8i-orangepi-zero-interface-board.dtso approach.
>
> Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion bo=
ard.
>
> =D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 15=
:59, <sashiko-bot@kernel.org>:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] arm64: dts: unconditionally enabling optional expansion board r=
isks phantom inputs and IRQ storms
>> --
>>
>> commit 51b58a06db4b29809dc98ff86ac9cae923d63f7c
>> Author: Vladnwx <vladnwx@users.noreply.github.com>
>>
>> arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion butto=
ns and IR
>>
>> This commit adds device tree nodes for the LRADC buttons and IR receiver=
 on
>> the OrangePi Zero 2W. It maps the buttons to KEY_1 and KEY_ENTER and ena=
bles
>> both the LRADC and IR controller hardware.
>>
>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > index ff9b40352a545..1b690e3cd041e 100644
>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> [ ... ]
>> > @@ -189,3 +190,31 @@ &usbphy {
>> >       usb1_vbus-supply =3D <&reg_vcc5v>;
>> >       status =3D "okay";
>> >  };
>> > +
>> > +/*
>> > + * Buttons and IR receiver on the optional 24-pin expansion board.
>> > + * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
>> > + */
>> > +&lradc {
>> > +     vref-supply =3D <&reg_vcc3v3>;
>> > +     status =3D "okay";
>>
>> [Severity: High]
>> Could unconditionally enabling the optional LRADC on the base board caus=
e
>> phantom key presses? If the 24-pin expansion board is not attached, it s=
eems
>> the floating LRADC pin could drift into the configured 1.0V/1.6V voltage
>> thresholds and trigger unexpected button presses for users out of the bo=
x.
>> Should this be enabled via a device tree overlay instead?
>>
>> > +     wakeup-source;
>> > +
>> > +     button-1000 {
>> [ ... ]
>> > +     button-1600 {
>> > +             label =3D "KEY_ENTER";
>> > +             linux,code =3D <KEY_ENTER>;
>> > +             channel =3D <0>;
>> > +             voltage =3D <1600000>;
>> > +     };
>> > +};
>> > +
>> > +&ir {
>> > +     status =3D "okay";
>> > +};
>>
>> [Severity: High]
>> Does unconditionally enabling the IR receiver risk interrupt storms? If =
the
>> optional board is missing, a floating IR RX pin lacking an internal pull=
-up
>> might pick up electrical noise and oscillate rapidly. This could severel=
y
>> degrade system performance. Would it be safer to relegate this to an ove=
rlay
>> rather than the base device tree?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105208.1=
98-1-anykey196@gmail.com?part=3D1
