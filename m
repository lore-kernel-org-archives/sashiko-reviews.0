Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC42BDC26
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783961; cv=none; b=hMDlb6yvaSCXRSi/eShqpamIwgWF65OHrt8Hs3vc9ERq+RxeoCl79cndjShGkf5prxfMddZZ0SMZXo3qYj+9xrxRp4QYlw3AGRboaArB4OGZK95ahkoX+5e2YOoeLZyZBrTLMR8XAf/Pi9FgnyVRyDGIegvLD98lb7PF+arTxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783961; c=relaxed/simple;
	bh=VZ1xLmoHmA/GZka2t1HsgohbquNga/6PsqItSxVcfqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3+Hz9M4baBvJtse4EMV0KqS2frO8077iYWFjfERKwtCM1+K9jjrPzTUmk1zl5wfPJg4/C6f1gevHIALpFykTTF9DXBLn3yLIoZzXc79WlC8lYnGAO1zb8WA89ZmznLbgQ28XEXqz7EUZVtf+X7xsGInftsm3lSFn1BraQk/NzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=muakzEoh; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="muakzEoh"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-132cccd3d77so204c88.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778783959; x=1779388759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2xyoK6RbsaezwMoF/eYHV3i96uwAfiWW7vUcLVu1RGs=;
        b=muakzEoham6O7IsWQqZT/61/TgdiNo2myP6lP6f6ZEmtWjoMB2RGaylgz3c+BXije6
         7qOjHhyy1nYhNv8ekg0RMURvmhakJy1F0vBCFQJ3G5HRYOOPPHqrggjoL/FbDJjhL9/X
         IhFJt+HIc1QeD/qJ+fyUsvNHV2rMUaZKuvkyyCVVNL7Pxm9d4iW1gJLhmvPBXcNpT6Ql
         IPKBttfm4vn/9enC67KHCpEEhlvHhsfoboQS518xC2zU1Z6W4zCCnqsKMpCvL4Olbgw8
         r4h4TVMXpfqOxQmXandEHLwiibD88yB3G8HmLJxb5bcHxHqI2uv9tfMnIFWXQEvy3Euu
         n4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783959; x=1779388759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xyoK6RbsaezwMoF/eYHV3i96uwAfiWW7vUcLVu1RGs=;
        b=pPIzCuJ5mWdtU5olaHF+JUf3fKLkTSLEzXW01AQNwJxkY7apH9sgiKFX9X61LMEwWv
         SI1yknKBYpb44TCY1CtSOGhxZpbEyyAXkch6O660maJ0K4wO/OM6TnBcMUYFGnUZDgGO
         mHo4OPNpsotcAaf/HF5lajcBXPMOGGWk5OT9GrYimMC8M065XD0q1ICui3dhsYVnWC6B
         0nSy5k4kcE2XxCppHpdla899y6aawQ+EDclnpLaki4dTO+0ydba/v0lCSN0inHPq8XlU
         dNWGLRd5Y6DvTFwqWy02SUX1xJacHFeEGm0eiiCfarRDfKeKq4zQ5E7Ji3ptS+BJeUW9
         1tQw==
X-Gm-Message-State: AOJu0Yw5YpjA6qu6N7NiNAHvpSdyp90frlcdJ6hzWu3GEZZY0lJ6Z+fb
	VzuTsL55To2ZPVGAPiClJEXXe1NM9/g5ek03z5q5m1OJga/BnXoo2a/2oKyLgxa7tg==
X-Gm-Gg: Acq92OE5/GDBioOziEHOYr2qZUgeMQnbD63JN64ggSYZYAlGWRMB7QrW65T4HxdDxl1
	WYfffbolH9N+94jZIdU8mSvLxxMD4amj+vWwl8RvYWqJaaOhNKuNhVE2z9SPGmHv4aOWZvL5Gg/
	/K87cfSwTExfq0kTiXet/z4tyIsZB/2T/wSevrC0N538pMo1moe1WE8KZDNmG+lzJXj+PDI1SiS
	hsfEYcVmwn1yz3HvqQ78Niy94zXpyawi7yWMX8gF1jGmidyP/Y1cwxFjIfDaCtOy8cm1e3ly8tf
	2dikFUaH7O+VzDehHeBexOV/Ezf7qF6pBodu61mk/ZfzcpJACsqw4ZwaVUDunvNSLLliMN3xaO0
	0yX495pLsctWjVkDpAyzB6NQ17wHeqv390l/ARQTuU71u3MX0IxpSUkoqv7PvCKzCHgqk4F9daR
	hKBStRTWkDrdA0uxKD+A4+MqfNWApRJZqimatTGgjw9sPZL9sSq9lBkkK/PJ88ZdTmBN77lFFZS
	gOMN8uPDdUQzFgibp2tb8uKpJqyf9fCiKvBz1s1styaMtZ+pK3OIN0P
X-Received: by 2002:a05:7022:1286:b0:12c:8f55:cd0d with SMTP id a92af1059eb24-13503ce1652mr15715c88.8.1778783958064;
        Thu, 14 May 2026 11:39:18 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea6dsm4071783eec.4.2026.05.14.11.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:39:17 -0700 (PDT)
Date: Thu, 14 May 2026 18:39:13 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH] libbpf: fix UAF in strset__add_str()
Message-ID: <agYW0bzWPkBipMkX@google.com>
References: <20260513232055.1681859-1-cmllamas@google.com>
 <20260514115711.133F4C2BCB3@smtp.kernel.org>
 <89d34016-cf82-4beb-989c-e4fc2e3cd29e@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d34016-cf82-4beb-989c-e4fc2e3cd29e@gmail.com>

On Thu, May 14, 2026 at 02:38:01PM +0100, Mykyta Yatsenko wrote:
> 
> 
> On 5/14/26 12:57 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] Unpatched Use-After-Free in strset__find_str()
> > - [High] Use-After-Free in BTF add APIs due to btf_ensure_modifiable() freeing raw_data
> > - [Medium] Early return in strset__add_str() breaks hash map deduplication invariants
> > --
> > 
> > commit 2a7bfcb093726b849608e340f9bda7c5e3f56ac2
> > Author: Carlos Llamas <cmllamas@google.com>
> > 
> > libbpf: fix UAF in strset__add_str()
> > 
> > This commit addresses a heap-use-after-free in strset__add_str() that occurs
> > when the provided string points into the internal strset data buffer.
> > It adds a boundary check to return the offset directly if the string is
> > already within the buffer, avoiding a dangling pointer during reallocation.
> > 
> > [ ... ]
> >>  |     #0 0x55d25155a2a7 in memcpy (tools/bpf/resolve_btfids/resolve_btfids+0xcf2a7)
> >>  |     #1 0x55d2515d708e in strset__add_str tools/lib/bpf/strset.c:162:2
> >>  |     #2 0x55d2515c730b in btf__add_str tools/lib/bpf/btf.c:2109:8
> >>  |     #3 0x55d2515c9020 in btf__add_func_param tools/lib/bpf/btf.c:3108:14
> > [ ... ]
> > 
> > Does btf__add_str() have another use-after-free when operating on a
> > non-modifiable BTF object?
> > 
> > If a user calls btf__add_str(btf, s) where s is a pointer returned by
> > btf__name_by_offset() (which points into btf->raw_data),
> > btf_ensure_modifiable(btf) is called.
> > 
> > btf_ensure_modifiable() allocates new buffers and calls
> > btf_invalidate_raw_data(btf), which frees btf->raw_data.
> > 
> > At this point, the argument s becomes a dangling pointer before
> > strset__add_str() is even called, making the boundary check added by this
> > patch evaluate against the freed raw_data.
> > 
> >> diff --git a/tools/lib/bpf/strset.c b/tools/lib/bpf/strset.c
> >> index 2464bcbd04e03..7d2b2784172e5 100644
> >> --- a/tools/lib/bpf/strset.c
> >> +++ b/tools/lib/bpf/strset.c
> >> @@ -141,10 +141,15 @@ int strset__find_str(struct strset *set, const char *s)
> > 
> > Does strset__find_str() suffer from the same vulnerability being fixed here?
> > 
> > It follows the exact same pattern as strset__add_str(): it temporarily
> > appends s by calling strset_add_str_mem(set, len), which may realloc() the
> > internal buffer.
> > 
> > If s points into the internal buffer, the realloc() frees the old memory,
> > leaving s dangling before the memcpy() occurs.
> > 
> >>   */
> >>  int strset__add_str(struct strset *set, const char *s)
> >>  {
> >> +	const char *strs = strset__data(set);
> >>  	long old_off, new_off, len;
> >>  	void *p;
> >>  	int err;
> >>  
> >> +	/* Check whether 's' is already in the strset data buffer */
> >> +	if (strs && s >= strs && s < strs + set->strs_data_len)
> >> +		return s - strs;
> > 
> > Can this early return break hash map deduplication invariants if s is a
> > substring?
> > 
> > If a caller passes a pointer to a substring of an existing string, the
> > function returns the substring's offset but skips inserting it into
> > set->strs_hash.
> > 
> > Because the substring is never added to the hash map, subsequent lookups for
> > it via strset__find_str() will fail, and future additions from an external
> > pointer will duplicate the string.
> > 
> > Would it be safer to calculate the offset, perform the realloc(), and then
> > re-calculate the s pointer instead of returning early?
> > 
> 
> It looks like sashiko is right, addressing the same issue in strset__find_str()
> and handling substring case could be useful.

The substring case is interesting, it can save memory space I suppose.
Although it sounds like a brand new use-case, since users would need to
perform some pointer manipulation on 's' first e.g. strstr(). Also, per
the current logic doing so would still trigger the same UAF.

It does seem like more than just fixing the bug though. Would adding the
support for substrings still get backported to stable without a user?

Yeah, it seems strset__find_str() suffers from the same issue. In
general, it feels wrong to call these two APIs with a string that is
already present in the buffer.

Anyway, thanks for the feedback and the example. I'll send a v2 with the
suggestions.

--
Carlos Llamas
