Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457139D3C0
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101188; cv=none; b=HGX9TcU1tx4yk9iveg9bVF8loCZHf4oJ03W6pVrpbqX0HfBXkR6MLhJjmXrVKxlepzNnsWI9CB7v2I7Qx4By9I8683htdAIsN+ImIA4PtPMVHZGKW9LRe5Z29ZAnyAiYliGVfSKoLCLwlFQ/5Dn/Pj4RnoX/Sz2meMQs9TajK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101188; c=relaxed/simple;
	bh=uP49FBvXzxwQaoH3/H+q5gaTQYkqJhRlFh0JRBmezWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO2wm7n43sTdwSitTSjBL7p9UT7MivnEie4kYuC39rIaiK/KmXF77yW0rbXAc1gkTH23O80TJXNXljcVXIbpwSe9/ztlzXHRT/3rjy1ErbskqykketXAPSkEAZ0fFGMSWD6u/G4zT/DHsCcqDTry+WJvzPBwYmjUyggYNrAl5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=c0eYWTh0; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="c0eYWTh0"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91054f537ccso67856756d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792101185; x=1792705985; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GoZFyFHEBIbbXLJkNjI5j8IRtrjCYfTrNzWJlPEfUWI=;
        b=c0eYWTh0YB4/8ahMHzF1OkUhDit76mm4siwXtacAHZD5wdVZ509gll53ZLdxlJUjiz
         u6mkLBm9f5GDKuAvLFeKsdf1fbc3TkGksVcJsealXBX0C8y6kAfjHEII2LPTh6DfPbaC
         L6icrNxFTnzwC1NWkbajO42qwQ40T4J7ULSaiKcwVyYgUL0ANNYnwCpWfcWoTl4olWw/
         jMO2AV6zelaqok+clYfzPkvvkRQjY4xg62fAEaDJhR99frPF42n56QDXIzebcHqwDiz6
         u8QQXFAv+jbYZ9jQK7aKp9T6gIUhejlih+qhHmseric2h4ywkTIUeA8nUFvatuynOaW6
         rExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101185; x=1792705985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoZFyFHEBIbbXLJkNjI5j8IRtrjCYfTrNzWJlPEfUWI=;
        b=OJxQxdcf5INdNYflf78TO7ZOUXb1z3yrOX00Kpf0ubH3oZ6Ck5hf6pD1JvvxFW9HBs
         NjJLZ60/OFeQmX4W5jog7jYwjno93FeCxfwvQ9U8u78VjiNfWN5WnzapuVpYPz/0X/lb
         XJVRw4Jh8Nn3c3qhfst66kd9SeN10KrJ8VsLTjVljz/r6djqzL71Pb7adzI2TpV+od/Q
         h93t6+8IPFt6+7HTGIrNr0iTHI0/JP/XMe2HuANILn2H1ayUdb9l2KhLeMVngcOUP9It
         ecfZuHfTOeRngXHxtoK52QrhnAbXgzf2LMfwA36pB6nLz2TIzDFpI0EmDxrnEGCAgG28
         cXyQ==
X-Gm-Message-State: AFq9FYK5IkERwjkvSB6EOPsEhHe093DWlwje+L+AnUs/vYbb1VP2XVOJ
	QDCUCUDHOnE/eSAUYpG4nWiSA+wxcbIT5pwIdpUOS8mtDbi7LSS5+AFBkyImGDk8ESlTHN4MS8p
	mPuO/r6o=
X-Gm-Gg: AYBFou1zi7sZMT8mOhc64ezJA1CaY1XOqguDpqvnT7jbSj1ruy99nB/nbp5OqSSORGe
	2dGzj8CCHy9Z+Ekum3TJkwEDDgaZ3lbMikzNbdJJLzz6Durly/CRycyJ7/FIjuzlevgBAencRKv
	GWTKpJ04Ns822UsGQCR48udSntbdaiX1DpbTPlYKMJKJz+1YXGQWA9cDQaR3udFSahtrfls8e2W
	OsXLXx2fxOhecKKPs1DY6t0CuG/dr6ti3QsRzs9tssY1jaTubk2dNdmQ9GLX1JqCKZgbWs0wYBt
	mBLtdCAkq7MTqzBGd7Dej3IKevOqHBezLZFoBzY/A9eY1Aq4JJDF4TFh3THTTxrIdOo+WLAbhFZ
	3oTkOw0V94s6ocp7AXmzVlmb9PjehRm7coSWitPN8gUnz0lfG9mAa9xba8R6010vOr7oQ3BzBqt
	QFGMo/O+mPgEJ/BCydE1HHDtkoz0/Ixk1U1O8c0PIzyPB9Qb5ddTBkAPIiqeYZ8tpSWt6cPleda
	ReurPBEp6cXSBPpEmd+gOsnHEzKFLPWuQDTfXRJNBw+dlVTxRzQvj0=
X-Received: by 2002:a05:6214:410a:b0:917:c904:4ae7 with SMTP id 6a1803df08f44-91b5555df66mr379187676d6.42.1792101185337;
        Thu, 15 Oct 2026 14:53:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae54fsm6259516d6.19.2026.10.15.14.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:53:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:53:03 -0400
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH 1/2] rtc: cmos: Disable ACPI RTC event before
 handling it
Message-ID: <atFKh05sL0FpV8Q4@gourry-fedora-PF4VCD3F>
References: <20261015173029.3091872-1-gourry@gourry.net>
 <20261015173029.3091872-2-gourry@gourry.net>
 <sashiko-outbox-173261@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-173261@kernel.org>

On Thu, Oct 15, 2026 at 05:42:19PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> > index fa04ece151b8b..fe514b1aa3433 100644
> > --- a/drivers/rtc/rtc-cmos.c
> > +++ b/drivers/rtc/rtc-cmos.c
> > @@ -758,7 +758,9 @@ static u32 rtc_handler(void *context)
> >  	unsigned char rtc_intr;
> >  	unsigned long flags;
> >  
> > -
> > +	/* Quiesce this event before rtc->irqwork can arm the next one. */
> > +	acpi_clear_event(ACPI_EVENT_RTC);
> > +	acpi_disable_event(ACPI_EVENT_RTC, 0);
> 
> [Severity: Medium]
> Could this unconditional disablement create a race with concurrent userspace
> threads setting a new alarm?
> 
> If a concurrent userspace thread calls ioctl(RTC_ALM_SET), it acquires the
> necessary locks and enables the ACPI event for the newly configured alarm:
> 
> drivers/rtc/rtc-cmos.c:rtc_wake_on() {
>         acpi_clear_event(ACPI_EVENT_RTC);
>         acpi_enable_event(ACPI_EVENT_RTC, 0);
> }
>
> While the patch successfully resolves a similar race with the worker thread
> by moving the disablement before cmos_interrupt(), it seems to leave the
> asynchronous userspace race unhandled.
> 

This is a pre-existing issue.

~Gregory
