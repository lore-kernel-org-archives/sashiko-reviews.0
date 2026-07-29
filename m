Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343A436BDD
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314438; cv=none; b=twZHwz10DJrX7Vaf1m2g5gNeFXlXruBurKXvSdR9O3iSk2SwtaFK863m9Gh3+JdFiDJSxF+oiaZfy5g3F2BltcFt5Ulti915tvdAfJO4OEaSQpSIhmn1B75Vezp/9Dyh5pYAAYupsIPaoE/JsyXBAutl338PjkrWmMKoxbhlPS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314438; c=relaxed/simple;
	bh=6L+2HhKKl5Dj/xnqKaKM7XXym8YRbHwjxboMTP88nYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ODqWSourMTAOzavb9pI661Kfi8iW0lPzXR3c3PqK4PkHMjQp+QgZzxleQfNOfXSpvNaTvGPQDo+Zb53JRMoc5YRr018dTQnQXuG9IQjSccKhbr9UkjM9V10vX/dintJQXYxVlggqnGzIV00WCu73gfM7LE+egUVtefY7KhkdaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z17o4+6h; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z17o4+6h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D6BAB4E40FD9;
	Wed, 29 Jul 2026 08:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2BA06039A;
	Wed, 29 Jul 2026 08:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CED4311C11F9A;
	Wed, 29 Jul 2026 10:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bzEbbuYZWZc50WIZy1HsrIgMjUCihehMfow+qFrkT9U=;
	b=z17o4+6hvpHbmMlt4xKjB03wUr84tz0k7nRjkOFLsbnwd8ilbYkRsPgtUmfpNEg8VSlzCQ
	hk4hwumwjKOxqvCG0gk3YINdY53mtehfHcw6MzY5tTkP/+YyxYPWGf1t/G3fks4O+lJx4S
	V1aq+CPWv0xsIchJB9RRIHobngsOIV3Bg4JdQ73KrTSaUBXg/dXwRRJm7XX6Pelz3CtV/a
	24w9tvyhM1In8Nq1Dh6VIb7rh1Q0ZKCS1S4vgJ4Fn1q9W3fCq68CfwKwDuPWed86sqIIZT
	jJ0eGQRjmLTWNVoouamVT2Tv86coIhL3rGqSk7xleeIESnQdXOxjJ2eLWtstXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  sashiko-reviews@lists.linux.dev,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Michael Walle"
 <mwalle@kernel.org>,  devicetree@vger.kernel.org,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  conor+dt@kernel.org,  robh@kernel.org,  "Richard Weinberger"
 <richard@nod.at>
Subject: Re: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
In-Reply-To: <20260723113443.06C2D1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 23 Jul 2026 11:34:42
	+0000")
References: <20260723110219.3180747-1-s-k6@ti.com>
	<20260723110219.3180747-5-s-k6@ti.com>
	<20260723113443.06C2D1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:40:31 +0200
Message-ID: <87ldaumbnk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Santhosh,

On 23/07/2026 at 11:34:42 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Using strict equality `op->max_freq =3D=3D post_config_max_speed=
_hz` as a sentinel is brittle, breaks high-speed modes, and can inappropria=
tely elevate frequencies of un-tuned operations.
> - [High] Ops running at the post-configuration frequency bypass the `per_=
op_freq` capability check, potentially causing unsupported controller behav=
ior.
> --
>
> --- Patch [4]: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_fre=
q() about post-config ops ---
> commit 929442442d981a80e44b25e60b6fa3ecd9dc8a62
> Author: Santhosh Kumar K <s-k6@ti.com>
>
> spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops
>
> This commit extends spi_mem_adjust_op_freq() with a bypass for post-confi=
g=20
> operations. If an operation's maximum frequency matches the configured
> post-configuration maximum speed, it remains uncapped, while all other
> operations are capped to the base maximum speed.
>
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index a88b9f0383564..e20eca1b82457 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -591,9 +591,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
> [ ... ]
>>  void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
>>  {
>> +	if (mem->spi->post_config_max_speed_hz &&
>> +	    op->max_freq =3D=3D mem->spi->post_config_max_speed_hz)
>> +		return;
>
> [Severity: High]
> Does this strict equality check reliably identify post-configuration ops?
>
> If a hardware-defined operation limit exceeds the board's tuned rate, the
> exact equality check will fail, demoting the operation to the untuned base
> rate and wasting the PHY tuning.
>
> Conversely, if an untuned operation happens to have a datasheet limit that
> is identical to the tuned board limit, could it bypass the base rate cap
> and execute at an unsafe elevated frequency?

I am not sure this issue is relevant.

> [Severity: High]
> Additionally, does bypassing the cap for post-configuration speeds break =
the
> frequency capability check in spi_mem_default_supports_op()?
>
> In spi_mem_default_supports_op(), the capability check is guarded by:
>
> 	if (op->max_freq &&
> 	    op->max_freq < mem->spi->max_speed_hz) {
> 		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
> 			return false;
> 	}
>
> Because post-config speeds are typically greater than max_speed_hz, the c=
heck
> op->max_freq < mem->spi->max_speed_hz evaluates to false.
>
> Does this cause controllers that lack per-operation frequency switching t=
o skip
> the verification entirely and incorrectly accept operations requiring dyn=
amic
> clock rates?

However this one is plausible. Could you please verify? You can just
drop the boolean enabling the multi frequency capability in the spi
controller driver and you'll see how it behaves.

Thanks,
Miqu=C3=A8l
