Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9043E5A09
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877653; cv=none; b=QBJYX7LFfsDlzqtWW2wy9A9W9e49vPe6DMqkgr4EjUfQxid3+fijqNQenUTTfEypeCG2pw6jLCAgsjF4stN7QIka03Mx6zNi5DCkPmhqMit/t/dB5ADXngEqCL22B5o5LU/jkVv3jxuR3mkJ9xhQc3vss1UZMZvw1zPFvK3hGgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877653; c=relaxed/simple;
	bh=MqyZPi/V5NJx6vV2SdV1+IfypwjkafHwDw7xnDQsGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMEamLAOQczj5JP3UI0OF3n3pi3gasSlvYT9jMjUfAnuPy8Q0MLUpZHKv1KgH9TCe4vtCNAdkTE4k7gQnuvBv+XHFpOSsgYpwWCcR/Xu+hMD6kmeY3LMDOdlNrAYYiVtYTUoJf11rRa9PlSss4UJmYZ5AqLNEhGVdZZMe6OpbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmXFsri6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmXFsri6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so109407f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877650; x=1786482450; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yOWzmUvYZeYNGqxg/uKSDiCHW1g30hB6ShJQ+fmTldE=;
        b=nmXFsri6LEo1X1UwbmxMdjcNyheXFajPGV8fsBNlCQgP42V2N/US7GHBQIwKvQYxmn
         Jljj5m9MoK42Et5cg7lJtUbx65B/V6gOqzcVh8VjLMxkPObA/jTb2xmQ5aNKyU7HPxOl
         DfUW7L+6LrYaD2DaCEZO+4JEAYXvbuq75txEO2Up1I3UY9omYjX7hNVdGwb23GdYKFsh
         9VMkpLksMw8lLaxayNdkPqBUF7sCbxPdMglUZUoySQl403YEpuKzR20GghgGDLK3Oc6G
         51+/lxs1R9cr/YpFvbh+Pr84llkM48iGHf16Pao9D1g3bKmWT4n2G2oh6/kcr+J7CNwF
         66lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877650; x=1786482450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yOWzmUvYZeYNGqxg/uKSDiCHW1g30hB6ShJQ+fmTldE=;
        b=juP5oCv5ckGeuZvnPwAkUcvnHFaTWE8UHcsewCTNn/R2K+I0fvJ27t0s+Xvfo9GUQ1
         6RByE77IZ/t+JQcfZ1AJll3wClLOW2fYLX6LYN2qjW4UXIJiUl2dD64U1j6nP89SPVcs
         upjo6lrmmiYgchdqLawzmsXxN2lm3GmLb3/1BysPzaMD8srDJ43ZuZh6N9GHok7UCd7+
         AUiTZcTis1sU6x76hg+Lr1boLZxHh8huMDiTDyda+R2pJs01IuYxVkwr2KpeX9e3cc8u
         JYDM9QekasKNWaHHVx2CDxOWOw8Cr+axST47esFKC5w2WlfPt0K8fvM9qIQjeTyDY3+c
         z/bA==
X-Gm-Message-State: AOJu0YxGxmndVcR2E1cLm3Aj+EZPzfLBN5yCUWmDSjVW+Bj4Phwl6UID
	bjZd/NC7HAiAW3jblTp45IBlD1UYuF4y7OSGtmfsoHf1sQMe5D6vLc4O1GB1ng==
X-Gm-Gg: AR+sD12kLDr6eTKEgluEFHxlyxyRAl0Gs948LjXo0PyQtxu5WMySzMjicUhoeWlQOpY
	uDII5USfri8qqbTJtsFEeO+1EwHgqPhDg2F9U/8lQ0sgeMpgzwsJInAYEOXdn22kusMkGXnE8v/
	OhXt17zeQLYhWglfj1JSRQVd2yFUTLAqEBUh3RsbojP2tiBR7AEVZaDMJCnxQMmQM2Zr/ICk3xD
	k2imupJEMWv0AJc+ABQox64azl0y3Ccx6/i1QIGaKX7CFa8VfnZXh015RS3si864aw69ACTTfbw
	e1FUTnJy8EpOvwIcFw5ZIrZJPBI9S5u5SyQWCxdxOekz/piWIpmoiS5kCNYe5a9Le4YE6pGT1E9
	OjaSwABFOrRC2M7Fk44VorD0oIImLf13mcyWLNwx1csDfCZXMDGq9CYlf4zlgWsPl/hNgtFRp2N
	t4K7n4amb2rST+7nxdtN6Rofsyt/sM/cSsmAEK+OsSJnXSaInWsqWHlsuPn8X2prXd
X-Received: by 2002:a05:6000:1889:b0:47f:e377:8d61 with SMTP id ffacd0b85a97d-47fec50fecbmr3306220f8f.11.1785877649864;
        Tue, 04 Aug 2026 14:07:29 -0700 (PDT)
Received: from antoniarch ([78.211.212.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e533sm2925271f8f.28.2026.08.04.14.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:07:29 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:05:59 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/8] rtc: abx80x: properly handle shared IRQs
Message-ID: <anJQBtfXjktYm6Cw@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-4-apokusinski01@gmail.com>
 <20260731190522.C11D41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190522.C11D41F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:05:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Returning IRQ_NONE without masking or clearing unhandled RTC interrupts can cause an interrupt storm on the shared IRQ line.
> --
> 
> --- Patch [3]: [PATCH v3 3/8] rtc: abx80x: properly handle shared IRQs ---
> commit e06155ed4aeb662277df57a2324e881c6d065e84
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: properly handle shared IRQs
> 
> This commit modifies the abx80x interrupt handler to only claim the IRQ and
> clear the status register if the alarm or watchdog flags are explicitly set.
> It aims to prevent claiming interrupts from other devices sharing the same
> IRQ line.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -266,27 +266,34 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> 
> [ ... ]
> 
> > -	if (status & ABX8XX_STATUS_WDT)
> > +	if (status & ABX8XX_STATUS_WDT) {
> >  		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
> > +		handled = IRQ_HANDLED;
> > +	}
> >  
> > -	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> > +	if (handled == IRQ_HANDLED)
> > +		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> > +					  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
> >  
> > -	return IRQ_HANDLED;
> > +	return handled;
> 
> [Severity: High]
> If the RTC hardware asserts an interrupt for a reason other than AF or WDT
> (for example, a timer or century interrupt left enabled by a bootloader),
> will this cause an interrupt storm?
> 
> Because handled remains IRQ_NONE, the handler skips the i2c_smbus_write_byte_data()
> call and returns IRQ_NONE without clearing the unhandled RTC status bits.
> 
> Since the unhandled RTC interrupt is never cleared, the IRQ line will remain
> asserted. This causes the kernel to immediately re-enter the handler until
> the spurious IRQ detector steps in and completely disables the shared IRQ line.
> 
> Could we check if the status register indicates the interrupt originated
> from this RTC, clear those bits, and return IRQ_HANDLED?
Ok so it turns out that neither the current nor the newly proposed interrupt
handling is correct.

The current approach is that we write 0 to REG_STATUS so we clear
e.g. the BL flag which prevents the userspace from detecting a low
battery. Also, IRQ_HANDLED is returned unconditionally which prevents
handling a potential interrupt from another shared device.

The new approach that I've added in this v3 is not ok neither
since (as sashiko points out) any interrupt other than AF or WDT may be
enabled e.g. by the bootloader and in this case we'd get an interrupt
storm.

In v4 I'll improve the new solution with explicitly disabling the
interrupts that are not used in the probe function. That is:
* disable EX1, EX2, Timer, BL interrupts in REG_IRQ
* disable "oscillator fail" and "autocalibration fail" interrupts in REG_OSC
> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=3
