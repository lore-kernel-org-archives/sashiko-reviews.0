Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403623BFE3F
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579490; cv=none; b=cWmKB+oc8Ny+Qis77JNwmk9FiqzY/k4/hhjQnfN7Ks9pAq9Y4+E+/cd4ATD4oLM0EWijpTjiD+yH7c61Ur8kwMPY3kpq5lsb788j7pz7EfcXxPn4EGOVduTwcYSlViHSpagn7E5bmuGpNBJMOFjFoyJLEgxdi6yCrWhzvJugVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579490; c=relaxed/simple;
	bh=8ZDYtOOnFAoks1SVZmejw4+GbzWSa3AmCGcAL07HanU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvnrZnr9SoF3SWtfLF9q1+5X6daA537XL3g3MosuMwcqGyQPvISIE28W5NIQurbNf7bYNaGiiGNQlirbBa9NRib4wjXzXyfZPZHOC8TG1zxVuC0As+/CcnvVE9/7XSRk8ELS+Ul507nZQclwkJqcTY3kwmaXUhN+Ru71wAaKUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kt8mBG0H; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kt8mBG0H"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f6609c657so1248351f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579487; x=1785184287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KytO/biTOA9DN06qfkfVxIIcWXZQZ9HNmS50EkPoKB8=;
        b=Kt8mBG0HNS6CMc2uYkiReLBDVmumw8AKIzQ0+ioBLZ/ZtfuwaSRIlv9rXsWvCnKyxZ
         OS2kaw4QVcybD1HcgimO8wRjTvjCpkBc9Z7RQUC5kAmjAf0c7cLDJx7IarUOChgjvtAp
         plAKhBPvj9t0W4xWteeESOrgYJtEqzFuZbbBHGR84D42vKc98QitlzBqo1BhiR0v0oFE
         5swMXGogRbU8fyN989CzkEGV49sOuVxDCxG/0tD7w8XqudUQXyh4EeMfjWVjlfdnm3nH
         f+hq3ketmkXOxvZ8flqhgHwZpJv0nWaS+/pColCajHlP2TwRNl7E32vQxBLZzqD8bemK
         tvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579487; x=1785184287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KytO/biTOA9DN06qfkfVxIIcWXZQZ9HNmS50EkPoKB8=;
        b=FB5rciucEemhSo3Y9cnzY+sna7g4912tycfTbO8WPwKkmzNetHxlzOF2PYJk/WHlLS
         8vvz4inEUmLOdLCXoI8tJa943NWcnAqPpqaecQiEG/v5IFAFj2sL5UELX8gQSpQ4eNOW
         wWeR5OI0DwMsMj22s+XM1vbMZp7LxZV/exrVLxZo0RsNFzWJgnE1t+NqywXlXCcPTuuQ
         7QVhh/zWoqddT1VQXgyXoXNbC/x+FeRgawX7qWPtT94cXxmequCDsqDIOaH1g2JpXnyc
         PyI/Zd6IYD+2bmmi0H5bWLTOuyD4fjaX4iW9JUau2kjeR6AnKzOjA8IuSUUsVPSSsKxY
         UuCA==
X-Gm-Message-State: AOJu0Yy1iKlAMkFBW22l2V2+uyuHZScCthD6+qjtis2Ygj3yYJB+vuWX
	sw+PnvFMdch6SWhcg0bcm/Bdcb1jU1WW6uG6Kw0R6QRoegytyOBme9IgmhMyC6ZG
X-Gm-Gg: AR+sD111rMCUvrimrJY0ezEigmKvBxHKwbnJc2j40yRtEqyjZZKCEuzOrlsTmMhUPWt
	Wiu1y9wrB/Zwv1DzmpT6VmpN1tmxd/xQGtduj/pd0wiHEBViGKyNOiewMtzORRRmPxa44Zpnq2r
	EZ9E+xIwrklijxXAj963Y0IdUXlPAK4S3FuoPniaveikUaMGkhnVDPGzx6G9a6fnN4dLjGtpXsQ
	nL2ZTApfiy+elnsdzKBA53CVqg9H1WKhLfzYwnQeZCY+8JuCmWC2gcRcdu3sX+T8ZB0u3jCpt0W
	YxbD0kVHg3hlZmXWFUvjiYHYc3Sf+OkH9j3uctuaQoSOvDZ3O4XDJ5VeV+L+cTFBR/EizNOKPZ4
	V1I/7PiObZYvJQqKwCGgPbi2mmjDftNfzuU0dNcf7xQ8q4Uhap2YzGZKvGcydDbG4Mg==
X-Received: by 2002:a05:6000:26d0:b0:47f:77a3:346 with SMTP id ffacd0b85a97d-47f77a30387mr6749454f8f.23.1784579487273;
        Mon, 20 Jul 2026 13:31:27 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm32658329f8f.29.2026.07.20.13.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:31:26 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 20 Jul 2026 22:31:25 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 5/9] bpf: Disable preemption in bpf_get_stackid
Message-ID: <al6FnX19vBr0Bpyt@krava>
References: <20260720085351.655075-1-jolsa@kernel.org>
 <20260720085351.655075-6-jolsa@kernel.org>
 <20260720090411.61E931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720090411.61E931F00A3A@smtp.kernel.org>

On Mon, Jul 20, 2026 at 09:04:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete fix for preemption vulnerability in stack helpers (__bpf_get_stack)
> --
> 
> --- Patch [5]: [PATCH bpf-next 5/9] bpf: Disable preemption in bpf_get_stackid ---
> commit eb097d7647defa7379264dcdf95711bc573a419a
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Disable preemption in bpf_get_stackid
> 
> This commit adds preempt_disable() and preempt_enable() around the
> get_perf_callchain() call and trace buffer usage in bpf_get_stackid()
> to prevent the per-CPU trace entries buffer from being corrupted if the
> task is preempted.
> 
> Closes: https://lore.kernel.org/bpf/20260206090653.1336687-2-chen.dylane@linux.dev/
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 83efd5892d907..a64b14ffd1e8e 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> > @@ -625,30 +625,37 @@ BPF_CALL_3(bpf_get_stackid, struct pt_regs *, regs, struct bpf_map *, map,
> >  	struct perf_callchain_entry *trace;
> >  	struct stackid stackid;
> >  	bool kernel = !user;
> > +	int err = -EFAULT;
> >  	u32 max_depth;
> > -	int err;
> >  
> >  	if (unlikely(flags & ~(BPF_F_SKIP_FIELD_MASK | BPF_F_USER_STACK |
> >  			       BPF_F_FAST_STACK_CMP | BPF_F_REUSE_STACKID)))
> >  		return -EINVAL;
> >  
> >  	max_depth = stack_map_calculate_max_depth(map->value_size, elem_size, flags);
> > +
> > +	preempt_disable();
> >  	trace = get_perf_callchain(regs, kernel, user, max_depth,
> >  				   false, false, 0);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does __bpf_get_stack() also
> need this preempt_disable() protection?
> 
> __bpf_get_stack() has a similar pattern where it calls get_perf_callchain()
> or get_callchain_entry_for_task() and dereferences trace->ip via memcpy().
> 
> While it uses rcu_read_lock() when may_fault is true, on CONFIG_PREEMPT_RCU
> kernels this does not prevent preemption.
> 
> Could a preempting task trigger another stack trace on the same CPU before
> the memcpy() finishes, overwriting the per-CPU buffer in __bpf_get_stack()?

__bpf_get_stack is taken care of in the following patches

jirka
