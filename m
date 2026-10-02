Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34D2EEE7B
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928865; cv=none; b=HkqhxMIb/mRzbx2KeqHT8j3IP5VNHht68LImAt8zELvabCeZGQcjpCQo2VzXtCP3HhRdPNGamLW2i+34ruN6vm6TMNbETAFDCbbybpvnYPMjgOjyGcrCFWMva6KvrNR5PQ3ZN7IaX4u6SJzAyojrPgdeYRXF049pDtaJgJqvuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928865; c=relaxed/simple;
	bh=lUjsj/zkzOnzY9LSr0WPam4i8+l8opVo1V9Pswn+IGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reS8cS+fOfHZvZkuNPr6m9knyiTRmCCXj+JxCYVKP+yuS40Z4Q1fJpiBSs+m+f895hfuVysdsa6jTbymMbygfHFcjYdgfmY5+9OjzUYzfHvHrG3UFZoNnS9vfqMGxywJgdaJPCx4H+fwbiuMLsEF5hjY30s/u410DoaiRdnMm7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=coMo/j3b; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="coMo/j3b"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so2950919f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790928862; x=1791533662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2gYiRdzNQHv1M+pzNmzpe4igCpVm4DThoeMguavKds=;
        b=coMo/j3bIcFLLuimQxMe/+tsBTAjbf0zsICQ/Erkj6rHhQxf+Pcqh3jyZyGpE6M4NG
         qJrRclFrtIW9eJxoWOaAc9we7QkKUdkJwh/8tDr/Md3Kss4LEY7KqHahSO5UJFNDx9es
         Y/Dz89DBAVpQvFmatP6p/4xqgswusm8b/CmtxZK8E7OOaAcC5nWyzU9OaNmQUb18sQ2O
         Oht75b9k2glaSPbihxV7l/HOUFMzQBVEK+w7vHVReONmkSGzbHaU9LVozi+1Xh5NaZXh
         i3C5XLKrr2pOU+HzX3yV503EgD5+g5+wJJYdfLMR7awVxIYrJTzG4bNnANsiN5qZHJXZ
         3Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928862; x=1791533662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2gYiRdzNQHv1M+pzNmzpe4igCpVm4DThoeMguavKds=;
        b=NzN4HsCt2IG+M6rF1aqHbwpIyEfYN11UHl088W4ldJoy4/tAqdVTP23JiEO63Bbuab
         5QlgEt8B1zB7POxtY+XfSYTrHsJyCtf3NVSHHBv77uYpNYoMh11qFPnI6qdwqP5N6aDr
         QId0vaCWqKYZv7b+d/BYzR1hDlc3WmhmqZdvh1h/NPfaepYHl+uu8rMwjniDv/VdbXLD
         YlE6GKt3ORDZNoMpmE+ID3jY093y7Z6g4PHxRbz//u5mjPzLEnzpjCq3pyeoy6vWgUQt
         Vwp5RW12Z58ckvZS4g62Af1vrqAyFXleZjAosVdeG4eeTsVZpSZ7wSXi3fw8V2jaPfiX
         BNMg==
X-Gm-Message-State: AFuF++nK2ZDv06f5NvrgAtOH4V9zou6dwFkZIFMWZsdEzx02tfRzGtc2
	u/+7VqERUu7MgkrKK40n/ApfHyaCurD/AClxvIFY4Y1RKPaQhJUHNBVGhr7wFxtrxjE5U0puiaQ
	7IZlTKqk=
X-Gm-Gg: AYBFou1T3mVpoHaqsOJIEXlNtnsGqAZrJJp27VnY+mjaoKfdbkcrgcgEzclBeoN3J3h
	qf276LOZUqK+jLVOXSnCcmIyhOAVlZZFDl+Y+Vj87unDvxuEY0JiCMU7wwBpI4nsI3+ECnlJhU/
	RFoVZ5uuA2ieTXsmx1b9WL8FIeKTlFjrakocAN0aGJsHX8UUeYx8A21sEMWBAQ0+bTmcTFRFDrl
	5d9dF66MSb2kojCK3/AU7tir5skGIZ+e/TzP68GTrTwnYnECYmTuzu8s+ugl18To37Hcq7phAI/
	B+gELI7/YEjtScCS/q+AXQtlGEwON+aYZGY/HHj0uniHnI8N7iSQM2y1o/OSBv54zHYyQF7zmOd
	rKeLQ+6PzVauaXICWw/3CTmkzeqk3UyDr+YbbvoEdmDTATTT60XemXesdDchj4JCMh0R1dOHVhg
	28/s2c+uxJevCFFc8WzH98rkMiQq1dGGwe2X39ehWhMUOEKNDfquOK9jogvAkmcqBRUqjhTbJ5
X-Received: by 2002:a05:600c:4454:b0:49f:f922:1dc1 with SMTP id 5b1f17b1804b1-4a0276a0e46mr32937455e9.28.1790928862090;
        Fri, 02 Oct 2026 01:14:22 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027734b49sm64339675e9.10.2026.10.02.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:14:21 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:14:19 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 1/1] braille: nbcon: Allow to use a serial console
 with NBCON API as Braille console
Message-ID: <ar9n2__RhOeiXRgC@pathway.suse.cz>
References: <20261001140727.124398-1-pmladek@suse.com>
 <20261001140727.124398-2-pmladek@suse.com>
 <20261001142407.84C721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001142407.84C721F000FF@smtp.kernel.org>

On Thu 2026-10-01 14:24:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] console: deadlock in braille_write() from atomic/IRQ context
> - [High] console: infinite loop in braille_write() when CONFIG_PRINTK is disabled
> --
> 
> commit 0bb1344e643dce4e38416fdf04095c16fe6023c8
> Author: Petr Mladek <pmladek@suse.com>
> 
> braille: nbcon: Allow to use a serial console with NBCON API as Braille console
> 
> This patch integrates the Braille console with the NBCON API by allowing
> braille_write() to attempt acquiring NBCON ownership before writing. It
> simulates the original locking using nbcon_braille_try_acquire() and routes
> output through write_atomic() or write_thread() callbacks.
> 
> > diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
> > --- a/drivers/accessibility/braille/braille_console.c
> > +++ b/drivers/accessibility/braille/braille_console.c
> [ ... ]
> > @@ -62,14 +62,50 @@ static void braille_write(u16 *buf)
> [ ... ]
> > +	if (braille_co->flags & CON_NBCON) {
> > +		if (panic_on_this_cpu()) {
> > +			/*
> > +			 * This should be good enough in practice. Most/all
> > +			 * serial console drivers have the atomic callback.
> > +			 */
> > +			if (!braille_co->write_atomic)
> > +				return;
> > +
> > +			local_irq_save(flags);
> > +			/* NBCON API strictly requires the ownership. */
> > +			if (!nbcon_braille_try_acquire(braille_co, &wctxt)) {
> > +				local_irq_restore(flags);
> > +				return;
> > +			}
> > +		} else {
> > +			braille_co->device_lock(braille_co, &flags);
> > +			while (!nbcon_braille_try_acquire(braille_co, &wctxt))
> > +				cpu_relax();
> > +		}
> > +	}
> 
> [Severity: High]
> Could this lead to a deadlock? braille_write() can be invoked by VT
> notifiers from atomic or IRQ contexts (e.g., from keyboard interrupts or
> console_flush_all()). By calling device_lock() and spinning on NBCON
> ownership with a cpu_relax() loop, if the interrupted context already holds
> the lock (like an active nbcon flush), nbcon_braille_try_acquire() will
> permanently return false, causing an infinite busy-loop.

The short answer is that we should be on the safe side because it
used to work with the legacy uart 8250 console driver which took
port->lock as well.

It should work when the code under port->lock:

   + is called with disabled interrupts.
   + do not call VT code (the is no reason to do so).
   + use only printk_deferred() (or better no printk() at all.

All the conditions should be fulfilled. Otherwise, it would cause
deadlocks even when the serial console driver is used for printk()
in the non-Braille mode.

> [ ... ]
> > @@ -102,7 +138,24 @@ static void braille_write(u16 *buf)
> [ ... ]
> > -	braille_co->write(braille_co, data, c - data);
> > +	if (braille_co->flags & CON_NBCON) {
> > +		nbcon_write_context_set_buf(&wctxt, (char *)data, c - data);
> > +		if (panic_on_this_cpu())
> > +			braille_co->write_atomic(braille_co, &wctxt);
> > +		else
> > +			braille_co->write_thread(braille_co, &wctxt);
> 
> [Severity: High]
> Does this violate the write_thread API constraints? The
> include/linux/console.h documentation specifies that write_thread must
> strictly execute in a task context. Since braille_write() can be called
> from an atomic or IRQ context, invoking the kthread-specific callback here
> could be unsafe.

It should be OK for all the currently converted serial console drivers
which are candidates for the Braille console. We might need to revisit
this in the future.

> > +	} else {
> > +		braille_co->write(braille_co, data, c - data);
> > +	}
> [ ... ]
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> [ ... ]
> > @@ -678,8 +687,14 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> >  static inline bool nbcon_kdb_try_acquire(struct console *con,
> >  					 struct nbcon_write_context *wctxt) { return false; }
> >  static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
> > +static inline
> > +bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt) { return false; }
> >  static inline bool console_is_usable(struct console *con, short flags,
> >  				     bool use_atomic) { return false; }
> > +static inline bool nbcon_braille_try_acquire(struct console *con,
> > +					     struct nbcon_write_context *wctxt) { return false; }
> 
> [Severity: High]
> Could this cause a hard lockup if CONFIG_A11Y_BRAILLE_CONSOLE is enabled
> but CONFIG_PRINTK is disabled?
> 
> Since this fallback stub unconditionally returns false, the
> while (!nbcon_braille_try_acquire(...)) cpu_relax(); loop in braille_write()
> will never terminate when triggered by terminal output.

Good point!

But there is a bigger problem. kernel/printk/nbcon.c is compiled only
when CONFIG_PRINTK is enabled. We expected that con->write*()
callbacks will be called only when there are printk() messages.

The Braille console is a new use-case. It uses con->write() callbacks
even for non-printk messages.

A proper solution would be to allow building nbcon.c even when
CONFIG_PRINTK is disbled. But we would need to review the entire
design.

A short term workaround is to make Braille console dependent on
CONFIG_PRINTK. It might be good enough in practice. I mean this:

diff --git a/drivers/accessibility/Kconfig b/drivers/accessibility/Kconfig
index 6b2f79d1f1b8..bd5db30e9aab 100644
--- a/drivers/accessibility/Kconfig
+++ b/drivers/accessibility/Kconfig
@@ -20,6 +20,7 @@ if ACCESSIBILITY
 config A11Y_BRAILLE_CONSOLE
 	bool "Console on braille device"
 	depends on VT
+	depends on PRINTK
 	depends on SERIAL_CORE_CONSOLE
 	help
 	  Enables console output on a braille device connected to a 8250


Best Regards,
Petr
