Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964D1F8691
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 05:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785819801; cv=none; b=dlowcBPPJRKqmiiuBuxf25ow5rboEywI3EQd1L3mrEcixRRtmtuo/2n8PxULkcM4LbTF+XO85VSiHSuShl2R8N8J/C5xDr963sEhknIPgupToZDV2t3J4DzuRnS7tGiUp5kl3U4OdaOa3okG62AN2eDfxPGLD90pc7QGLNXQ9ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785819801; c=relaxed/simple;
	bh=R2VmxxTs+MpXch2wxSsqwZgW7vlIaZ+bgUcmW+Zx31M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Flb5P7BHZhaRVnGxFmXDarPBIJ9LujtkksFGMeKXocLbu2i1IevJwoOri29VHVs/mvI6ByMil2Ozgc+0dXTGNXSeppiHWascpgHSSzirVL1gPSA/C6ZYNZuopYdW0zkFIr4rKBzilsQH1hOSa5i1L+14VohHfspi2o2W3LN7vpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIY/0sC4; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIY/0sC4"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2224011a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 22:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785819799; x=1786424599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8CDi2Jj1vQpqhue3/u9PKS7MdffrHoCAeV6rBW/gOw=;
        b=KIY/0sC4XIf3VKc4CXtU9Y5MeTkZa3qf79AqKiLTyVisdziJo3avj3Ap5K3p1/XkNl
         pI/1GPGT8KrMHo9ERRAjY3jc3pQopSTF1TeUgBbfB6Va1R15J2LlETCZ/+cLH/sgYFhH
         rm8aboUi/XRmtMlF6far+fO1svGbqCKhhi+D3f76p9Wy4VrwQ+UB2jWNvSjiHqpW2SBp
         TquLzHlVeHqTzKInb2A/S4kKf5v9mvT7Ab1LwH0XumYsOXNG9b4SHYD0sng421//iIIh
         N/ZVt6JjzrczeaqpRo73rOdoyNJLJj1Mz/DSkos1GOPuIxehH6erDuZ49RVn4MfMwj0n
         h2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785819799; x=1786424599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8CDi2Jj1vQpqhue3/u9PKS7MdffrHoCAeV6rBW/gOw=;
        b=S6ZKiAA3z6Z0A+JEBFLRnbEiqNuCTRMjHHUSXd+/+XE+XeyhhNEy2fTuZyi8w4OuU1
         FwY945GcVlPIdrZdr0i6seKtZMW3fXe1rxU5bX5mUJoAYCF2/Lan0wfmprGnmCFfQBZC
         uhAwQmU/QMTZ2I0IUR/0PLZYoZVYi9P6G9Bm5F6cgB8uWrtxSTxDEyZBIc7oS3xcyLgQ
         iJCwPNPRt/u2dgXtPPSnYdTYh4pXF26v7Ni0Qa3cZ63b/HIBJl/rCAyRteoyzsNR8zgD
         0CGjDCWKkpH2nW0x5WCtmtqcWukk3MDtslMkrWRWKpc4D7AFWJ5+rl67Ak0uAYu3i83y
         d9PQ==
X-Gm-Message-State: AOJu0Yw04n1R0rKLHuguQLnEYsaFc99yDZjJmjLWDiFiQuzVjBMk035Q
	dL1G2VJGjuBJbnKJ7OrZmlPN3DMkkiarZTxRRH79kQoSLR2yG0neFMeI/MBfqQ==
X-Gm-Gg: AR+sD12Yys/H7Qa2I1UX2WOJQz66jEP0FFmnzDs8dgRiUkf7P3nHTbZb08NL0kZlXec
	yOHyIXDu1lChvYoORQsGQCaAMOIBvUBmYAAPZ2J7+RPeoiyW2dmF3sgumzkZYl8AJ6cnYwl+uLr
	iFq9bqiraqZUgKBzGHhZTiR+Egx7+wiOJB3jSPmboRAcQT7q7BmMBz7bb+NEaGnWNFnlPHHDftn
	nAV9pnmPS3jDBEroTmNnMGkGgq5ZD8NDjj9BQXLCOzr/OCO3pHMM/drRp/qkrbi9cU9qUD71ArC
	QHSWvHo591ndrPtGTfVwVNxNUvhLo8DVB5e51O6UvDKv+gDUQDcmummog8fO7WXS/Dhuab08wZ/
	fuB8QEIdaiTqXYkgw9yM7v8bOUMrEDFb9eTOvgOcQq4uzt3HkGpMmi+P5SWu2s+kpwGaxuXQ4Cx
	Y4EsIlZ6MH6e8lcq7AXetfaD/iu/IAfHxg+RbUvMf07MJ9E2n1pU6WbgGjtQ1T+I9NXtJIqoAfb
	ShvZw4i9UlQd3nX9brwjxdE5JYYBMynK+GY0Nfu
X-Received: by 2002:a05:6a21:3a96:b0:3b3:1b38:d9d6 with SMTP id adf61e73a8af0-3c92a89da25mr12660784637.39.1785819799052;
        Mon, 03 Aug 2026 22:03:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm49653631eec.0.2026.08.03.22.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:03:18 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:03:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marco Felsch <m.felsch@pengutronix.de>, robh@kernel.org, 
	linux-input@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <anFxs8grhvIVSdNA@google.com>
References: <20260703-v6-10-topic-touchscreen-axiom-v7-0-0d2a550a7ee8@pengutronix.de>
 <20260703-v6-10-topic-touchscreen-axiom-v7-4-0d2a550a7ee8@pengutronix.de>
 <20260702224804.E0B0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702224804.E0B0D1F000E9@smtp.kernel.org>

On Thu, Jul 02, 2026 at 10:48:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 18 potential issue(s) to consider:
> - [High] Missing bounds checking during firmware chunk parsing allows malformed firmware to trigger integer underflow and out-of-bounds memory accesses.
> - [High] Invalid cast of regmap buffer to u16* causes endian-dependent behavior and corrupts register addresses.
> - [High] Unbalanced pm_runtime_put in firmware upload cleanup leads to negative PM usage counts.
> - [High] Firmware-controlled allocation size allows out-of-bounds heap read when checking touch slots.
> - [High] The driver prevents firmware recovery when the device boots in bootloader mode by improperly failing the probe.
> - [High] fwupdate_lock is held across system calls violating kernel mutex semantics, and is double-unlocked on error paths.
> - [High] Improper devm teardown order causes Use-After-Free of the input device by background firmware upload threads.

I am not sure this is true as sysfs attributes should be removed iand
handlers complete before we get to remove() method. 

> - [High] Use-after-free of ts->input in the threaded IRQ handler during config firmware updates and device removal.
> - [High] The driver waits on completion primitives for hardware resets and saves without reinitializing them, causing future waits to falsely succeed immediately.
> - [High] The driver passes stack-allocated buffers to I2C transfers, which violates DMA requirements and can cause memory corruption.

This is Sashiko's hallucination.

> - [High] NULL pointer dereference in `axiom_remove_axfw_fwl_action` if `devm_add_action_or_reset` fails.
> - [Medium] An operator precedence error in subtracting the preamble and postamble causes the calculated report payload length to be artificially inflated.
> - [Medium] Probe error paths leak PM runtime references and fail to disable regulators.
> - [Medium] I2C read errors are swallowed and falsely reported as success in polling functions.
> - [Medium] Missing NULL check on `kasprintf` results in a crash or broken sysfs state when registering the firmware upload interfaces.
> - [Medium] The driver lacks system sleep power management callbacks, causing the device to remain powered on during system suspend if not acting as a panel follower.
> - [Medium] Dead code in `axiom_register_input_dev` prevents failing initialization when no touchslots are enabled.
> - [Low] Typo in the sysfs `device_state` output violates the documented ABI.
> --

However there appears to be quite a few items that need addressing.

Thanks.

-- 
Dmitry
