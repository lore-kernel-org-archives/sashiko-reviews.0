Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F63346E44
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193874; cv=pass; b=GSnWNxD1y+mPfrVKRHFpsbSmm3FGtV6QfA3AsUQAOmFnL8mWtArFUUkPWYZ1pQxyH6hi5rHjGTdcnLoP1xtbwhaqEKt9WEbUE7HFkSRSd6Rl3wLwnZA37H9br8ytMzGxivzEeJ3IPG6EQKqqTss7awrBJbL5t1ZZYVg/HNl9Uqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193874; c=relaxed/simple;
	bh=GvSH71Mgio9+/dFqhEYp2Ny9KgmU25cJ8taf/z3B8M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3YCNgFQr494fr798X3jHSsYEPVeBF2ZpW0Ouk0kN1Ax7ZhEYUCDsrVaotr99CrqK0N0JwXlb6dICv4NUPXtGQKhZrYAHg0OydarPBvBViRl6C9O/1bIUDbm5XZ/kyaxSeNs3SjPsiezjRZ7AbAO1ZxJ9QXQji4lPnWpr78HqfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSIqIvlF; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSIqIvlF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3063153b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 02:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193872; cv=none;
        d=google.com; s=arc-20260327;
        b=TlYrY1ZiEp/Go+8/JJYKOcZpND7UoQD5E9jXnK3MIPofkhboB8Hot8D3XsBH0W0h6S
         Q41sCgNsEJ/PpdOhjxDc8daEuP0WM+VMbS/6hLaB+XxVX68TpJIGiGdMTjP9NGY+MqY/
         BZS9cPQFo1F0FFmNnqvZ4OZuvFTstjlkQixMItaLosu8/UGYlweDQH/hBsbbMHcq4+F9
         F4FHMHCgr2DMMyj+Qo/O83R1pKMmPwyoelR2nCbZ3QZ7764bisz2Z+850mtVwcRyjV8z
         9WDPHFNxD03laZp+QLBtsYgaWfK2Ahdlq5eI4ZG7Vkt9aqff7Z3RjP6h5RyB4+oZAKQk
         LAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        fh=36T+4j8qrl4N3Zsf1TXCwHdQKrBrZv2YpXEadN+1YkI=;
        b=TKmSr74RItIE0XRPLHGwIIvERkd7rY2i0A++iA0zmIJzLg4cU+QXAf9+PF9UpUftCy
         tQS4kW+Jbtf5mV4fmAcWnIdmFOQCTek8SwGMCdeeIkMM9EjS17GjvzpG8QMoB+yTjr9/
         E6xwcfmHo+FFmf/OW48R6xCcz3Ux4D8YDz5YyVd4q+N0PihAl1X6J0sK9nHIAE06/AHV
         UMHXDWVtLAh5TsttSJ/bJTMW58d5NFmGB0qmmAc5+Xn4dZ9rU7v90XTovJmCYERpafTV
         4Kj/beJ99NTkGYvA5RaP+AOqFdOGX3663Yqy1iZzmHTmgelz8jyCBt/1tlgfew7PFMVf
         L9Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784193872; x=1784798672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=sSIqIvlFp122RX8Xw1i4wcAXOMgKt1tJiXRRYiGtthw1UUvA1cqzKV3ywZs3XVTeWa
         OIjyRebA/odK0sy6eOn8hrmTNVDBG6vQdM1dciifUOzwBMIiiDfGwDTp/o5ghA9JcTg8
         2XEX+8p1Qv33cDN9irjjydAjaRQO2MQVQmR5BGBvXOgKsyeLAH8s/X3x0b+VyB4w1BdP
         2E9hdPF4f7+Gu2jCE6g7NZ7/WYfNw62noAnKUHJ2oqoWHOHhm6Di1VAXOsLWx6KA0Lq7
         nD1h3bdYntEkJxkQmNvM3C3OgPw6VbRwQs2yalXXMdufnXKtXFlrvJigMWvAuxe6DuPv
         mLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193872; x=1784798672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=l0DxL3A6AhUxLz7Ff+7+AIj3V0I3VtZ/J6K6+Z7tsYcftrEpWn+GiHFKzjGDR4HyN7
         visLVwL1MZfXCVinUPSDBrEtzmj5ppxz0QGXmeTs7JX/jJ+twQ/xemaRukp0zEF6FC52
         EoFE9NV33NBx4aRJsnxUZtaU7LYwKWV42koN1Melo4odnF8u1e+mYkIArZZ60doyii2v
         OWlOZrNPP4weNym9hb+xgwtbrgGrLWJgzOzTyV+Tv1+oPbKUvKKWdmsuJmngNZTYNjzX
         VCBbdAvshgCHJrHaTcGD7v6xc9miW9YKZflV8E/QpgEvG05YlkkzeT5AzOvXDvQWcu0D
         TQEQ==
X-Gm-Message-State: AOJu0YwDyEzxS+Gu9bwm/LNqI9E2wMR0QveslHND7daZzkmpS1AYPxkM
	PTNLGq2A2y/h37ZmBXZpRBPCP0UVM/40/Bp0FaNXh8uqKsJeZ8yzY3P5a1WDu1p00mEtdtnC7xe
	PZ8Zn9NNOJVxcP2BxiGvNdofu3eSkZEulGEliSAs=
X-Gm-Gg: AfdE7cnMG7votOxMGWtlEIWIE1yStnr/TfFQBQzvBn4waNDvg/tMre5497cRyz+5TZG
	bZPnmvavHgGn64ADBqiUD1vzNT6p/bitHuDgrxBr90nqp8HpB0PRqVi6WxiZlpXf9gDsNd7SDwC
	HDpC2YSEDudICrj+AI9YiKSED79XPkjKQ4FHGYbbpDd1mrELOnXOSJm4jY/1iGLuuK/szr+HRBl
	Qvq7Lb+OCdJNXwT0fn8M67wtyx9jwy7DnMHeQ6NtZjszCW/JzB4TKUkC/dD5knrdVk3FWLeTSq/
	016hmXrfrsbuYAFrCxcCnzobwReY0huIyIV16H6uqUU=
X-Received: by 2002:a05:6a00:f08:b0:847:8504:9946 with SMTP id
 d2e1a72fcca58-84a6726b83dmr5832591b3a.25.1784193872009; Thu, 16 Jul 2026
 02:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-11-227567ffc5dc@gmail.com> <20260713204131.C58091F000E9@smtp.kernel.org>
In-Reply-To: <20260713204131.C58091F000E9@smtp.kernel.org>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 16 Jul 2026 11:24:20 +0200
X-Gm-Features: AUfX_myLtG8XdKEHnucqiDRzCNz_tCXXHKJzmB4U4Ch-HDmXpuQEg3jOwAHCgo8
Message-ID: <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 refactor to support M6 boards
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 13 Jul 2026 at 22:41, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_npu_=
s0` during refactoring.
> - [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.dts=
i` file.
> --
>
> --- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:=
 refactor to support M6 boards ---
> commit 056adff75ec08989b96f09adc0efff6c3a5d662f
> Author: Joachim Eastwood <joachim.eastwood@gmail.com>
>
> arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
>
> FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
> M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
> for adding NanoPi M6 support.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > new file mode 100644
> > index 0000000000000..a8e532ad8b7a8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>
> [ ... ]
>
> > +&i2c2 {
> > +     status =3D "okay";
> > +
> > +     vdd_npu_s0: regulator@42 {
> > +             compatible =3D "rockchip,rk8602";
> > +             reg =3D <0x42>;
> > +             fcs,suspend-voltage-selector =3D <1>;
> > +             regulator-name =3D "vdd_npu_s0";
> > +             regulator-min-microvolt =3D <550000>;
> > +             regulator-max-microvolt =3D <950000>;
> > +             regulator-ramp-delay =3D <2300>;
> > +             regulator-boot-on;
>
> [Severity: Medium]
> Is the addition of regulator-boot-on here intentional?

Seems like I screwed up the refactoring of the code, and Sashiko caught me.
I will fix it and send out a new patch set later.

> This appears to accidentally revert a prior fix that removed the boot-on
> property for vdd_npu_s0 to save power during early boot.
>
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +
> > +             regulator-state-mem {
> > +                     regulator-off-in-suspend;
> > +             };
> > +     };
> > +};
>
> [ ... ]
>
> > +&u2phy0_otg {
> > +     phy-supply =3D <&vcc5v0_usb_otg0>;
>
> [Severity: Low]
> Does this create a dangling phandle reference in the common dtsi file?
>
> Since the vcc5v0_usb_otg0 regulator was left in the board-specific
> rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like th=
e M6)
> that includes this common dtsi will fail to build if it doesn't also defi=
ne a
> regulator with this exact label.

I don't think this is really an issue. Both nanopi-r6.dtsi and nanopi-m6.dt=
si
will have those regulators defined.

Unless someone tells me this is bad practice I will keep this as it is.


best regards,
Joachim Eastwood

> > +     status =3D "okay";
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-nanopi-m=
6-v3-0-227567ffc5dc@gmail.com?part=3D11
