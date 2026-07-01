Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF61381AED
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927500; cv=pass; b=bzAaadtvTFhsHQCL2K3Su95dApJ/fAfqYr0PZgRyAzZ9Cf0lEYMi+G3LVWjjvEaI3rwZ5NvsjfBFZXXHppYJCgQJFN7wvyMUJKc3BGhanHXt76mMtm34w0un5duP0YcCI0WsXr7umSmsmqAuxj9XqefT9s/v6x4GZbOmCxZ9wUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927500; c=relaxed/simple;
	bh=RaqQM8sVfRXFrgVuicFiQ+T4/q8FUzfsNzlzFRbxu1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuVXldvRAmv2bJOsqJNL5Fh1hzvt/ECmnwryJf3zcGl1Xg92P+uePo+M3acmTNB8q5cPlLi3XrWJVE57XSEdTDRAyTmkiOc/0bUKLEDq6ArPsmhcmkV3qze/T1cIE1s5PM0Udd53lMTj2nbWlJnAQNtf8zbjTKidKvpE72AGEQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoeohCks; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoeohCks"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c1261e02553so10564066b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927497; cv=none;
        d=google.com; s=arc-20260327;
        b=l/u7dpGtAaZ7kOMdUTvJdrdjXQthHknm/pwgpCihjY2ZeHxTajs12gQxVpzQJnMUpQ
         FaPa4s6YG6sLIXZiStb0S3lmZHRXJGvrFAT+sOX59KiH1ZIU/Ioq4oLGyNd6sUgR1jCT
         hltL7+VB4x/qGEeA6wSzmVvGCVAqOniCbgjT8gsxkGedaWjdkRqcEhrhmh8L6Dq+xuH6
         3rAz0Vec+COnB81jB71s0cCzKlsoXJyw9PSJFEhsw4Jn9HrSc60iGuTnv87nMVn8Wmcf
         eqRNfeqrgfCZF7B1eE4xYEDbXgE89B7zNIyCovC2omR7fPQLUYgSw+6F6Tuxe5Gptrql
         CjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=pltDquevj8/a9gzG6VDc3J+dy7m94k8s43Hqi67tU2ml5YqYk/I4f/cWBTDa7tZyOW
         BzHZYRr1nPR6uxCgUZoHxzX9v0U9n5KCDLAjcF+jKedr9vGj64Yl1WAu6fdmtjZ7cg2G
         9k+Npx2KF79DLUsBkSPgGAffu/xTks0proTWtKkn4Y5xEiQVzHAWAoLbE1mT3oAdgSPp
         qEGAVvCk/7K4GSn11yqmW4h+IymY4T9qdTOk2QQaaTBn9x57VKE8I44P2mt2WhZn1/rH
         FCGVDiD2uqL1S7KnmpVLODXVF2RUfF8wSrOoagg+uu4oMhqldOFpm7H+HwfogO5vANNC
         cdLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782927497; x=1783532297; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        b=EoeohCksXaIbNRy+M9ajfM7n5UClma32O1QYHMXvtT+MeB2mhwjV3zV/TjwyTQ3md8
         koMRxDiNnKjOs2BZ2DrUIe0BZ3c79/7ujAqcPXHD5Kj1Kyvk2iu++Bq6+gqnWYy5UswY
         JaWD8eqbU8aDG5uaUOy3FPrdByP3K9mqEtare9hMA1R3IFezbhuG4UlTQKbKpDeqBUKe
         mB5tApwwmL2YKnRmIS16pL9Hef0JqZEH9x2AFDkLPmRWcrHIoJXmOrKTjLX/k+BmwzfO
         SMK35Fj+45wNj4Y7C9CV1cOQVw9P/4ZYYJQeMB0dekbQtQWzFCPHsdv3APC4HsiYw9mU
         MyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927497; x=1783532297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        b=A/p6iuJEIh4aXWZM25B5/CSv9u92jAojsqanEyAN3j1JUBfi1S6VjxhQW5p3WlwT2W
         7suEKMHbRCb5qZK7U2MaxZBSnNy3mUBGl2RE7Q0mFcK3R6fG8m+j1QDNtZXLdlmkSrCb
         wrwGnliVEPLjk52A+uAkmNO29nisUaWjasXLD2pUGlF8hP4iYaOyJMir18XiRsomiiNl
         QzTHfXR12oHsd7lt53rZhlb85hTdyOAkzc3eaWPmk61pRv/bQ6EwGpjjz9nETeg64BMI
         apq3Im5KrxaBLppW99Qhu/WBa8M2Ell/ZiBwA1r9P8pWRDj8YOjd4tkk+D526LG6CU8B
         kK8w==
X-Gm-Message-State: AOJu0Yx6RJR7cP2u1aLc3G/Mzg3YTu7TVrWFgEVTL3wg6Uj6nGyP151N
	c3qxjXRaAnLjUWw7S+QxGrFBJHNvfBxLeH2DZOtWQvzFcLBXj3yb50JN/Nmp5Ml3bE3cVku70/f
	KZVs3MeeUOgsPc1XBJ4ceaGpzc3SdEnUD+YHgOK76SXk2
X-Gm-Gg: AfdE7cmMKuRXmyjPSVy/hQmX/n8eQc+EqPcO+Dei03oLFbMXPpnhZQ46Qvu3qmXGL/L
	iSxaLdrD6a5MD+o2FNpCDYTxYzqUUTddQCDMCHSYjEiJmwmt7xtmy+XyaFspPZgcveNSU7jAqCm
	bqsXumbdXJ34psKIfoGRDKqrE951F6wYWWAqhBoSdSTFJgqgakEgT1j9L24hGjjxMnZlBLmxGOz
	b4+S5LeR7QQTWqlLdRthOU4aYDkjutr0yMtYe7xIZ5l4HlHz6JilUenYHSIpVZxcnjt+SXYT5k=
X-Received: by 2002:a17:907:3f97:b0:c12:1eb:892e with SMTP id
 a640c23a62f3a-c12a79b77acmr146967566b.6.1782927496879; Wed, 01 Jul 2026
 10:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701164543.3967388-3-coiaprant@gmail.com> <20260701164543.3967388-9-coiaprant@gmail.com>
 <20260701165958.BC7CB1F000E9@smtp.kernel.org>
In-Reply-To: <20260701165958.BC7CB1F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 2 Jul 2026 01:38:07 +0800
X-Gm-Features: AVVi8CeL00GpCHEQIZu5-z1-920rDCQqSuFCtbUcdM8yj0kiyDqMC7ciYSSV00M
Message-ID: <CALj3r0h-8cSDNcYW03yy=eUJUcLq-Lbq=85juNE=mYApPQBGwA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> > +     adc-keys {
> > +             compatible = "adc-keys";
> > +             io-channels = <&saradc 0>;
> > +             io-channel-names = "buttons";
> > +             keyup-threshold-microvolt = <1800000>;
> > +             poll-interval = <100>;
> > +
> > +             button-esc {
> > +                     label = "esc";
> > +                     linux,code = <KEY_ESC>;
> > +                     press-threshold-microvolt = <1250000>;
> > +             };
> > +
> > +             button-menu {
> > +                     label = "menu";
> > +                     linux,code = <KEY_MENU>;
> > +                     press-threshold-microvolt = <1600000>;
> > +             };
>
> [Severity: Medium]
> Will this configuration correctly identify the MENU button? The commit message
> notes the hardware voltage for MENU is 1400000 microvolts.
>
> Because the adc-keys driver matches based on the smallest absolute difference,
> a 1400000 microvolt reading is closer to the ESC threshold
> (1400000 - 1250000 = 150000) than the MENU threshold
> (1600000 - 1400000 = 200000).
>
> Could this cause pressing the MENU button to register as an ESC key press
> instead?
The ADC keys have been verified with evtest on actual hardware and
they work perfectly fine.
Keep it.

> [ ... ]
>
> > +/* used for AP6356S Bluetooth Sound */
> > +&i2s3_2ch {
> > +     status = "okay";
> > +};
>
> [Severity: Medium]
> Does this node require pinctrl and a simple-audio-card binding to function?
> It appears the I2S interface is enabled, but without routing the signals to
> the external AP6356S chip pins and linking the I2S CPU DAI to the Bluetooth
> codec DAI, ALSA might not register the sound card.

Yes, it requires rk3568-codec-digital for Bluetooth audio support.
Since it's currently unavailable in the mainline, I will disable the
i2s3_2ch node in v4 to avoid an incomplete configuration.

> [ ... ]
>
> > +&pinctrl {
> > +     bluetooth {
> > +             bt_reg_on_h_gpio3_a0: bt-reg-on-h-gpio4-b2 {
> > +                     rockchip,pins = <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +
> > +             bt_wake_host_h_gpio3_a1: bt-wake-host-h-gpio4-b4 {
> > +                     rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
> > +             };
> > +
> > +             host_wake_bt_h_gpio3_a2: host-wake-bt-h-gpio4-b5 {
> > +                     rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +     };
>
> [Severity: Low]
> This isn't a functional bug, but do the node names here have a copy-paste
> error? They indicate gpio4-b2, gpio4-b4, and gpio4-b5, but the contents
> configure pins on GPIO bank 3 (RK_PA0, RK_PA1, RK_PA2).

Good catch, this is indeed a copy-paste error. I will fix the pinctrl
node names to match the actual GPIO bank 3 pins in v4.

> [ ... ]
>
> > +/* used for AP6356S WiFi */
> > +&sdmmc2 {
> > +     bus-width = <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq = <&sdio_pwrseq>;
> > +     non-removable;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply = <&vcc3v3_sys>;
> > +     vqmmc-supply = <&vcc_1v8>;
> > +     status = "okay";
> > +
> > +     wifi@1 {
> > +             compatible = "brcm,bcm4356-fmac";
> > +             reg = <1>;
> > +     };
> > +};
>
> [Severity: Medium]
> Is the generic fallback compatible string missing here? The brcmfmac driver
> explicitly checks for brcm,bcm4329-fmac during OF probing. Without this
> fallback, the driver's OF parser aborts and properties like a
> bootloader-injected local-mac-address might be ignored.

Understood. I will add the generic "brcm,bcm4329-fmac" fallback string
to the Wi-Fi node in v4.

I'll wait a moment for further feedback from human maintainers before
submitting v4.

Best,
Coia
