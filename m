Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D43AE18A
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784431; cv=pass; b=YJbW8xmZVFEthbTEXO3EN4GwhBzjukMqvWpGRxjjy2dF3OrTgrT/LlA7Qhr4CUdRKaVuN17o58X3veRfz1n5q1jYKi+u+OSlx6vCfHhTMLqVjmP1P+3SmM//ZiN7UZZInMOqpY6zkFZZD3gWhhtcAyBIB/7q7ftku/f/oHdJTKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784431; c=relaxed/simple;
	bh=3SgrV3BQIpw/BKeX2coBnxDkspQuXkrqKJSDqrsxklo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg/C/zFepe0LpWQ47dfcfmyirXXvt9mxSh4vmkWzo9J8nFqOhgNHSpwAX3SloMEcZU6RI78CmElFOC70jXvsBFwUgsc5nlMns+MHhLmSc1uk1telZbgeaLOpqQJAlHFw2sL7HT+81GVmYbyv/L4zctvrBwdYaU3D8bMG04mrjt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB1DGtGT; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB1DGtGT"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso620480b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 22:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791784429; cv=none;
        d=google.com; s=arc-20260327;
        b=T1SrZByteDeBGzxQjb8+JjcATucSHsatOjX4MFHRVY5hvg+7LTJVPxjsV/QdjCU+s0
         0DGVPTMrHLNI2WfjQiKX3a3Siiq2ki7GDrP/7QGWN5fZjqvCvKRVpCKx77T2CMgRK8r6
         Qh/j8aArLiaqA4TIprJr/tmsB4oBEfBYhi6O8TxGanHqyAi2xc4bKmabw3fDhoGRS/gS
         xp3WS2RULGLnlNWoPXKPBW2f1hob0WFBS0c2vKg7qCMysQ9AocLO8IppykOeFzyD4/wP
         5gGtZSll2P2IimnjHFpyVkHEwFFJHII1Iv29I1IcpwX3GWUBb+xFL0ef/UeYdlGILNmq
         a+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        fh=2X+7ByAkRO1QUnLaoP6/vLuZ9I3/VniOzD48dugxJcU=;
        b=UEjdkhbCT3Fa+Zc88f2E/6TpeOXbi8azZpBnGt+Bl0LWOVoB4mdqN8G9xET/ArVkoN
         +sO9mRHxSoU9Pi5UerK+12hj3V9RY/SZn8ue0fChXbdNVntqFt1aNcWIp5xB/skNeyzU
         zdOcxLhLQGeOsVWZYP175JKO86N357JgGO5pCS4IEBNdkKaT88ALTXFMxXz1tuz3WeLL
         UJCuWw/wZOM5R56Ww8IPVzOlgxh9wgfVhXFKlYhv6+pCF5wLGBpDahh+0pV76g+V3Nk9
         dY+0lqTfVI+Dr7RG69Y+iB8s7bh3BEeSR9aBsWYDW5qlsha2LXOGnGLfk5Q/g09LyXd2
         tXEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784429; x=1792389229; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        b=FB1DGtGTMH7oY+p4zUM5Niju3QeDF64Gl/tsAoyBMUbWp0hkqp69CXjOP1behc+wNg
         hWhAhcBCArRK6svS5IcVJ3EB3Tw+rs6dmsepAUSIUSk4oJ1+GCo9skr01Gey/c7+40Sj
         QkiGjjqalf2JbZLIM/gDmyPtDu+szvU3CyOWViMW+ZoDWpI3ID2byGlsJH3XS7t4GZkk
         YOw+Zp0UArrJTo2k5c2G91gGit8IfuNwhiKKycWGtQrP10dEvev7YvxhBTrxit4KiV1l
         t8DoXC0C4lymjyjx58A4HPZ289PpCCqkVH3GzVJKCV1QRcKC6iaPTK4OEWGpkc6Z/Hcz
         XIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784429; x=1792389229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO2SHHnYvNeqH5LGzfvAAyT6x/fjDGlAXnTAwdDQ/Q4=;
        b=avj30I87PshK4S+dkFfZaa5mpEbA2Mj6T/G6Kjw7eduIbeBgl466Y7OLnKXi8x06my
         mXiY7xvZZhT8wUjtGDj7vSWGGk37fwVCWDbjXcz5ldH6K7hVjOTA6BgeF3UbbdBon+Qk
         yhMbqKsvW0W5+plGMlT+hO4S/GQKm4ezrrm2t19lwLH+/oVu+a5Q0UOV7xonDsLYbmiR
         iEWJ6oxV0ESl/LDxLxJeLI8crC55w+Cv687Jbts6tVeh3VplT8M/7pLt8xXS4Wq31hF7
         QLCgOd2b4iSneg7jp7HhBcGWnoSDQd/B/Zpnw/ypU6ZmvxWfoZRpbdPIFFW17p/PPBev
         bjEw==
X-Gm-Message-State: AFq9FYLXCWVUEOw5FayX1ubQk/IgiDH0tqFZPZ5bncW1rxtangrh4Nrk
	oE7je8ZNp/vKwZPq5RWeVDduxWA8oSvYwfZj2fQwdhyLe6Lw2N/+wyed2FZ7X02DigTDamtXrbC
	xZYqwCZctF/L2HjtN+uUc4MQjeoXyAWZemBrf
X-Gm-Gg: AYBFou2lJJyBKDydNmIoGP9i6oPInloYRU0bmvgcaaT5Zt1Ry+QI9+s5KWk7WYjy8nn
	PyJIK/p4BjrA2W96q+KQ9CSgpV0JKJdLRPzdHCbfbiztJeUtdG/+SDTLpLLv+nnDdwoTKmckCle
	Nv7ntpu6kW8KqU+kd4A6/eDv2UXfQEcC7m5hr3EAFLRysrUjescJ5cPsl3G7bh1IX6lYpG/dHqi
	liBKOtQCGayzAZbGqDT/5fjaIecK6XMvtBv6uhGW3fidRkPopiQ5ZPg9yzhIMBBQXxz+7sU8pFc
	ftscIPFXu/dU98zAhkarO96hxshTq5FF4uGLhSBKD52TZRXzcLyhngOahnS+yb+IyiMs5b40xLt
	W3oINeMmEB+CJZ0XHVIs96bOoCP3LqIVfII+iDojY6o2JGLVnIBL6Nh7MlPsosVvPTwQ=
X-Received: by 2002:a05:6a20:b78a:b0:3de:8825:15b with SMTP id
 adf61e73a8af0-3e16be899c6mr7214244637.12.1791784429226; Sun, 11 Oct 2026
 22:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
In-Reply-To: <sashiko-outbox-167547@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 12:53:37 +0700
X-Gm-Features: AclHuK8accYR9YlUU51RFCxSlQ8XGVvYal9shsHWXg0w-Rp09FTRK_kAe2k46dE
Message-ID: <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: sashiko-reviews@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> Does this cause a regression for multi-chip SPI configurations by aborting the
> probe due to -EBUSY?
>
> In the SPI driver, multiple physical chips can share a single SPI chip select.
> This is handled in drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() by
> iterating over spi_present_mask and calling mcp23s08_probe_one() for each:
>
> drivers/pinctrl/pinctrl-mcp23s08_spi.c:mcp23s08_probe() {
>         ...
>         for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
>                 ...
>                 ret = mcp23s08_probe_one(data->mcp[addr], dev, MCP23S08_SPI_BASE | (addr << 1),
>                                          info->type, -1);
>                 if (ret < 0)
>                         return ret;
>         }
>         ...
> }
>
> Because all logical chips share the same SPI device, the same struct device
> *dev pointer is passed to every mcp23s08_probe_one() call.
>
> During the first iteration, the reset GPIO is successfully requested
> exclusively.
>
> During the second iteration, devm_gpiod_get_optional() is called again on the
> same dev pointer for the same "reset" connection ID. The GPIO core will
> attempt to request the same descriptor again, which will return -EBUSY because
> it is already requested and does not use GPIOD_FLAGS_BIT_NONEXCLUSIVE.
>
> Prior to this patch, the -EBUSY error was ignored, allowing the second and
> subsequent chips to probe successfully (which was safe since the reset line
> was already asserted and deasserted by the first chip).
>
> >
> >       /* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
> >        * and MCP_IOCON.HAEN = 1, so we work with all chips.
>



I looked at how the cs35l35 and aic3x drivers handle -EBUSY
when the reset GPIO is shared:
- cs35l35: https://elixir.bootlin.com/linux/v7.3-rc6/source/sound/soc/codecs/cs35l35.c#L1524
- aic3x: https://elixir.bootlin.com/linux/v7.3-rc6/source/sound/soc/codecs/tlv320aic3x.c#L1815

I think handling -EBUSY similarly to cs35l35 may be more
appropriate here, preserving the existing behavior for shared
reset GPIOs while propagating other errors.

Linus, could you confirm whether this approach would be OK for
mcp23s08?

Best regards,
Phuc
