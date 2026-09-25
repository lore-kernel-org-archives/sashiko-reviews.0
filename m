Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACABF49EC6D
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 13:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343995; cv=none; b=tobFanaMBOaATdKwAYlu2AeatFlPThp9fEbMgXVYMtHQVYIHjl5/Bs4aSTLPAkqyFY8S0hknAH7U5WbTxCGV139RuylKdfCwBNtwlTlheBT3obD3g8cJnMX2DC1DQT6FAuOUMpSfOaHmD5T8RaLoCYcxxqFJc0UWRk0frdoM5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343995; c=relaxed/simple;
	bh=A/dFqGFagsOa4cbDQX2zLj+dKAg085FQZdmwPQWYu/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObhhBXeieYQpSLogtUpBf+QgHJUQ4mMpUJd5GVHmKLqda0LTPEwtNK8ABZ3WXnJXzFeadBr7z7rlFqs5fxQwwq1dumE0mx10XVI+avnJhflsVv9BQ02XY3GitVnS6xj/gVWxbE5LLgpc0sDpvlXIlD0fEng9MEBk8JIQv9H1YbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSqc3Jz/; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSqc3Jz/"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1deaso66334a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343992; x=1790948792; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjQUlVePIHKvlpRxk8hYR0PeRg7AQzrum5C8cdG2ps8=;
        b=hSqc3Jz/zJm7iXkNhSK2FmY/PjWIPTsUoGuCnBMVgErRgUHH8iRTcTL9/mGrgF6spn
         x7S7TJP5IZ1vU39KN0bENqEgZf0qQH+BagIjW9EIUXVsvjauFIEk2VTiaCsKTavZDSo/
         XJ8MjvKrNqfibubGc454qKfI09j0DAYSJ8o5pw3tP8yGp8/B0Eb5pDs1bl1G773LVK/k
         JOO0AHhQsJjVlJf+7xeo2NQTjXrZWyHKwEEcN4u/qvGce1rG7KLaPjaEBnDdUHOn4LU6
         NHtGqW6fb35UT0jk6hIrtTGtmDYVa6MFrRk0WzrywxScdzQJ7RWcWuqVuQr15KPVS9YJ
         9/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343992; x=1790948792;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjQUlVePIHKvlpRxk8hYR0PeRg7AQzrum5C8cdG2ps8=;
        b=if5hVjhtPabH7Yt3aykAdDLP5jrVSYfuhBO46XrcV77jeWO4nmF+J+GWUcJ7duvLri
         TQvkcipquD8GsCeCdgIFwWVzYbDQbcTDzdG7JO9RLv8fWlKFFjF89CkILMGpM4o0ozmp
         XDUyHvSDNBYxQD0UHHGKEJdxLt5ZVqq7dLyFup0Daqp4ItMVI98l8qTrREhtnwitw/GY
         W+HB9Q1x0Pb0Bw7/WrmmRwK0Ej174UDcetpTGFWRTif1FT4Q0RI5uWla7cIklnrS0UBj
         BcYS7M0mmBKjkGnRUoFKi89/NKgJdhuA+CF8Wg6Fn6U4AV4c5qWEV4XCPBHXEVD8VG4y
         1IzA==
X-Gm-Message-State: AFuF++m+ULlvPEQvZZY1oKE7jj/0FsBDiNLv43YaY0UfSlxIp68/FrOF
	ad+jo7oCEQDnKS7rk0O31kY+Y97Db19i6mPNTD03AZ3v1CD2iEC7Ky4tuUgHbC4T
X-Gm-Gg: AYBFou3zrdLtIjdaedz6j/J/PgCfixfO2yEt8MtNg2o2uUnINSOJoofYbdnNgJYiKvN
	sVIXzPMSkO0ojwnt8A9DoWluqyWX8DSHeMRvGgeUCEQ2pw0gUfLLgeFHbV8h/aYZ8gojQaEpOP/
	LeOlOFOXmsbuYtStWysBn+ASLjUzLAyDuEzDl7DkOz8qhDHK0TRER756uNeEJ2wic45rqxtKNfO
	1lvpQCMhJrKpWC6PMi81KK8BDM0kNafAa5smL9qDMvpACLaaWEmijChRa+HI6f01DDMxYF8X2Wv
	UUr4V+P6pWOm4z+XCQCvQETnBqpTT0Ww1pqo0OnS44cwIM8+LQtk9Tkq+fSnpUdsNJXkR9DB0AZ
	LIoOTy5jYiMqw54aec4lBbnBFTp2AsIplu71W+mcDr0mh5djSd/CzlewRNnoPbL+7CmVLA49uSm
	+qeYeFtsBtCuqWAEUpYUSSyu8DmnM/WdBpnFn9guIlmlGXxAr3LivsGU8Bu8qAu8J1wYBadargL
	tkBsEn6+FAY
X-Received: by 2002:a17:90b:48c1:b0:3a0:7d5b:8d55 with SMTP id 98e67ed59e1d1-3a098571114mr5432759a91.8.1790343992452;
        Fri, 25 Sep 2026 06:46:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c2e986easm4556661a91.1.2026.09.25.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:46:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:46:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: sashiko-reviews@lists.linux.dev
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 08/11] watchdog: sbsa: Handle IRQ probe deferral
Message-ID: <d9102e7e-a69a-4ad5-aa38-c2cbd9d98496@roeck-us.net>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-8-2c62125d0085@kernel.org>
 <20260925075726.B0A6B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925075726.B0A6B1F000FF@smtp.kernel.org>

On Fri, Sep 25, 2026 at 07:57:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] watchdog: sbsa: system reset due to unserviced watchdog on probe defer
> --
> 
> commit 82d6b6d0cf8ddd44758931db5360cd8439795f6f
> Author: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> watchdog: sbsa: Handle IRQ probe deferral
> 
> This commit handles probe deferral when mapping the IRQ for the SBSA watchdog
> by returning -EPROBE_DEFER.
> 
> > diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> > index e04d42cc7774d..f4491409caf5d 100644
> > --- a/drivers/watchdog/sbsa_gwdt.c
> > +++ b/drivers/watchdog/sbsa_gwdt.c
> > @@ -352,6 +352,8 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
> >  
> >  	if (action) {
> >  		irq = platform_get_irq(pdev, 0);
> > +		if (irq == -EPROBE_DEFER)
> > +			return dev_err_probe(dev, irq, "failed to get ws0 interrupt\n");
> 
> [Severity: High]
> Does returning here during probe deferral risk an unintended system reset?
> 
> If the bootloader leaves the SBSA hardware watchdog running, the driver
> correctly detects this via status & SBSA_GWDT_WCS_EN and sets
> WDOG_HW_RUNNING.
> 
> Because we abort probe registration here, the core remains unaware of the
> device and will not ping it.  If the deferral period exceeds the hardware
> watchdog timeout, won't it expire and trigger a reset?
> 
> Previously, if platform_get_irq() returned -EPROBE_DEFER, the driver fell
> back to single-stage mode (action = 0), and successfully registered the
> watchdog, allowing the core to immediately start servicing it.
> 
Looks like a valid concern to me.

Guenter

> >  		if (irq < 0) {
> >  			action = 0;
> >  			dev_warn(dev, "unable to get ws0 interrupt.\n");
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org?part=8
> 
