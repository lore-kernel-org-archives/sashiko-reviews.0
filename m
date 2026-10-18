Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AF3D9026
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343062; cv=none; b=BgAXcelAE/n7IxsdzECBDtDoxUMNadbXA7V0/izgscWJqnjueaY1Z6+hxf9XR9a0Foskht/bRZDfLbGDjaEu3bxxcRNkemM0OPgKwqHb3UkMF03/R/IiV9P8IUx6FE2QYquJew5omPLu2fKFmyLzHkgzJxjn0USxFZrA9iYjsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343062; c=relaxed/simple;
	bh=BANAP3Lc2+23fb8EhfAtZycAwPmcAdi1P+vUVcemTXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBdSV4k8pId9ScnGKQKDTzq4zeytrl9+dUG5JWaUhOMRBIshMeN9fpz3zuU3XhQs8lNUBPKmCxvrzmjSvA2KJZqDA9J8we3qhLBg1Gc439DNDVxiQwBmyatckSJkTpDKcw1UXmVvvUorc1p7tilkyEBWI3OvYRauPi7LrZEAODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ6P3Y+9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ6P3Y+9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so9707095e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343059; x=1792947859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy50q/WaZjVAL/j6YEk/xR6SqWVwPpcjikDOg01mdZo=;
        b=dQ6P3Y+9K3bsWoj50kHkK6RCEQvLu0LgR/Cr26VtH79Br0prU9icK+1UKwcYzuQXKt
         U5GfzGrtHhZDJbJ1+yC3D6gWeAdvgWNB2KUCodytjFtTuLpoP58KVqaQG9QHPQz4nmHY
         OtXHmFkyBqe/z445zyBfMfzOHmpveRc5bSnfRm7VZic51Ff4hfQvqDG1qRF0CxlgrxJs
         C9MJ44uncN9Rsi5Ptxt70uOV3dt+BstFbh0nri50/65tEuPcq8H18tKG4aqHP5Ghimd8
         Ji4YWfGm/Iq7B5OYfu5oiiRs6rC17j1cNUA+tTNUin403RM8mpHE0b2+/weDFVQbwHD0
         /BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343059; x=1792947859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy50q/WaZjVAL/j6YEk/xR6SqWVwPpcjikDOg01mdZo=;
        b=EPh5wlPkxk3FdeiTPbIOYrQsckHxlRpRxn/teLLvpn1i5RgMSPdC06vd1wpPqSSetm
         YtbDm4cI/ew+pWiOUFX8f3gMY8cNA/Hi77dGKO0cCisyJjedHsaTeMMPy+v6+frl57Aq
         HBQnP3RNgkihq74PRwLRrR3CvKpYH9PRf8AidkGZkYT3z2N3bN8N264RLwuITu4OwziX
         6f7meDaxzpbMlpFDuljKLS+bop6JlLBNgzyroXQGcZY7Ia0LemT3Fhj9aKucZMa24Xen
         RW55ceFcA6a/6YspzWkruQOh2QIr4ncNeb6Rg/CKMQefTfBXjX9NwsUBQdBBrpqp1y+J
         dGkg==
X-Gm-Message-State: AFq9FYIEQ5Rs+J7YWwkZdqd4qbPCtXYXhEXZu9ZSvS3Y3ykI0mawAvLK
	eEhbFMr4ulCaRm3TVjRkz/dQL7UEUscStTcSZifHd2g/ZiLeUPftaUch
X-Gm-Gg: AYBFou1sFx6QmiD18/NzCCFaedmroKdy5lHM08A1T4FOo0vJyDWgWkbBtwZiuWx7b6i
	oRso7Jvg4rHTbWzRKfrOT6UF08PvUzFT+0jNbpTenRSNAeH13dXPq4D/9ZNM6VEfGgT6HjImmHo
	/cHFAvIMwSSAM+aSiwdM/Zhw3wSvT5Z/UxsUScBVkhyLelLISiCVZLL/9Kme+f/sGDGgskpqnPc
	D0qqPZORleBDJiPM2ZwH4zYugqLxR+1HCDY9pTPSysRnzlUvq4IQbRfmFKTZx/VnQWY3SiXUEut
	4twWpT5vpiSroF9PGsppb7hgnh1eOXKpacsdbiQSfFyR8rATXnJOu1LakgrdPyKmTF6Q2ClGPvQ
	i98g39VyHH+6+rYVx84QvdDmb1VQN3GfgOg5qM7ffZJgxZS0Tu+us7SOp0wu3RMgbyWvqNdV13d
	B7tz/VBgSXrjrI+dI2P/zpaC+XtuEfecYR9SUqjNV+nxmJWYHBZskj6u4x9BVmhAfH/jY6lzym+
	gfhvSD4tZYQRvCAEOaK7U40iCKHxrxO684=
X-Received: by 2002:a05:600d:4444:20b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1d760098dmr81877465e9.18.1792343059298;
        Sun, 18 Oct 2026 10:04:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm17494036f8f.42.2026.10.18.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:04:18 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:04:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v2 next 06/15] kallsyms: Optimise symbol name search
Message-ID: <20261018180417.5438751b@pumpkin>
In-Reply-To: <sashiko-outbox-176273@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-7-david.laight.linux@gmail.com>
	<sashiko-outbox-176273@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:15:56 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] kallsyms: race in set_kallsyms_off_size() causes NULL dereference
> - [High] kallsyms: set_kallsyms_off_size() sleeps in atomic context
> --
> 
> commit d36232e927821c82911022ce5bae7cb3de465edd
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: Optimise symbol name search
> 
> This commit optimizes symbol name lookups by indexing the compressed
> names table directly instead of the array of symbol values. It supports
> both 24-bit and 32-bit offset tables, selecting between them using a
> static branch initialized on the first symbol lookup.
> 
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index d18d78e626db2..31451feac8221 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -185,14 +216,19 @@ unsigned long kallsyms_sym_address(int idx)
> >  	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
> >  }
> >  
> > -static unsigned int get_symbol_seq(int index)
> > -{
> > -	unsigned int i, seq = 0;
> > +static DEFINE_STATIC_KEY_TRUE(kallsyms_off_size_24);
> >  
> > -	for (i = 0; i < 3; i++)
> > -		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
> > +static inline unsigned int get_symbol_name_offset(unsigned long index)
> > +{
> > +	if (static_branch_likely(&kallsyms_off_size_24))
> > +		return kallsyms_off24_of_names[index].v;
> > +	return kallsyms_off32_of_names[index];
> > +}
> >  
> > -	return seq;
> > +static void set_kallsyms_off_size(void)
> > +{
> > +	if (kallsyms_off_size != 24)
> > +		static_branch_disable(&kallsyms_off_size_24);
> >  }  
> 
> [Severity: High]
> Can calling static_branch_disable() in set_kallsyms_off_size() sleep in
> an atomic or early-boot context when kallsyms_off_size != 24?

Any suggestions on how to get the static branch set early enough?

...
> 
> [Severity: High]
> Does DO_ONCE_LITE(set_kallsyms_off_size) allow a concurrent caller to
> dereference NULL in get_symbol_name_offset() when kallsyms_off_size == 32?

I should have just open-code the 'do once'.
It doesn't matter if it is called twice.

But it looks as though I can't patch the code from there anyway.

David
