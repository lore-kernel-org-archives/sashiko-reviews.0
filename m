Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E43F823E
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689556; cv=none; b=b/YZOEqXziF/c8Lv1ylUNPNA9cCTyY/I3HD2HprrYbValeldBoD5px2L5afC8osn7FAW763SyQ3jMrYV+ANtWS/8xlxvBznYAW2ZU4LK+yx54b+yt20AQF4XJh83J4r2ky02B+YM774bPIugeTVjQK+/yowXZDu5HLRuKcyfFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689556; c=relaxed/simple;
	bh=120FrtS+j1GG51mgZIRxdm+GXHIWFGFWdYCBfXas0IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuPHSB82bfcGjg/siJmwnKyKD3ps4cANiHGwLS6cPBfBbTlU9Teq5OIWVAFqeFxzY8Cd45JV/YZfmqEypqz00WcomOznHmcEd0G0cZFbh4YqCL4wwu4MailDzTSqyJrEmZXlTsZH520p0fHkh/Aq+MqAUGHNHAPvLf6HzTWnJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8IvE3xt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8IvE3xt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df440fcd5so493612f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783689553; x=1784294353; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzTMLuV8GHg1XIdYVJfY3lkeFPJPr2GQ2IIgWuqZdyE=;
        b=i8IvE3xtL9tjtK5xSbURCeVtueIph1nHU6aEiXSUPYv0fuksbKEZ+QB3eIT1mCwupf
         4GJjqqhclhlkRbtnwRRGhxL2qi7sRm/RP72rBzk/UR+O06VE+7jbfKcgVyeqprSMuhEx
         PsiYvsdAQyEkPcjI5PLPZhR3CGQQjja7FAW83c4bxZsN65dWCZ8so+QwjjXpzf16P/LN
         F94kGmviHTNRw6/E2FkejgrR7pqq2tKCkh/3YTHd7HHlMyrFvTfRD+ezHD4GuEG7t46j
         H/BlpbsDesV7lBWCepZGDfF7UgOSCa2+0x1xGVqnKM+OyTh7iFvnXduJNffxcH2nTZbO
         o7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689553; x=1784294353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IzTMLuV8GHg1XIdYVJfY3lkeFPJPr2GQ2IIgWuqZdyE=;
        b=SKAYHHe0ielMOJ21Sozn1RJ3MWhJJipQrA1uHn53RTZQ65LGNUjEeuZtuEZIkPZdYy
         nSRouLudMfGJUh+DMfJsJfChsVkuhVHNwveJOqR3r+GM78HVtuiGf7yK0X/Z3ACCxp/Q
         nzfJhpRyyRUtHV/fFzQKdGbhVrfkwtJJ87MhMwksrz2RwC9UWpY5pYlTc7CUoxp9KWSB
         Ovt8AqxOsGIIKHMspSCpC/tMZNLpTGhu0w/5WbRM2NW5uVxrhXOTQo5kGlncIw4s6mMD
         t1vaN4+czokivpcRgNB+319sZb5QXJEy1WMG98zPHqAHQpINvS6jgmil9ArEKrQj68+K
         MjnQ==
X-Gm-Message-State: AOJu0YwXH1M7dsNQOH22WJXVNW9MVhXtwL7UItT6zF1VYZRwfWBCgTc1
	rMbteCZd6i313DcqfHo92rG75ZOJZSM6db4SFrQGeglm+oID0V0/d51e6FYoZSTr8Tg/VldwBi9
	nx3LHBA==
X-Gm-Gg: AfdE7clq6DJiG7hg0VTmrBFeWjFixOYRQwwUlBMkw8lQ5BpBFlG8/Cv6fqKtvUzbUjP
	W5wuc90XQnO2WIc+QMluXmFV+WdMRLo9ZfB6IB7tq9qoD7YX28PDWSXcJNau15g/Vjq18BuOcx6
	asxumInwqVxvSDVGhZ+nIk4H7SJzk2ZtGihj7f8SBkhcKLM+KkCn713oxlVLxZMnQOBtsNiQ7l/
	4RJJwP9wqmVwapYbB1DjmSTkki6sPZtYspGjaTmvWtQS6SAGHpJ3LeaNkXwKrAJ4i/0i5RMkS2Z
	DFl9z2wMlq8r/ODHt6VVZ3LSWLwNJ3Z2FG8SN8thRoQsbUKNvNB7rIapJPq7Xj9p+wT91vCIWpe
	YvGgCGrqYzNAutaeWHZ09noO7WbpR/BxOkgYJJhnba2StqqDiMOB3lOVRhi1tq7oNJkAZolAEWm
	228dwwmUR7Q+BbRPuExWuCU6sikPnsYIrqnKJRKr7tU/t3iJPtoYU=
X-Received: by 2002:a05:600c:4688:b0:493:f6f7:299e with SMTP id 5b1f17b1804b1-493f6f729e9mr9978435e9.20.1783689552776;
        Fri, 10 Jul 2026 06:19:12 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm138700495e9.4.2026.07.10.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:19:12 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:19:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Fix hyp_trace_desc allocation size in
 hyp_trace_load()
Message-ID: <alDxTK1uPuecd2dY@google.com>
References: <20260710114819.2689386-1-vdonnefort@google.com>
 <20260710114819.2689386-3-vdonnefort@google.com>
 <20260710120255.883B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710120255.883B01F000E9@smtp.kernel.org>

On Fri, Jul 10, 2026 at 12:02:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Incorrect bounds calculation due to pointer arithmetic on struct pointers leads to bounds check bypass and critical TOCTOU vulnerability.
> --
> 
> --- Patch [2]: [PATCH v2 2/2] KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load() ---
> commit 6dde5b05614b22025af630cb338d61676ac3c7d8
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()
> 
> The footprint calculated for struct hyp_trace_desc sizes only
> trace_buffer_desc and do not take into account the other fields. It
> worked so far thanks to the follow-up PAGE_ALIGN().
> 
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index a7237aca68989..22437c5e1e7bc 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> [ ... ]
> > @@ -262,7 +266,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
> >  	if (ret)
> >  		goto err_free_desc;
> >  
> > -	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, desc_size, size,
> > +	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, tb_desc_size, size,
> >  					cpu_possible_mask);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does the bounds check in
> trace_remote_alloc_buffer() calculate desc_end correctly?
> 
> In kernel/trace/trace_remote.c:trace_remote_alloc_buffer(), desc_end is
> calculated as:
> 
> 	void *desc_end = desc + desc_size;
> 
> Since desc is a typed pointer (struct trace_buffer_desc *), this pointer
> arithmetic scales desc_size by sizeof(struct trace_buffer_desc), inflating
> the bounds check and bypassing the intended protection.

This is already part of this fix: https://lore.kernel.org/all/20260709160017.1729517-3-vdonnefort@google.com/

> 
> A similar issue appears to exist in arch/arm64/kvm/hyp/nvhe/trace.c inside
> hyp_trace_desc_is_valid(), where pointer arithmetic scales desc_size by
> sizeof(struct hyp_trace_desc). This could potentially allow EL2 to read
> un-donated host memory, opening a TOCTOU vulnerability if the host modifies
> bounds after the validation check.

I don't see any issue in hyp_trace_desc_is_valid() though. 

> 
> Should these pointers be cast to a byte-sized type like (void *) or (u8 *)
> before adding the size?
> 
> >  	if (ret)
> >  		goto err_free_backing;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260710114819.2689386-1-vdonnefort@google.com?part=2
