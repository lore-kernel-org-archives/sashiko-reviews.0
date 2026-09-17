Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C84FD791
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668154; cv=none; b=Q5xQ0Kb9N0O1cpViHhSIej8Dz1SzCthV/7If0LeWpRTF9ri7IYNEiXGJ/x+58yNT6ncX3v9lHMwENnlpcUZia9hnKz5Z/Mw52U190WbHVV/7Ce77SSVbUysiHuWH67qU7T8Sq5rMh4EpFoE9axvyRflSw+ASmcRqmDdR4wdOm80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668154; c=relaxed/simple;
	bh=fWeVX8x7HAmbo/Np4MivXSYP5FclmPOlzMclAQTIwug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBBmin+4Q5nGnYDbVzcKNbkN9eujoyrp7XR79aACXsk48kGcI/pAQgqKWnnzBzcc7P9NEbSTfWwI872y1WurorkaFC6NVuqk+NUpqtYRqFeGo4NMhOeJbymnkm71QNTKcOIba3hZGirgE54FeO6Sc/KvCupNurpomj5tnUqWa/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un57wwUT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un57wwUT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5732145e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668151; x=1790272951; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP61s3LnDYIz9su7+Im2NBnWl8yHpK6Gkwrf//woF6Y=;
        b=Un57wwUTFliOlJTx1l4jf1jKTk3DW4vn8rFC8m0XCmUnTcU18l0tQ/Za/G6dqRvUaq
         rZ2LJUE/wNL/eQJqQ5eDIzB/Zo0HAcnD8+bVFDW2n1oRUvFEpkBt0Ni5FoiHLuBh3Sun
         zRw+aqAiIxvoRcDo9AQivdwQhXX/A3v120pKlfyNBYdZ+AHLcFtwEherVWzCcmWTWgU/
         ezC9zcUSTl6MfT0x2p3z6sJRAxNbRb63RYSS0eD9U3OPU/oRBQjjUINFgSQgpj5VtZvk
         vB8CNvsU2Y5FnWiF0novNA62TwEKrjELpWgSIC1hKejPRWSduEz6tDBoM2V11wWoQ+oA
         llBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668151; x=1790272951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP61s3LnDYIz9su7+Im2NBnWl8yHpK6Gkwrf//woF6Y=;
        b=Jt1Cy6o8toDFlDUpkEBhJNjAEXucAEf2qxyY0KYdiyYlT0SqT3M1GzFhGRZTz9bree
         mkxdfM7CIBWOVtXOBF1FBWpxSdiHkZhnp+N7/Rutp7YyOSjuKhS/UTJFMI3bbvg6MW6h
         jVT0BHOvCiGhh3zO3prutGomJd3mzY8fZU3l49kJ8FAhobMwnrrCCCXFbADvGj6GVacK
         tYVMl/qMux1+I8vRhgz3Un0plDzxwzwt5dDAe1f/1S91pXY1P4ypg5c51Sbt/JFMSvck
         Up2KZ6d2oo5qs/pjsOVEz95Mn2U20bmX2a7GJMWdNxPuHfOJaz+r3Y/mppaseAk7jMe5
         VmAw==
X-Gm-Message-State: AFuF++kdVOFsa3MDXfolwDD4ldDyS4uLEI3rocEf0E6I0U9QAQ6hLlSw
	Rvji8hmbgfoFem0eJsk4JYnPB7bbLi5GnArDUiUAVUOOoJ0dKDLr+i+cH0zvHw==
X-Gm-Gg: AYBFou13n7RN6DoGXq1SGUklwshK3lrya/PBhvXDUew7UWObJ8NKJLlkMTEPbC1bEHY
	pWG5F2CAxQ/coSHwvto1MymO7cYnszDHyuI7BYMaX1Z3D7cAHM2G+ljoPf1VpNDffewQpXfHP69
	NXxtGw8Ks3tHhPPfZpCnrnxAuHBFnWvgpHZxqdjIC7c5W0qBgF29lMcswm4Sl5GGXwZ1vefUWeo
	igqqVZEExtgcegVrMwfla9NA4OeQlvbyNvcLyWqpKKnZ3ezucRIcCBGjuategf66m/XtZwWXaaN
	Tj4IGYIShhPLlnAnVhPm9edrtjr09SOz51xnwMhN9SyBXQtVB3xjY27KeI44QOTFhy4r1vkcFcF
	iYBdcAKZElzCK/oZydWSbJr6CUISdDWz0ak2stjVsG7vQNpXOCEDrq8xyjOM9kbSVvkzSCJS9nM
	fGIy8mb8jIAbvzymQEBtjwcWWsyz2XVfg9nxIQAmBbkjJoa5SXAmYncQ==
X-Received: by 2002:a05:600c:4ed4:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49eac462571mr89969195e9.2.1789668150501;
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Received: from antoniarch ([78.211.139.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm96803245e9.6.2026.09.17.11.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:02:30 -0700 (PDT)
Date: Thu, 17 Sep 2026 20:00:44 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Subject: Re: [PATCH v7 4/9] rtc: abx80x: properly handle shared IRQs
Message-ID: <aqwpLXghj-NWgH8w@antoniarch>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
 <20260916205138.16771-5-apokusinski01@gmail.com>
 <20260916210527.CF14B1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916210527.CF14B1F0089A@smtp.kernel.org>

On Wed, Sep 16, 2026 at 09:05:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] rtc: abx80x: race condition loses interrupts due to flawed W0C status register clearing
> --
> 
> commit 27cfcb7135851594344aa538f01f8ef1328d2392
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: properly handle shared IRQs
> 
> This commit updates the abx80x RTC interrupt handler to only return
> IRQ_HANDLED and clear the status register when the alarm or watchdog flags
> are set. It aims to properly support IRQF_SHARED by returning IRQ_NONE
> for unrelated interrupts.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -284,9 +291,15 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  	if (status & ABX8XX_STATUS_WDT)
> >  		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
> >  
> > -	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> > +	status_flags_clear = status & (ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT);
> >  
> > -	return IRQ_HANDLED;
> > +	if (status_flags_clear) {
> > +		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> > +					  status & ~status_flags_clear);
> 
> [Severity: High]
> Does this logic introduce a race condition that loses late-arriving interrupts
> in abx80x_handle_irq()?
> 
> Because the ABX8XX_REG_STATUS register is W0C (write-0-to-clear), any bit
> written as 0 will be cleared in hardware. 
> 
> The expression status & ~status_flags_clear forces a 0 for all bits that
> were 0 during the initial read. If a new hardware interrupt asserts between
> the read and this write, its status bit will be newly set to 1 in hardware.
> However, writing back the old status value forces a 0 for that new bit,
> silently clearing it and losing the event.
> 
> To preserve unhandled or newly asserted bits, the correct write value for a
> W0C register is ~status_flags_clear instead.
>
Not really: if the register bits are written with 1, then during the
next call to `handle_irq()` all the interrupts are reported as pending
(in other words the written ones are preserved). 
In particular, when I was testing the alarm interrupt and the written value was
`~status_flags_clear` as sashiko suggests, I was always getting the WDT
bit enabled and hence the alert "watchdog timeout interrupt" was
printed.
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916205138.16771-1-apokusinski01@gmail.com?part=4
