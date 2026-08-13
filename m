Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348FA43F4A3
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609170; cv=none; b=hu3ZtCn60HpYsAaDsBXahQjsIwL+sW6vgOIIQgHZAPEhBuJ2g7QOreElt2xUG3SD7+CeDSXRvOTqkJyBtZL99Tsm5P9cz5ZEETKhscTwYQzNQZLP/qJd8s3khANJS2Cr9q5xdvADa8X34JoCUS9SpKwvNlBjTNrwBYf4mEWIcZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609170; c=relaxed/simple;
	bh=3o0ghu/JaY4o1UrD0lyf5hXneVEdMI/7Llifd12GZP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uDBTOGwRSeUGcZGGV+snbdlrq0vKgzjUOqXS5tKp1TGpm4GSfRZMUwjpez4Q69/6q2V8j04W9tA2CcKb1M5VJlqmvmsmPhJH4jXhZ/PJ8z3gAo8Y7w87tK9x2php7CXrvG8eaYeTqvYskwaSyvzPjZ0B/SQ1AtMDdEH3eIGbbEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jKDLWCoi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jKDLWCoi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f96c5b722so942725f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786609163; x=1787213963; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jnnmyEy0HKcgC5aHIY6kah2VQrRaESEvLGC8LbPQC3Q=;
        b=jKDLWCoidE61XfXhxcicE5Vo0xBSbAA7S7BrRwPpk0pBHCfYG2Xsz5Gunx99yjaHB3
         8RC6k3tdicpglkt6BFIe9ktgan+ufsthVw01gb3NW1H8bGyNeJ8GiZmo61c5GQULAdWx
         7LVfe1YIvFKh8L0P8nL/cxkJDPc4Un0bjJylzouhI4EfXuUxWgukpqIOLWq1Si1xuYHd
         /QhwjM8R2u1vjDClKybg20ad5ioKBGmYttpdoJQ4LvLQCzK3bSbZr7NWIvsKo+dbKkCc
         l/uWxGgEV/R+mbcpUpCXPWK+rBv17f+Nwxkrs3nbqJpfaAx27j2qbZWrL/pJrz53Vitn
         MCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609163; x=1787213963;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jnnmyEy0HKcgC5aHIY6kah2VQrRaESEvLGC8LbPQC3Q=;
        b=OHYmTrD3OjM16/HB7j3B6LEnmKRAZN0US/H01XtL5wNRVTAkEcu8Z0JUauMEHRLhay
         1nXDLHhme/KrvX7Fj+XcatoQ2I/ilsn7O0Tlkp6F2zlhFMRjVNX/vKuzD1deJc7N3nRd
         ZBZK10qsgJfnMctyeBo55NdMKUE6AbUnfWk4AeEyb8gsVWfFWqDCEKEXIxiTwRuEw4oD
         GeH3zoFS2ElqorJ4ivPkT0keJPEcF2UpeXk7Oggt/vcUp3YpH+/Rh6HPE3vFjzwxudL1
         qfnfZL61u9KnTdaiaw0qoaaHDC0zHAFadYy5ZTSqBPSiipUv0j37Fmz2hw43vE/0fUfq
         6Ihw==
X-Gm-Message-State: AOJu0Yxj6jPUrP+qoqvQt9Mth6DlnYsdOhPpQD99xEPRrpME72QY90xp
	lDuYoMFh4bQRhy1VsxxtU1fPMNk8xZiTHLjmB4Vy2+kyXxsShofxnfFONZcJlsqKoImNu/JwbqI
	Gfb/mXXw=
X-Gm-Gg: AR+sD10zL0zhpT6bbh5r+a1PtWofDtk9dGYBy09/kEGbf1TEpA0BWzvF0gI5gK4dkHY
	eiuQZiiFWBV5t9I6lZKyKP0k4cy/zRwuO6yC8myCeIOFV3WpMafM76bkgDz96WH72tBXr8g806J
	ytKXZT2KdVlPpMtEGA6fXVlEXKptegM0+KVSGOwcEVmtDdTnNO0VD0MlaMY35toZGTktJp683my
	qUwboJ6GSH4J133Fpfiesm5FszjV6DN5CuXaA3cX4kU6ucYCWP5lKEk8xV5/QvedA99D9Lqx1A0
	bzA76Cg4Bx/pwEc9uSFSC7l74CAOxZFj+Fgo1q5vl6OHbAj82YqMLGTRDKOAYQJ4PhSEUsX49kU
	RC0bqr/V6OOdforZmafu7RxaElKQOdahGLxWcICC762G4FoNh/GisFRR7ngihr0w897yOMezfv9
	VD36ET3Q3K/1epTkmKbCBQxRm88d6y8jdMz9BX55UxtN/PZQPCx0Vzk2h8CZI=
X-Received: by 2002:a05:600c:3e15:b0:499:819e:db2c with SMTP id 5b1f17b1804b1-499821d7ed1mr43073485e9.16.1786609163484;
        Thu, 13 Aug 2026 01:19:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd31:7f6f:53ba:7518])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981e438edsm39581985e9.4.2026.08.13.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:19:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717
 cells
In-Reply-To: <20260812213712.1A8671F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 12 Aug 2026 21:37:11
	+0000")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
	<20260812213712.1A8671F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 13 Aug 2026 10:19:21 +0200
Message-ID: <1jqzk2fn5i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 12 janv. 2008 at 23:37, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Medium] Hard-coded cell IDs are used in `axp806_cells` and
> `axp809_cells` instead of leveraging `platform_device->id` or
> `PLATFORM_DEVID_AUTO`, violating MFD subsystem guidelines.
> --
>
> --- Patch [1]: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717 cells ---
> commit d0271b0bfb6609a5dbfc9c713361a49994e56202
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> mfd: axp20x: Constify axp313 and axp717 cells
>
> This commit constifies the mfd_cells arrays for the axp313 and axp717 chips.
> It aligns their declarations with the rest of the supported chips where
> the arrays are properly marked as const.

As expected and already explained in the cover-letter.

>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 679364189ea58..22baab6e10fa6 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>
> [ ... ]
>
>> static const struct mfd_cell axp806_cells[] = {
>> 	{
>> 		.id		= 2,
>> 		.name		= "axp20x-regulator",
>> 	},
>> };
>> 
>> static const struct mfd_cell axp809_cells[] = {
>> 	{
>> 		.name		= "axp20x-gpio",
>> 		.of_compatible	= "x-powers,axp221-gpio",
>> 	}, {
>> 		.name		= "axp221-pek",
>> 		.num_resources	= ARRAY_SIZE(axp809_pek_resources),
>> 		.resources	= axp809_pek_resources,
>> 	}, {
>> 		.id		= 1,
>> 		.name		= "axp20x-regulator",
>> 	},
>> };
>
> [Severity: Medium]
> This is a pre-existing issue, but is it safe to use hard-coded cell IDs
> like 1 and 2 for the axp20x-regulator cells in the axp806_cells and
> axp809_cells arrays?
>
> The MFD subsystem guidelines require using PLATFORM_DEVID_AUTO for automatic
> cell indexing, or platform_device->id if numbering is explicitly needed.
>
> Can this hard-coded cell ID usage lead to device naming collisions in sysfs
> or driver load failures?

-- 
Jerome
