Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B026349CFD
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787509384; cv=none; b=Jvu8zgMhOAwXOo8Jr3/82Uhlf0lasLxh0dKhp0yDt+lXkR1kF2cikUjZQ6w8VtnwQsH27tbj1yiS3wpjom8bfNFT7fihfRpBQ039/SvAuQskDdHnFryhXjnD9Qnye2xVB86wAeb3PV3l0HL60c1ure11N2lnU8KM1QY+4ufwkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787509384; c=relaxed/simple;
	bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AwJfXh/VqmmQEZv3qnAGsvO0+r2+0We7DOZMRe5aiBQhygVY/DSvWN/bRoBTBQTTnDIqhzUH6jtWt779g2zbHiVGcfQOH5vEFfXKsEFnWiKooBEXeZpyAv42Q33bDylTi+H8ItZLBkR+qW9rTCyWO9ie2UaHyVm4NYS9vjzm62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyko/xQW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyko/xQW"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d111ca99so316071966b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787509382; x=1788114182; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
        b=gyko/xQWcwu0ezTRaN8sYQe0mF1fbSepvq7PbKczYjfFJzHdLjaSrgcEeIOJJIxMt2
         n/op29mC9wWpyXP5M3cGmelHp9uSZbDk7EzJZXK9nBzkb0CPPUEBNleHX9sfRC3DO8VH
         P4GUqALND7dKHbe3566+wbLkIEgisDj5R1crp9oAhfq8iQzyX4+MFpgbtrp9Va37imWk
         9PQnyPPKuPvCBVS4kOpbgp0i8Y2v5JK7IjyXECB5XTIWlNGS+PagcGzKIfVWYF3J3wKy
         r/kLU0Dew8uhlHUaEt3ChOpkpOLewWzFD4/LDtiJRjmVJdI64Du2P/xaJ7Y+QSUcHFt5
         4fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787509382; x=1788114182;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udNXh6NgZF0uKZVEKkUf/YC4wURS+2sIWuE8rwgph9s=;
        b=QD7D2Q1UCL16CIPllx8OetJau+heRCg7o+5mp+N9DDts+UVUhk999VspRJNU/zyg8H
         GwKXjyQ1SS0ILqGRK2bR0MkHOMdtvmiHb43SLGV0tzOqhYCjUf2F2LvYpvcaIiN1r7kg
         jEA54yI0fmcnw0BQDue3Z/hiT7c738wT5LsAFdAaaBw8zkTMbMD5qv+S0n33v4Y0TNjc
         LTC7GDXvTALeJgmFgRxnxQXV9MteuYu9Us3n6hHAp/YtXIW2yRXIiNGRucgEPa851yfH
         hNUs7EhlXcNbtBlOUi3m7fS3BB0llU4ZCYd3//Yi5rUDr2HSd9vwhKhI8PdnjMNuxgg0
         BRZw==
X-Gm-Message-State: AFuF++mu9YxQB5cVG4reiKxzYHhZLo5xrVItZIBEwZ7zBwTc6PcHxxBF
	VQci4Je5LgzfftmR+nttXlFgm1r8G9yfXJR5Zd7nN8PQTyaATyci9a3XFcscRA==
X-Gm-Gg: AR+sD135Egv7Z42J1i9wJA5bp41yi7LhnubSaDqxkdaHA4r8Kl8sDttyp83VKzODe33
	YbF0pLgudA5y4oQ+ycicS0aVEB35pBW3KjJCWZKs28BqlmNw3xjfGqIMOvxla0FVmmsmuMHYrKA
	p5alSJMCZQD8CP4SOJgjkCr5eqVV/6cdAYm08UPoGxpI/IA96JDyEHrhsFxUsAi2r74cq87Kb4D
	uzkehHmPRKFjeopawrnBple5+pxU3URvRKkI3sabUoucCFH5LYp0jnsMbVCpcRIUFFdd5bgdsGk
	ZqtZ7MqI64b+6jSFLAYiFsWspiCExGxDEtqJ+jmJuO7t3WfJ5TTJCNkWLrK+yz0+CnjiP+lBBhw
	gWkPTNMg7OOXLFr25IAwPWAG6hRBP1MjBxncR/Gr1rfQFxXkRdbxmIj3jZGN5fKJvlSOBwq7a1X
	t27gfVCJcbQW9dz9Y7F6BtB8yRkmSGMIaYCfhPGKKRz3t2A91PbNyZ+zMLv6IkmA0Ypczcif1E1
	nuS7ewc0oiC
X-Received: by 2002:a17:907:3c91:b0:c21:601:6501 with SMTP id a640c23a62f3a-c249272ab1amr1467360366b.20.1787509381576;
        Sun, 23 Aug 2026 11:23:01 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm831454766b.15.2026.08.23.11.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 11:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 20:22:59 +0200
Message-Id: <DKWJ6WKOYS9L.34QD4I0N2PJTU@gmail.com>
Subject: Re: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-2-6a26c8e9e2fc@gmail.com>
 <20260823181259.AA12B1F000E9@smtp.kernel.org>
In-Reply-To: <20260823181259.AA12B1F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:12 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Registering the hwmon device before requesting IRQs exposes th=
e device to userspace before its resources are fully initialized, introduci=
ng a probe race.
>
> Pre-existing issues:
> - [High] Incorrect endianness conversion on big-endian hosts for SMBus wo=
rd writes results in writing LSB first instead of MSB first.
> - [High] Dereferencing a potentially unaligned byte array pointer using `=
be16_to_cpup()` can cause kernel panics on architectures with strict memory=
 alignment requirements.
> --
>
> --- Patch [2]: [PATCH v2 2/4] hwmon: chipcap2: fix IRQ teardown ordering =
---
> Note: The standard review format has been altered and direct code quotes =
omitted to comply with recitation restrictions.
>
> commit 28a819427451e0b54e63443c10cc5e1979c146bb
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> hwmon: chipcap2: fix IRQ teardown ordering
>
> This commit separates IRQ discovery from IRQ registration in the chipcap2
> driver. It ensures IRQs are requested after the hwmon device is registere=
d to
> fix devres teardown ordering issues.
>
> [Severity: Medium]
> In cc2_probe(), the hwmon device is now registered using
> devm_hwmon_device_register_with_info() before cc2_request_irqs() is calle=
d.
> Does exposing the sysfs attributes before the IRQs are requested create a=
 probe
> race?
>
> If userspace applications interact with the sysfs interface immediately a=
fter
> registration, could the read fail with a -ETIMEDOUT error because the dev=
ice
> is waiting for an IRQ handler that has not yet been registered?
>

I am not sure what to do with this, as this patch was actually meant to
avoid the opposite issue (IRQs still available when the hwmon device is
not) which is worse because access to freed resources might arise.

> [Severity: High]
> This is a pre-existing issue, but looking at cc2_write_reg(), the code ca=
lls
> cpu_to_be16s() on the value before passing it to i2c_smbus_write_word_dat=
a().
> Since the SMBus API internally expects a host-endian value and always tra=
nsmits
> the least significant byte first, does this logic cause big-endian hosts =
to
> transmit the bytes backwards instead of most significant byte first?
>

This issue was already mentioned in Sashiko's feedback for [1/4] and as
I said, I will take a look a it and send a new patch if it applies.

> [Severity: High]
> This isn't a bug introduced by this patch, but in cc2_read_reg() and
> cc2_data_fetch(), byte array pointers at odd offsets such as &buf[1] or s=
tack
> arrays are directly cast to __be16 * and passed to be16_to_cpup().
>
> Can these unaligned dereferences trigger kernel panics on CPU architectur=
es
> with strict memory alignment requirements? Would it be safer to use
> get_unaligned_be16() to read these values?

Same here.

Best regards,
Javier
