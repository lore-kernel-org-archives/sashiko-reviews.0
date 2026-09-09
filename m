Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8037DABC
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975863; cv=none; b=s/H1UG4+T+MKico2kbPKxrIBqt8gSreI1WYLTEXL/6kAUOFn4Oq+orBbvnYxjLUJBa17489Q47Uz7smFzX0oJrPjaoaV5KGwlv3a2pivJqgJBQO5sIbMk+ERQ5WIbIX7lx4uNNrR62a7AGzMCIEC9waT75PBvXEyRH+WKA2rWJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975863; c=relaxed/simple;
	bh=BBPSyJ7/hKXWiuHVdl/yyotbkQPjOBm7iSx2qGqswU4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JXHv+f+l2cZ2Yrx4i5ZSuGiSUpSLuuyHuuXifj22ebZHIEei87f8DB9rGMPuMNl9NGUdvbmYvisWjZxABB0WyvzmRwPAnckCAmcq9cwTBvkRqxVaeaamnmpchjZ7/OQUP98FH9U+UVGuhX3+TuHlykjYqug5lwo8EhIC3vaHzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UduXZFYS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UduXZFYS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso60447165e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975860; x=1789580660; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIx/jY7x22dvjb/1ZwlMJ+Vl85YQ/K+5ndS2MKjSdMc=;
        b=UduXZFYSmUahhseO1TdKOHHXKiFgRhi67VOcZrgyjU3WGYzKfY2IOAbVr3VIeY/xm/
         7S2Yzmehwh3rXK+3V8AajqovKAD/sCD6lQh3OKrPKTI+wV+aobS1YsqW0tMOKkfuwSeB
         TUfx805FZE3/xctFV2+3heGO8hXsVu9l8dDyjoWnYIHb2t+SjAXREsQfGuqhK4PXKQV3
         txNHcnCeyciMCHyiolRWfiOQmhxk3u6MrN0tl647Jv4qTCQGOK8jriTNRPGhH4Mo+vJr
         F+xmFEHEWKvSGngPof81DmwNlLqeE5+yH2x8mz7tX6bAfR5UT4r6Vea7ioFwEWcT6vAK
         CMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975860; x=1789580660;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIx/jY7x22dvjb/1ZwlMJ+Vl85YQ/K+5ndS2MKjSdMc=;
        b=Y8O3aqM1NJvt0BvcPGXN7SsThPwFC2RhIdpsMmZFe9tZ1VWeAl+tnrjs0rRsidL4wy
         WX81Fv+g9wlyqbBN39k+SUxvzdNyHw0OC6T/TCTRrD7lqO6Y5QjPfK3EOhcBhzLCkz4u
         +P6j+9z4v/HtwAmM9DRwcnfqvnCYhFR90k5XW2dantUaBrDWkF9LnlcqwwN8qZr/voTK
         L5esHxYbANhE5j8f9tu8zBDOhFPZhbW4VnGT1Ukpl5Jbs+k6uyPtCTpLdFRiZltJUjEe
         6fppLTuQv6dF4BVOgZFLDkvQr3d/wzryeRVlpcoxL5oFmYz970QTh9T9jfP/FJ9MHyFc
         kMnQ==
X-Gm-Message-State: AFuF++nhOmTBqApTP+WMadtwz2VJqecsoEr5+EJyO9PLNjbLquRhPI1O
	AIzWplACghasjnTlgnWSK3SJHc7kwGW74rCxfvpUc5gac0l5TEoVo6YPEmt17lSi
X-Gm-Gg: AYBFou33WvUGIu1JCRtXK86qkiFFfsN4ZDvQNOid9e71JcschTrKzDLrWn9VguPfRRA
	sw1hiEtZJV7QiOQoMpxehMMK37vXfeM1Wxsjk3fpTyFQdlzXLMXAlzWIH/xD2mQ0p8yhtYQ1sL7
	kh45RQ/Px4SebPC9WeVUwKGYOvHKITUPhOVQ1lfKI0xgv1zFHMLc78pUoRx8+vCnVmqFsHA4VXo
	nUTD0KzSIIOkIgdbJkG0Bk+WcjpuzFVBdr1n1MpoBAs0nFg4S9ZG3IgmDel1gWPmCRYf5hu6vVJ
	HbrtK+F2Nhi2evB2TCd3k5VottlsDZ537s10w3M4nlVighxIv6E7+ULO9r6rMnygjjIIhUzbW+9
	a2JCVIRjttrd0mM9czzFiS2QMAxdY41mctt2M6ksmERrjH419Ob02RfPVWcTJenmT42olz5GTU2
	CgelKRbWyoCNAKhmXB6w+ZYadDaVEQtWROXV7AN4Oj9QhQhO2zZC+D3PDKpanWxPCBCW65cAI1/
	TGFFUToY3MMR0SwvFZbUk6BpKQshO6HjlsxJHDSrLlsVpV19KR7KEa1cA==
X-Received: by 2002:a05:600c:4e8f:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49cfa20cd1fmr333869075e9.19.1788975859551;
        Wed, 09 Sep 2026 10:44:19 -0700 (PDT)
Received: from localhost (89-74-4-99.dynamic.play.pl. [89.74.4.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be649asm6608365e9.5.2026.09.09.10.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:44:18 +0200
Message-Id: <DLAZ0JNOMKUB.3CMZBD3WTR5NG@gmail.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sm8350-sony-xperia-sagami: enable
 UFS
From: "Jan Paszkowski" <jan.m.paszkowski@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Jan Paszkowski"
 <jan.m.paszkowski@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909172421.33593-1-jan.m.paszkowski@gmail.com>
 <20260909172421.33593-2-jan.m.paszkowski@gmail.com>
 <20260909173032.240941F000FF@smtp.kernel.org>
In-Reply-To: <20260909173032.240941F000FF@smtp.kernel.org>

On Wed Sep 9, 2026 at 7:30 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Duplicate Device Tree property `vcc-max-microamp` overwrites the=
 intended value and leaves `vccq-max-microamp` unconfigured.
> --
>
> commit c3bcdc386d74df860f7d4d12d1aed983ad46ea5d
> Author: Jan Paszkowski <jan.m.paszkowski@gmail.com>
>
> arm64: dts: qcom: sm8350-sony-xperia-sagami: enable UFS
>
> This commit enables UFS on the sm8350-sony-xperia-sagami device, noting
> that previous device-killing bugs seem to be resolved.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/a=
rch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> index 4b62ee50da7be..969c8cb31df9f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
>> @@ -893,9 +893,20 @@ sdc2_card_det_sleep: sd-card-det-sleep-state {
>
> [ ... ]
>
>> -/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
>> -&ufs_mem_hc { status =3D "disabled"; };
>> -&ufs_mem_phy { status =3D "disabled"; };
>> +&ufs_mem_hc {
>> +	status =3D "okay";
>> +	reset-gpios =3D <&tlmm 203 GPIO_ACTIVE_LOW>;
>> +	vcc-supply =3D <&pm8350_l7>;
>> +	vcc-max-microamp =3D <800000>;
>> +	vccq-supply =3D <&pm8350_l9>;
>> +	vcc-max-microamp =3D <900000>;
>
> [Severity: High]
> Does this mistakenly define vcc-max-microamp twice instead of configuring
> vccq-max-microamp for the pm8350_l9 supply?
>
> Because the property name is duplicated, the device tree compiler will
> overwrite the initial 800,000 uA value with 900,000 uA, leaving the vccq
> regulator without its intended maximum microamp constraint.=20
>
> Given the history of UFS hardware issues mentioned in the commit message,
> could this unconfigured vccq regulator lead to system instability, boot
> failures, or hardware damage?
>
Yes, this is a typo in the sent patch. The patch I tested had
vccq-max-microamp here. Sorry for that.
>> +};
>> +
>> +&ufs_mem_phy {
>> +	status =3D "okay";
>> +	vdda-phy-supply =3D <&pm8350_l5>;
>> +	vdda-pll-supply =3D <&pm8350_l6>;
>> +};

