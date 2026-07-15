Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107303B47F6
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099601; cv=none; b=awvgBK2WwXWPVE2E1ZXvp7WXQ2d+sCTTmtoiUB/Q1JwWkOxHQTfXRBIwsmJDWRTMmgmphFHUaDo1iGjXPFirdUVOUM9OKSioQN6NoQM3/CIdv0t4EENi1j+Td+YMgqYx6t5sq7/eT5Y3Gtp/U+CbYmJRNA2TV8ClVrBsgmRW0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099601; c=relaxed/simple;
	bh=Ku6P9QRglu+E034KtnOCYHZeFKRhJWCQ9QbD82KeJlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdkq24Dxbr0dJzBkPu+RlWKA0l/3LZBcHgwAPCfcIZ8dva/ze3N/EmkSmGf/VbSwk5Cz2OcthVvdMXgZVFX+pQIgZJTvH9yqRBvqZ9UBGdmAXzn0n3iJBP9HVuDxdZ43cdRxeLQu3z26Bq+elvZdbJrBwQuHcSJsjkRQjM8kay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUb59QGv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUb59QGv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1339724f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784099595; x=1784704395; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TWJCe8c9GeM3I4YT4k3ddXa9j/tTy1QCp8SnYXd2v4=;
        b=nUb59QGvM3uL18aQ0PjMxl02Gpj0ZVtJfWny5DO5LVeL+gMVzpG7WSEKFEscbSl7qb
         7H7RnDLFMBdQi+C50+DIBf01n9CTf777T1jgrvBvhHxHJR0y+4brL5O9Udm0hgtn7Zy0
         B3uqiGRfmHi6+5qeNRU7eh7woBDXNh7Y9OavhkjxqrFDHOdcf2+F40TtQvI0FxYmHz8R
         eGTXF1m2c5ko7eVYRjXa4ig03bdh0sMUWpCOvWNKpcZUucOGh4tYj5fkzUG2oe3rDoNL
         Co782fEyevSKZ1PFBxxDzXGa8UXZGjJjuy+EPelLJ+5Ys4wZLIEyxkJj5Qrz5YJ2m7+V
         4bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099595; x=1784704395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7TWJCe8c9GeM3I4YT4k3ddXa9j/tTy1QCp8SnYXd2v4=;
        b=cYpcOYg04B+wubuf+msv9034XPzIBrTlqCWTiXZahXr9fyeEhgfkGSuyc50yN2O/RE
         ntYk9KAdnEjS/UunzqWMKkgMlkuH+WLxRwI8zb8b6D9xu44SBf118r6FN2MJ55VOmleX
         uI6DNHliRGbK4JJ2oGec8Uz2ZQw1p8oxuYEGs1g44H+cP+RAI+kFgT1RFTZYp8dDW0wu
         avzSoNemNPZvFzzDg3P/pXTC+WNITbrBLtShNHPi+yENUJK/JUldjLwAxo321Vp2Dot5
         0ITp7QBep3SrXcVe/OFQf2WSTkyRZOoZHXRWnciv95XhR2UXOFyWr6gYLjY5/0V60PjU
         fORA==
X-Gm-Message-State: AOJu0YyLo6a4wdf1LfRzLF77bLKF7DW5MR/TIu1ja+4GsGbL8zf2tQLc
	FuSY3+LxN+yWRB/fzg2/OwWkW0pO3XLCxpxWKcN6EMjIlyoJrVXiUSxJklnLEWOJDgNDKOHWphO
	bIkC51g==
X-Gm-Gg: AfdE7cm4Ion46kg9Nf4Rg9KzCEf67zv08tEzm80QyqUIsGHRFP2f2L98twVVTlbUvcO
	mb2oOtxo71QsbH71jMBqaaZX54O02v5+XKHP6pNRCn/u2CHSdGEu/3vQv9YZw3SiWH54c2X3PPD
	r2QG2prb/iZkYIrK9dnFgep8a7hw78XbfznBcAM7DCVIoh3QU6NIRGOF/MgOMrEJjcr9VfALmgj
	hD7m+dDHr9/GKc1n20gb8oDKXwYlKACOIsk9lBO2l2bXNi91HvF+KCdDJLg9Ws6Rves9Sip1WS+
	EP8fyNXafIWpBIQQssCn86GPNBs4yKOW/wm7ugeie22ZcxVyk2rnoFWkoYA74D+4AklilcoAUnd
	RcYnK0BcbUDdUS+vLbXhunuKxRsT4IFWZt+7YbNN9O0VAA7ZrEw+OPrOg7uWn/Pr6uH+Lqb8kc+
	ffOforqBwvkd8YNIMlb+HZuJyB1reQ2QLfsRKMlcKv4jRjIhS0UZ2kCfhunSPWLw==
X-Received: by 2002:a05:6000:1acf:b0:47d:f6a5:1fbb with SMTP id ffacd0b85a97d-47f2dc934f5mr19483147f8f.13.1784099594702;
        Wed, 15 Jul 2026 00:13:14 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635082csm14635612f8f.7.2026.07.15.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:13:14 -0700 (PDT)
Date: Wed, 15 Jul 2026 08:13:10 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Fix hyp_trace clock disabling
Message-ID: <alczBmnItMwq8xj4@google.com>
References: <20260714181010.2527225-1-vdonnefort@google.com>
 <20260714182542.F33421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714182542.F33421F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 06:25:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing cleanup in the error path of `hyp_trace_enable_tracing()` leaks the clock synchronization delayed work. Furthermore, this patch introduces a workqueue corruption if tracing is subsequently re-enabled.
> --
> 
> --- Patch [1]: [PATCH] KVM: arm64: Fix hyp_trace clock disabling ---
> commit c37a59b3ffe1e163385bedc8f21496d8af6fbc61
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Fix hyp_trace clock disabling
> 
> This commit fixes the disable path in hyp_trace_clock_enable() by returning
> early instead of re-initializing the clock. It also cleans up the unused
> lock and redundant running state from the clock structure.
> 
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 2411b4c32932c..0b03117a38ecd 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -37,8 +37,6 @@ static struct hyp_trace_clock {
> >  	u32			shift;
> >  	struct delayed_work	work;
> >  	struct completion	ready;
> > -	struct mutex		lock;
> > -	bool			running;
> >  } hyp_clock;
> 
> [ ... ]
> 
> > @@ -110,12 +108,9 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
> >  {
> >  	struct system_time_snapshot snap;
> >  
> > -	if (hyp_clock->running == enable)
> > -		return;
> > -
> >  	if (!enable) {
> >  		cancel_delayed_work_sync(&hyp_clock->work);
> > -		hyp_clock->running = false;
> > +		return;
> >  	}
> >  
> >  	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
> > @@ -128,7 +123,6 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
> >  	INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
> 
> [Severity: Medium]
> Is it safe to remove the hyp_clock->running check above, considering how
> errors are handled in hyp_trace_enable_tracing()?
> 
> Looking at hyp_trace_enable_tracing(), if the hypercall fails, the error
> is propagated but the clock is not stopped:
> 
> static int hyp_trace_enable_tracing(bool enable, void *priv)
> {
> 	hyp_trace_clock_enable(&hyp_clock, enable);
> 
> 	return kvm_call_hyp_nvhe(__tracing_enable, enable);
> }
> 
> If the hypercall returns an error when enable is true, the user might
> try to enable tracing again. This would result in a second call to
> hyp_trace_clock_enable() with enable as true.

Sigh... Even though I don't believe this HVC can fail, it returns an error
nonetheless and I should handle the rollback properly here!

> 
> Without the running check returning early, the code will fall through and
> call INIT_DELAYED_WORK() on the already active hyp_clock->work item. Can
> this corrupt the workqueue list pointers?
> 
> Even though the hypercall might currently be prevented from failing due
> to the remote lock serialization, should we add a rollback to the error
> path in hyp_trace_enable_tracing() before dropping the running state check?
> 
> >  	schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
> >  	wait_for_completion(&hyp_clock->ready);
> > -	hyp_clock->running = true;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714181010.2527225-1-vdonnefort@google.com?part=1
