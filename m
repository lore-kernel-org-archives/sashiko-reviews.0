Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A241D11C
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747381; cv=none; b=ZNhJBFSE1qmFFTxZSjs59jxaXYAIXvppL9JuA+YfMOx/V1mh83YpWmXU9I0XWs/MEZZ5e3r1L+rOQarFq61NsP8KpfGdd4abjtCt3sQ5i1mn+jEm1moWJ2H3OsptjoGPecqpmJzfJ64RtMjmzbyGGb+o874kFpIlR82JVTAtENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747381; c=relaxed/simple;
	bh=1YEPH6fyCfdk+VtHwEVBmZ2Q4SPTrHVnUjJjwSGahC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvJtk52EogthBmtst5rVr8MdwcOaa/q6HIUCJAmlsCEcdi8KLQTAu/6Png3zKe4aP44eQx9XGGZVMaZW16yBaMg+UwTTQxqWPQinnjwS2sRAVrDvWqOjq2iirlfRNQhFKJ1C7/PnDahwmEoYCmXbz2QxhFqy8WAouKVSzUjheFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvgvQSJO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvgvQSJO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caea3f742bso14985465ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747379; x=1788352179; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hz1GwVL5UrSeb6anZfq9UpCexQvVXd/F42ozF8YHT78=;
        b=IvgvQSJO4+9r6wdr8C4u4K+7zv1OTC+yth2cexQYIRyGkbuJepqmRkXsZI3JeLz2Hu
         Me3267tzN78uz9/Oz8AGZBYkrreYs/KiQyy7uKfWOmeDXHq3nijHegQBGt1ILiixc5Uv
         Y3ThFyL58l1z/psFV5JbXqziNO5aEN/J1q2Op494+lF5i47N7m6/bcLx0/SL1XUoapA9
         vTmhIMQcEFauG/sDrv2xydJkB7g45B6wlhs5RQTnWEDFehx82rTYERK6WBk5T9zemFWJ
         h48yhd/h9zMwlUYtJlFhwWYPlHPVr+IWoQ09kmCoz6m1LRXPWJsh20XHJA8KRlNl6HWz
         +8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747379; x=1788352179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hz1GwVL5UrSeb6anZfq9UpCexQvVXd/F42ozF8YHT78=;
        b=sQI24OyBnxpaTihYPn3PGWWMerpCiPW6hCyTXYlzQDHBzLZvQqkeZ8SJlH36Lx3kzF
         pFe420VnwQdin/NkTOLpe2BkVM2UOVbOu9uGPLaEbrffTO/lblvrGp24u22LDK1bjkmT
         2CNUCAgy50EuVGP5cDI68FUiu+GERgtO5tHs4V5S1j6j1ATgTJnmBzAXZIDMrvMr03cO
         T6pz8Ix/PxDnKGuLDrqQgt3OdCubP2ob59MYaJF26Oa+NlDxr6Wrd1zrLFLz1ks2JnZz
         Z5l6ozc4zOV+pYgbVX2A8NpvWSCccNrJxreau50Sk9FzG+kXepJ/RO9tb8ETTO1W0Dzs
         Mf3w==
X-Gm-Message-State: AFuF++lslBA2ZuSJyg7iMbsbnl/mBA/3HXnbyi3niHIOEnOZJRWk+uVz
	iifxjBSbmhu8Tcs7CJGqCRy4BxUdiT5WxVaLIRgX+hhhty/3UJIPn2zx
X-Gm-Gg: AR+sD13+V6U4Ne4SDrXDHRYkUvbGbliD62rg8s7dY/JCvAAPh21qfSGEPj8D8E3kzn3
	SRFJ7uJahW2QLkiyA5BYNSNEZHWq7m270qCnLyQBpYGdNqt4rR5BKp1HkQe+AWSHUdbOSmtryyY
	5Zn/ZaqTzGpJlsLljHAnz/P5ytPUodllgHsEJQArtTkiXbsmfuiUeD7RiGYH6IhCDTvA29RKkPZ
	z3Oep8cQlKK+NlrvBEMg1Lvdx9ez+8EwfLPOLZ/wR1Kx+TG8X/lubk7By36z84j+bbzIi2EA393
	a9q7k0fGcj+HEHYDWXM47OhSjfNuKcNLzgxCdnLQCWvEF5lOSg/jjSsvyY441FlZ1uaQ+YOX3u8
	jYNxMNQCM1CFykk5Cqhe1dYdSKCpbGZ+DNdiOkv0SJ/siNsNcrQWPRHlv0O4RkGfEUErkJPmB2D
	LLVX/ro89j9wQQIoarr6lld2Bcz16uL9yqpj+BmZc5soSyGtsmA7C5IApYr4q0ZpyKcL5nV0wCm
	8iIaeuC2hEWmd9Pzn6b39OyzB6r
X-Received: by 2002:a17:903:1b43:b0:2d1:1d3d:97b2 with SMTP id d9443c01a7336-2d707b4638emr127553445ad.11.1787747379127;
        Wed, 26 Aug 2026 05:29:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8861d3sm13158441eec.18.2026.08.26.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:29:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:29:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: sashiko-reviews@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: adp5588-keys - cache GPIO state before
 registering the gpiochip
Message-ID: <ao7bQHVDPObeaISA@google.com>
References: <20260818-adp5588-gpio-cache-v1-1-650a2674fc0d@analog.com>
 <20260818161119.E25A31F00A3A@smtp.kernel.org>
 <aoSFhKxPk-QPv2EQ@analog.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoSFhKxPk-QPv2EQ@analog.com>

On Tue, Aug 18, 2026 at 06:27:21PM +0200, Alvin Šipraga wrote:
> Thanks for your review sashiko-bot,
> 
> On Tue, Aug 18, 2026 at 04:11:19PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > This isn't a bug introduced by this patch, but this patch actively
> > exacerbates the consequences of a pre-existing issue with missing error
> > handling on I2C reads. 
> > 
> > If adp5588_read() fails due to a bus fault, it returns a negative error
> > code (e.g., -EIO). In adp5588_gpio_add(), these negative values are
> > silently truncated to 8-bit unsigned values and stored in the driver's
> > cached GPIO state (dat_out, dir, pull_dis). 
> > 
> > Because this patch moves this caching to occur before 
> > devm_gpiochip_add_data(), when a GPIO hog is subsequently applied, the
> > driver inadvertently clobbers the real hardware state by writing back this
> > error-corrupted cache. Can this actively undermine the patch's stated goal
> > of preserving bootloader GPIO configurations if an I2C read fails during
> > probe?
> 
> If the reads fail, I would not expect the driver to behave properly at
> all - neither before nor after this patch. It's true that this patch
> might trade some broken behavior for another type of broken behavior
> though. But only on systems where I2C reads are failing.
> 
> If the argument is that such a trade can be considered a regression, I
> would point out that the suggestion here - to add error checking and to
> fail probe on bus errors - would invariably cause probe failure on such
> systems with buggy I2C reads. That's also a regression.
> 
> > Additionally, this same missing error check causes severe issues elsewhere.
> > In adp5588_report_events(), the error is bitwise-ANDed with KEY_EV_MASK, 
> > resulting in an invalid, large key value. This yields a calculated code
> > index that exceeds the bounds of the kpad->keycode array, causing an
> > out-of-bounds heap read and leaking phantom key presses to userspace. 
> > 
> > Finally, in adp5588_gpio_get_value(), a negative error code evaluates to
> > true, incorrectly reporting the pin state as HIGH.
> > 
> > Would it be appropriate to add proper error checking to adp5588_read() or
> > its callers to prevent state corruption and out-of-bounds memory access
> > during I2C faults?
> 
> Sure the driver can be improved by adding error checking, but that would
> be a much larger change. I hope that is not an impediment to getting
> this particular issue fixed.

No, not at all. Especially something that was identified as a
pre-existing issue will not usually block the acceptance.

And please, take Sashiko's reviews with a grain of salt, not everything
that it identifies as an issue is actually correct finding.

Thanks.

-- 
Dmitry
