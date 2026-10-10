Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539C3932CD
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614187; cv=none; b=J+5gxYIxJQMuTB4YPo+/Vwc3CLL3AaOhtcVvUKcHpEs3z1+GopM4OyNbxcazI0l3+wJMT4hJdmm0xce5Uk+fmOYb0Z66tQweYzZtYqV8itgtyrdmCRpd6dVyvPyX1qHf05ypAXKS8BIzbGOSSAj1JFcd0EeavE4xrlL0y56tpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614187; c=relaxed/simple;
	bh=ZnJxfnu9UopKxXTa0U94zGzQEzcjgXN+qKv+FV9kVl4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQkcAuLwRm2ozHEcRofx6g3C8US+f8M/ZYSpsxrZ4DdCF+PQW2+74rrBudIaCpUdJ6GcvRuBp5Va3ZP4IA74HYvcw+gGD5WpH+65I3Eywn92+DICbopZgIbaHFnLwmodz2gYMFbDu0KQPD6e91iK1SR/Zd1AyAIqYK5cINhmo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muW+6ptN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muW+6ptN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so2608075e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 23:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791614184; x=1792218984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSqVSM4fJlvTDpFrnKpXbQXJn7V7EVNmkAGYR+oqhh0=;
        b=muW+6ptNseZDe0ewiWsd70ozLORDSetGwCViSwn92RtQJEb+Ii8DhNOBQbxWsAIpcE
         9Yp0QPCeFxEPYk9mgOayJchOEpmohJhBOJYQYc7asZSTX6pGKYaqlqj8sSYrDi3Cu5aq
         wsTfsA+ub9J/qqS9f85HdBmlVp381r3kZuStim8x4sm/rhPPSNO0hmWfTFHstWq2Cu08
         IUKvwvlbJaxtk/YWHDh9w5nEgGxQCovv0WMy2RhG3lHdguJNoZIWWkg/r/Q79QqQAxe7
         /hukOvobCSoNvDIkqmcItkChfpuZbtj6jDXd7GOed5446AMtVhdlMGF4PJxGFwfExVXC
         NI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791614184; x=1792218984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSqVSM4fJlvTDpFrnKpXbQXJn7V7EVNmkAGYR+oqhh0=;
        b=lKLFS+y1vsS50VtlecA7MrmbWtG9hLHyNZhqaJyBcmv86OWwPjUXFVhHEbpwjuObcw
         OEqkXbmDVpxWLt+40hrqn4rmUu8/z2BTnh+58QzIaMvUXES9zvM7/P96RY6Dt1dU57w/
         4G8CodYmMxVl5MgbwCSH9BQ58/LNtyvKAAGWkqlo/oiWyp3kQSViPPTdikscLj8KrxO9
         l5ruvgI1ohHgJDGw1tbOOU6V11mv3eBgdvCrfUEHNRNmbJW8ad7AVtm68hoTi8sISL7o
         50u1Z5yd7EN2Qgil3//3RjYed1uMlaUCNmfl+oy4Ih4u6iSRZhOv1aXN7+W7dVfgte26
         CiZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyI7g+DWPxw/vFMPHraq1pE+MMrQyE6dIBLJmSjTrgt3KI+GB6FuXPL0Uke5Iz34OkTM3DJXY1MjStQxWYcfA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6dm5L5MvbZ5SB6ft3J1phEEyP+SiuY5ork4+QR8q6flQ2Bv/g
	8WEQyHCrmSiYPo9iEdwUr/P61hXCsmbaqIDhjeNpARe5ICv6HGoJBkc0
X-Gm-Gg: AYBFou3jlGBPxZ1z4Pg30tXRk+RXX+ZV2m/q12Imjm6jQT5zqMgAqjzHnnnyF2NcwZG
	0V3MdNvAPokWmHlaPo2t92l7gDVW6VhLEIkuyuu2QaahghK77OAjUhDb7JEu4JqpWM/JGcs4awi
	k9g0Xh+RDE/E9GyO3yxVa6/z7doWx3yDh7sbIA0hICO4T6kBwJl8HLvzQYvoQLfzf1leNBQ8fZD
	xs0fUhhXL2wfQ0idjtjvUiyfNHnGAIRjJ/AdhkxbBKk+xjRDt+v4BNCw1urT3aoAgvB6dpJTvxH
	9k3bizql0lDySu9/xcp7PVvJ+71sGEjJXYNZz8ZypE7O/hG/+dPqxLBO94j0abYT7ptajlmH/N9
	PQ7HejvKyrDY8UbvUvAZ7G/jSVHcWe5OChfI2grgDyOQF0mQjjh7V9JlqfjTsvQY4AYaEcHymn7
	hCdQoSLT6C/Y2fWzR8ub2ycKySzZtIVJHNqggvEs9bBzlwsCjZw4aAHbghipHl2g6M5HQrgZwRO
	0Wizdkufg==
X-Received: by 2002:a05:600c:4688:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a18e4ce84cmr84106665e9.23.1791614183932;
        Fri, 09 Oct 2026 23:36:23 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm6661246f8f.41.2026.10.09.23.36.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 23:36:23 -0700 (PDT)
Date: Sat, 10 Oct 2026 08:36:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>,
 <gregkh@linuxfoundation.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 02/11] usb: xhci: Unlock for command abort polling
Message-ID: <20261010083618.24da3062.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-165772@kernel.org>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
	<20261009151624.618967-3-mathias.nyman@linux.intel.com>
	<sashiko-outbox-165772@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 15:27:25 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] usb: xhci: 5-second udelay() busy-wait in sleepable command timeout path
> --
> 
> commit 8ece4a222044715c34357d2e1240af7af9feef1a
> Author: Michal Pecio <michal.pecio@gmail.com>
> 
> usb: xhci: Unlock for command abort polling
> 
> This commit drops the xhci->lock earlier during xhci_abort_cmd_ring() to
> prevent stalling other CPUs while polling for the command ring to stop.
> It subsequently waits for the command ring stop completion event.
> 
> Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt/
> 
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c  
> [ ... ]
> > @@ -521,25 +521,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
> >  	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
> >  	 * and try to recover a -ETIMEDOUT with a host controller reset.
> >  	 */
> > +	spin_unlock_irqrestore(&xhci->lock, flags);
> >  	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> >  			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);  
> 
> [Severity: Medium]
> The patch drops xhci->lock here to avoid stalling other CPUs, but
> xhci_handshake() unconditionally uses readl_poll_timeout_atomic():
> 
> int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
> {
>         ...
>         ret = readl_poll_timeout_atomic(ptr, result,
>                                         (result & mask) == done ||
>                                         result == U32_MAX,
>                                         1, timeout_us);
> 
> Since the context allows sleeping (the lock is dropped, and we call
> wait_for_completion_timeout() right after), does this code burn 100% of
> a CPU core in a busy-wait for up to 5 seconds if the hardware fails?

Does it not? :)
Still an improvement over the status quo.

> Could this use a non-atomic polling macro like readl_poll_timeout()
> with an appropriate usleep_range to yield the CPU instead?

Maybe, but other callers still haven't been fixed to stop being atomic.

My plan was to omit xhci_handshake() in this case and instead increase
the timeout for subsequent completion wait to 5 seconds, but I realized
that this slows down abort processing on HCs that fail to generate the
event we are wating for.

Mathias, do you know what was the buggy HW mentioned in 3425aa03f484d?
Was it really a bug in HW and not SW, maybe it was Intel HW that you
still have access to? None of my HCs exhibit such behavior.

If it's important, I could split the completion wait into stages, poll
USBSTS in between and stop waiting if CRR stays clear for 2 seconds.

Still, I consider all of that outside the scope of *this* patch.

Regards,
Michal
