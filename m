Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357510;
	b=y6NcG9uXnBysSzDmMFPjlIBJRvpW03MGsoPqhj0TODbgSzcDYj8IolK99gim9Q7sOgOh
	 5ywY2mPlTqh7Sg+cTQkcL9zEEb3MpCeug9gqjtv9oCZP7N5+LT/9ANGbkzcxWU2yuFFKT
	 X6bYu5Hf4FmIWGF+PYxegE1sXHN4dSL8SFAU8NoQCZSwucGc92mk19RTZMV184wM9s75u
	 VJuWPWvP5eCSdSim2Ma8lWJG4cG3vPcmu0rBQFIsNs/uxe341MmwQ5NiFyUiBk1evmtwu
	 Sn103V8QEiQkm8LhAuqcGVOh3j/ixjSJL3o6bcnOMpSqV1BBydk5JmLen1Tm23hDYLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
	b=KQ++zLkh1OnJOPbQUCGuBERUOLElnBQkHvzEzztLFZGIr6jPzxghqUCS7OZEyKDFWvoz
	 Xoq/Z3xPFkP05NOtLgV5JjnUko14LbEZgB2DaUuvHoZO35JKUs6V5T2AAQA2fGVnlNxoG
	 vVhAkBpHfO7rcy/ps2ff4yEFmTQFMLk3pZOnF+yM/r5aRS1rF+A7YmbvZXOs9u1KPFvtA
	 Rh8e/Mf7Pn0ptaZYe/OoSOjVmbhtTq0o6IbzFIB1xG1xeFrgpQKWfgMmwKCvBIwfIZz+k
	 t4LKd0vShDjweEodlRy+B3kDivMxgZO54SKviGcomTQeQWaKMVXh6Rw4VV6cngiOpGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EPAt2K0I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD9606A8D5
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76BD9606A8D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EPAt2K0I
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677af43eed4so451776d50.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 03:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357508; cv=none;
        d=google.com; s=arc-20260327;
        b=YVkOpX4S/qqY8ijcIF42Icl1VYBqIT2DQarwdBzlr8uj7XXEX46W3kw40AbHwzpBjY
         JCbdfg22ILpSsxAoiLOeWVGYP07+lxHNAG7BgRWyKTyUHI/YRbkl3co5lSR3X41uXxQ3
         hu5O2YU6KA4dNDZRenIsvGzh8j7uetUYwoQ/s8VJLK0DOyyGCvQp5VhOw4fDTpwLbNvP
         +k22GEyk5mCVySWOPLHHVoWP089yhcoYyK/r96sT/34IMumVMa1VKt06Ws6gkawIPYEY
         KU2ZD4IYkdNZLo15aHZkPJjkya1lqga+NPjtWESMHfiJRA5ezOWQ9rUjwps42H5oOWnk
         EyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=AYKztDZGHwFN95ZjfjT1uTSdpxPfsNYnXwfz91707A+qRKqvkfv8iUsIsbRq3laARg
         AbgsBD8EhyvSh0f72VC7j0jJ2lCqd5tcSYGOgpY6F9mufl67x+goODOgskq8qaY385nK
         Bfx532b0svbwLlVXBhxiyl6DD9ikO6+o58TPafC5BZ3hC4WF5Sh3ewO1lOzWm62WcPqQ
         YB26DWauu0CBs0wz3aKvNyBRdXG0nvL4teET/pRWMZFtojeJU68354mxfRFIA+zjbktN
         yPfOCT57ptTZAd0DjuEgsMvrSfV3dJDJmGR0zwndTh+ZAYZ6AF+vP7Q6/5+iBeVmb+Nd
         mMoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793357508; x=1793962308; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        b=EPAt2K0IR2wQIi9VIxlPqWx7k/IOLJxw5ys8fCVSrHXJLuolu+GYgrSxMm0nz7fQHb
         o0wGALpazQid2rITtAdLLLG6A0ZKd51hkmueoxrvZAk/2EPG2W6i2897fvVddekCBBzm
         3n0STCcYChEbLZIAS1KIb0lGbp0S/dD6/JYp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357508; x=1793962308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        b=1lVRvxtoByS/Wpze07NzzDtaY6xSIjszhH8ZVtpfRD0z8Rqh1djgi/B3ylFkEwgYdr
         ObZLQUMm1NZP1lEgLZXXVK1fzHoTpYCu70zdaEX/z39SGVDb7clLDBMIpMZmYE513Ce+
         OyUgBioxggMUTJLD6NkCSRi50NqrWEdWGbnV0eXsxixxl13FUrp/qvnC61dndv3Vlloz
         5exYJYfeOqpYHirpZnVgBHUQM5mtwzF3EsLEM7d9wiJol3l+rebDwbZKhMLaGwr/7rLx
         fqeG+/47KwGehj9/MjEGpzD5qZP5wPkcig+m5D587XxzrfCurbd0jOZGdqr2LBbux6C1
         1p+w==
X-Gm-Message-State: AFq9FYKQBTGhS6sfV8s9iOqJylCtiCPQm63CzwE2pyt1KL76GyjkDNei
	qf5YB4o4onGumqdjOjxcfQJgkXil9A+LZ7ErGH/ID6eCovbvf8Z6RpMgYmksiQqrDvRlyWEfpB2
	s8Hr/PlmdzUUTI2xHAkZDiFelKUkoroMwEMAXTvxylnBtLLfv8Bk=
X-Gm-Gg: AYBFou0p2ekSUrnAijrUYjhgLSoWn/9Dz+TnDCmBgjbZIZHBmgxSYR0tJy7sq2CBjwX
	8zoxOS2ps/0PGNEEWLUK/j8UkZCqgY/TRtx/Zncc1YamhxT3o7BjkrLevtZ9OE5p83W9nkN1+Me
	vQY5KHWlTzor5zJ9WSBHNJv08mHfx2Igm7hm64sFiwy0okW7wsooSiX50/3X+E2eN41FXozYzjv
	Dwe/SlMB5RUjl4wXQ8L6gTQ1GpEdFXeJgqIdc4XXYTSZ1UjSzWQSjbvPbXMoYEhUvjvJD9V0NV2
	HfkVEFjsdRL5JaLUqoaI0Cy/fy/jph/rXh8NDbdtdaYomQkaEQiuWag8yHXn8B5ClxEUDmaG4xL
	y4j2CaqYgP2R8vTjbanga/Br18zbeyO9wrikYQADrqrpTz1Qw/oDi22cMkygm2vVOQUA=
X-Received: by 2002:a05:690e:13c9:b0:677:b7a7:ba38 with SMTP id
 956f58d0204a3-67ba4c806b6mr1739398d50.14.1793357508542; Fri, 30 Oct 2026
 03:51:48 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030103418.2355854-1-wenst@chromium.org> <sashiko-outbox-190860@kernel.org>
In-Reply-To: <sashiko-outbox-190860@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 18:51:36 +0800
X-Gm-Features: AclHuK8dRbUC9YjGydnlkhS_CrQ4_pwnqLdh1PdQaR9I-6NADrsb2t_rTfbCb9g
Message-ID: <CAGXv+5EQTvKWYQOWEbW_EKRK98mWdVhtXd6AogifcW-NkDm8Uw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay
 for MT6315 regulators
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 6:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] arm64: dts: mediatek: swapped regulator-ramp-delay for Vbcpu and=
 Vlcpu
> --
>
> commit 810dcac6146b830cb56f853c88e0887dc012ef9d
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulator=
s
>
> This commit adds regulator-ramp-delay properties for the MT6315 buck
> regulators (Vbcpu, Vlcpu, and Vgpu) on Asurada to ensure voltage increase=
s
> settle before switching CPU or GPU to higher operating points.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8192-asurada.dtsi
> > index 40d34b16dc807..68d84fc55767b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > @@ -1500,6 +1500,7 @@ mt6315_6_vbuck1: vbuck1 {
> >                               regulator-min-microvolt =3D <400000>;
> >                               regulator-max-microvolt =3D <1193750>;
> >                               regulator-enable-ramp-delay =3D <256>;
> > +                             regulator-ramp-delay =3D <4500>;
> >                               regulator-allowed-modes =3D <0 1 2>;
> >                               regulator-always-on;
> >                       };
> > @@ -1509,6 +1510,7 @@ mt6315_6_vbuck3: vbuck3 {
> >                               regulator-min-microvolt =3D <400000>;
> >                               regulator-max-microvolt =3D <1193750>;
> >                               regulator-enable-ramp-delay =3D <256>;
> > +                             regulator-ramp-delay =3D <8000>;

It seems like Sashiko applied the patch incorrectly. I see why that is
possible: the .dtsi file gives the same default values for all the
regulators.

> [Severity: High]
> Are the regulator-ramp-delay values for mt6315_6_vbuck1 and mt6315_6_vbuc=
k3
> swapped here?
>
> The commit message states that the slew rates are 8000 uV/us for Vbcpu, a=
nd
> 4500 uV/us for Vlcpu and Vgpu. However, in mt8192-asurada.dtsi,
> mt6315_6_vbuck1 is Vbcpu and mt6315_6_vbuck3 is Vlcpu:
>
>         mt6315_6_vbuck1: vbuck1 {
>                 regulator-name =3D "Vbcpu";
>                 ...
>                 regulator-ramp-delay =3D <4500>;
>                 ...
>         };
>
>         mt6315_6_vbuck3: vbuck3 {
>                 regulator-name =3D "Vlcpu";
>                 ...
>                 regulator-ramp-delay =3D <8000>;
>                 ...
>         };
>
> Because mt6315_volt_range_ops does not implement .set_ramp_delay,
> _regulator_set_voltage_time() uses constraints->ramp_delay directly to
> compute the settling wait time during cpufreq DVFS transitions. Assigning
> 8000 to Vlcpu when its hardware slew rate is 4500 uV/us causes the regula=
tor
> core to wait for less than the required voltage ramp time before scaling =
the
> little CPU cluster frequency up, while waiting longer than needed on Vbcp=
u.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030103418.23=
55854-1-wenst@chromium.org?part=3D1
