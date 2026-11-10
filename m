Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299840;
	b=2P0S5LWD/j+8qOjRXL2KejVLrWIg0ULMkiiuLCSedpj8psgqcyiCyP3V7gdYn8Tnk1j6
	 dq3YOLWLRXXxwt8iY/xPqx8V7kLD78x0d8cAwPZltglCl/6x5cT2StncgpvjiYHqsahNv
	 n+7saBxekW0SuEj+vzjSMdnyuqf9TLW/zr/IM+NuR+u3Btd8JFXf6tNksWcVwEcd5I13b
	 ZwZBIn1/HFJtqlevlYZ9UOJ2Kr/aAJLwcZ2Q/EJUCsybRm9/hE3CrTKpY/4pXT+Kk8C3U
	 oRQXSsRG4SJbFamFWH1cvcg0cZyfM+Smo1Aq08mhj08gIB5gxd1GFjznNotEsEPHpcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
	b=Ofw2OCthCHqFIrnOtgKzUeLOiga7NwqXePgcJeSPXl4R9gCsqIugyeYIyzxlYhLU2xHw
	 CjMV33PTDurvupRRUXhkv2aCG0/AdW9ubW7B/TI5+VEk8k0paq6CSXEYdkPLfvrEK9z3h
	 rtrAhNJ4Rz9qJnLuGpHfhHodNaihwQXIPdG67u55hhFHZBI0NO9e8GmyT6wob0C7BEsqL
	 1JNy2qIKCGbqlhg+oLLzhVDRM3E67mQImIW11etoMUaBFbyb78L0HaKvR7cuDCRduKcpC
	 SCvdxX2ASV2snSvIwifqT0V3S/LAX8dIlTcWnWTQ4KYZ1naQKJgRE5QO0Sv7pqVlr+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiHWjlRh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8C606A325
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 08:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB8C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiHWjlRh
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c0ace36e8eso203522e87.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 00:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794299838; cv=none;
        d=google.com; s=arc-20260327;
        b=fuqH1Bl3r7OallsOswQJ7Kzz+jNEo8KVoUF05LKmmEqx6z2kgpde+Fy7aOdWC3/Nja
         UkOEfMUB4n+xwFXLLJ7U12UgiueUbh81T6udQsz3kWijqrWokU37gbBqdOIP/5PwykCr
         P2f0nL1A1GNvYKKOPYSu0BJoSEUYdRPxmbO9NGNS4CHz7Fo+r9lyFyB0BRqU0zuUyUTJ
         PIn8CehF1H3BJPBWyH0j/WORc0OPM2dmf4Ul++3hE+HFpQT/bmF31/Z4VOqY8qIB/XOQ
         AzacntWej09lF4/AcYkD+hU+aNABqdognpBU9EfF9kIZSRp7AWB1IRS1CdQVNTOTKJvp
         jlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=lrFevUmZkSHek7x9GSCQJLc66AMvr8F3nbxTz9SR4vnAejBFR5i57bXM15qoy/2AlG
         aEfazUfHAlXvZWMXUlN9mZMZgLjY+FnvguBMwwN3laU7YRSNWD8yTZnj8YCAiS68lw04
         1JJowMDSIIc6sEj9Jwh8MMQX7n7BlEPGuRIIphcWZTxFVaGta+Ix06KdfVNmnpYEWBH0
         IzNAKPSVikRtN12MDZ9jvE0jZOdo3MS6RoiQ/+Q52YJocRZbodvQ+vdg84fyMpAxko2s
         AMDGmMjU4xAK8saOHWXQYABPl3+9i61F/1Tstve7fsomijO/JXZB77N66I2E+U1vlW7R
         1/Qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299838; x=1794904638; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        b=tiHWjlRhIdQ9fFEBF6PEMdhxu26q94hAABv9BtEGRaGdkgj9LAyR0QG8q2gOQWezP1
         p1CCjfFfRB+1Ue3ptsnB2fvWAhMFDTR6/ceW/DaHLIeoubCVmgTVwb0Aje6hn+RZ4i6D
         /411BbvcZmTHXgAmlzd8a1Pz3gelRKXMZPhtRksrx1klbI9bQDD8pi+LsGguiZ02Pf5H
         +vTBRrI8sEJH4IyVG/quGiPckJS75ZUz72siZX4dktpsML/QCUxgriWMlTu7HSx7Lu3i
         UqtXcqBq8osTLXcT1tLzKpWrdFWBIJ/YJp19s33DEmcsTNQqPPa5SJDCqkpwpEtj6Zkt
         Jprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299838; x=1794904638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6zw3+1HuXwtuP48Ul74ZlZzk1bdeGryK1LmBRYGOxE=;
        b=nOlXtYg/uy8eW/H6o/LtJpYuMx4wKJPS+ycjYifbbxW9lgNddMZnjbWCRQ3mIEziJg
         mmenTsVPJZd5MOJky7nMZSsH8/goLihtYGbNwbEhl79o+oYwFfc2RDO5SXpp1ouQ2M2y
         zy9VcqfKbxy+jptNYhx0pB/Pd/RGegt+LI9EzEHIHVXjbqh3fbY+My6eOOlbUaOscZHb
         GhbUoWB2a99KD6w+Km224QYaORuFcCJzWnESQF+At7P32pHd0dsRBtxObmgkWTd+IaSu
         BCdasz4S4S7uk828WVIrdyuMsQGqWye+M+dcFZcUIsdwty0KYkD7OAtTtRYP+NhzjQ7t
         Hynw==
X-Gm-Message-State: APuU4Z8YNh+53iKYSs9jyb3dpxkQQUCCTnLdT1QuEOZpsMVRLT1qWtir
	JlDiuoLrxAe7i+rhDFdYpgDF9jlxgdEoYC4oJOUauG1cAZaB8d5G1uMelhLYFYAijzU9wcTSbVR
	vpsnYTVjOwvqDNHDvpcEb1c3ZVUILxlZ5QYehJ84=
X-Gm-Gg: AYBFou3Dn/8VYqFAAKQuVB7w9YsW02bALQpEv82udbKWWfnSzI7QrqC0ioTLMLo7OQT
	RxBdCHKF7tT8Tts8F3sY7n6TzqAkUUYzeYqR0cBISt0R/1NNpdi9g76D+JpU1agbexA9/smogFN
	qyqOah9XidxnO6UZ3xt8yGoJDQBjm4CfB47vzHZ5RW/bVQ70tc1bi2xEULL7s4uZffbphwpO4/d
	KysGhlR9OeMeKj3VQeTyTdJqzh+47kaBnMuHcF6MtleibqbrpX401aJ9s0UXXVtzKU78ACnJa2o
	LZTlGQEV/EW1zAFp96urjDdfXI9NVO5+TF6mQlzSt7MHUVdd/GJooiWYnHIkh3lQq8fPgP2b7wA
	8eiVri64ZAUM5h+k7sx57rwyw1h+yEFOYpOPMzxurA2Zfg1rtPjwweq+KCw8U4zK2MTDFoOw=
X-Received: by 2002:a05:6512:239f:b0:5bf:b65b:8598 with SMTP id
 2adb3069b0e04-5c156e8dad7mr661174e87.3.1794299838210; Tue, 10 Nov 2026
 00:37:18 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
 <20261110-asoc-rockchip-i2s-tdm-v1-2-f32951b3c527@gmail.com> <sashiko-outbox-206522@kernel.org>
In-Reply-To: <sashiko-outbox-206522@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 10 Nov 2026 00:37:07 -0800
X-Gm-Features: AclHuK9fgDottRGq0OBgRPNaGUeWys7ogEQYUnfi9xyPTiQ9XcrQxs1Y7tDt7BI
Message-ID: <CAEy9hNXtOjRqT5q9mc+gaFX8f7KumwhvLtq1N=48ZOU+JAMHfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rockchip: i2s-tdm: add the reset value of XFER
 to the regmap defaults
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Should this include a Fixes: tag so stable trees can pick it up?

Yes, thanks: the regmap warning is printed since the 7.0 cycle, so
stable trees from there on show it.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")

Arun


On Mon, Nov 9, 2026 at 11:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: rockchip: i2s-tdm: missing Fixes trailer for I2S_XFER
>   reg_default
> --
>
> commit fcc3b955539c797b954dd2c22348b8e552e615ec
> Author: Arun Iyengar <aiyengar1990@gmail.com>
>
> > ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defa=
ults
> >
> > I2S_XFER (0x1c) is writeable and not volatile, so it is cached, but it
> > has no entry in rockchip_i2s_tdm_reg_defaults[]. The flat cache then
> > treats it as uninitialised, and the first cached access of it -- the
> > regmap_update_bits() in the trigger and stop paths, or regcache_sync()
> > after a runtime suspend -- warns
> >
> >   rockchip-i2s-tdm fddf0000.i2s: using zero-initialized flat cache, thi=
s may cause unexpected behavior
> >
> > It is the only cached register without a default: TXFIFOLR, INTSR, CLR,
> > TXDR, RXDR and RXFIFOLR are volatile and all other registers have one.
> >
> > Add XFER with its reset value of 0 (TX and RX stopped), which is also
> > what the zero-initialised cache assumed so far, so no register value
> > written to the hardware changes.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> [Severity: Low]
> Since I2S_XFER (0x1c) was omitted from rockchip_i2s_tdm_reg_defaults[]
> when the driver was added, should this include a Fixes: tag so stable
> trees can pick it up?
>
>   Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controlle=
r")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-asoc-roc=
kchip-i2s-tdm-v1-0-f32951b3c527@gmail.com?part=3D2
