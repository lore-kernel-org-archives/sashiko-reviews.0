Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D8388E49
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 18:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684807; cv=pass; b=UNM4gq5ySH7I2NHeB0Al/Fx4ijvn/oxjG6P0UQZSvxDiLQ/VMu/6Qolyqj3Yj4fqsBeVm0nbHKVIoVewFUVTT0sW2BkKrLSiS8S4194pXCdkimsnbLaLyq+Y+c8Cfmfx9j5SfEjTdTrthkIBoMmiaKvIQIXunY4OAOjSPX51zDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684807; c=relaxed/simple;
	bh=ylp/WG2OsDo7VxpUtN0UDtDOBb9IQxlolEx2IztCpG8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0f6l94/Z6Wo5QGawgtxJqUAX/g2VY8H1hlfYZONQnRt+8+WyAqWjn5Tw/Omo7J96d9vmXVkU5pqhOWFiXA551SaqgtC+HbDYPKZbvoiFiSV+czR7N0sK4bL0iFmKuk/UP65m4+17O5/lrDJ+OO8da0iyoKYo0qWeXegQqsp70s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ldb3Pc3V; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ldb3Pc3V"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13809ed8fbeso1480119c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 11:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780684805; cv=none;
        d=google.com; s=arc-20240605;
        b=Z7lpKmy55nJqw1RBkGnL12z0L9qoa/N0U6cJQOoXXsd68Qbe3VGZrF45da2+wr2Drq
         LJ5PuI3/S3pNFFQ6gX42E5mhGqcCoIVgxJClTkUEDkTP7S/ycXzam01bVg1TFVklT1qW
         YxNOUWi+FICvQR7x80lpFJkr1Jo5NTnAADNmAE8LMoui/bteflYplWbvzKTPNjJkQ4Om
         Fh+im30MJyLwUNZMxfZQkCEp8NuRjylXYR/+8TvNCXS5Z8e8eo0jeIX/GGdWHRYXjsNu
         ImN+gsUGIeIxjNzFQz4o3iXCbJ19gOLCkNEoS3a0760p2vzAOhpsQ+0FYFg5leewNfRE
         6yYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ylp/WG2OsDo7VxpUtN0UDtDOBb9IQxlolEx2IztCpG8=;
        fh=YrPbP0BUDxXsWEKBgSpVC34GsR1C7suTxJB0UnYoVvU=;
        b=CqzHY8cz1/mlRCJS+yc/PUb4WysLnj88dmAIR/cr6Rw1Mzo55b8W6oZ3pul3ifBglP
         SDTqqIEkbUuQGV474nNY7xxnp2q9t3JZc56RoIZnQgTCR4w9aWVHcoiV9t5HiHYtEE87
         fH7xAchqtSDb6ZHgQ4KiIIEsT9QvFXzDUXd0LmptsYyD8ipR5sqRQ2UWRMT8aPTR4o8a
         YDHzf/AjBEhrgurxGAQh91vlW4FhQG6IjiriTckXFXiDuO0hG4uwBrVJsJK9WvFh0HJQ
         GOSC4N3kS3Ot/kVBbAHMHAeKkfsxEzLD/1LJhd4e5ldZ6IHqxOzvXTQ5mpG8duh+PkI8
         ifAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780684805; x=1781289605; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylp/WG2OsDo7VxpUtN0UDtDOBb9IQxlolEx2IztCpG8=;
        b=Ldb3Pc3VNBzNCIpn99M6Nfy5BKj7OJubfcLLZD5dZBsEcBBUFqG49/d8Q8CkyDZv7Q
         kbaPLs+OXG30A8c6lpUa6KVegg1kP6vZJNGBnroZAlwuAL46f9DvMe/pdzHlypT0/ZmD
         /rOpIdJDXSesoAZ/2rAixSNcCDFv1nM1ebeeeDsH5Lr2yGxG+u0sGHUa9jIfe8ORwONq
         rymKq5OcOaHRNn+cbrl5AB68sbZqMLB7bnwZ0ykt+F+zVXsdvqd2o7ouqkPeFgqPw5gu
         uUSrwnimwkhQwa3MwbqYp8miXzg4Osz2Hck+gj+a7VsYMfmFgCGN9z7vOu0RsRhqE00m
         DfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684805; x=1781289605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylp/WG2OsDo7VxpUtN0UDtDOBb9IQxlolEx2IztCpG8=;
        b=AL2Y0goet5mEV9yZ+ooixXKvU9AhLCR302o+juv6g3RfhJXRoWotK3CpRucKq0wzOg
         VnvfzW99c01A1u1EUTopt4LXg+S6NdC7wdZk3BH7loSwS98p75GU+u9tjjLZEIuF8SrC
         W93qWQPeyOPKM9e4UXp+u90BjXILeb1la5a9vqFmhmVX9irMifZ8r3nC075O/bYDb6pM
         g9ulRy6C9a7V/kO0jAfFCT54UFwrj3xxoaTS5ftev+OiIRD1iKbjdUAkeEEGJ+KABwIG
         V6rX1qg2jF+5SWp7G+ANrnSD0bRWjytyeAdrlHIxjS+YtfIPYX0o2gfhYmFeUPuDhVzW
         68Nw==
X-Gm-Message-State: AOJu0YzqGnuUom0nH4xwwTYrGL6xARi9GkEsHFWOBXlbEPpbRk2rw7uw
	wdskSCaTTczqZhYvdNkgDPmBBs6Yrt0tERkxXb3ANbXdMYVMIoAGG4sqO2CPs2Av/lCMafUk/aU
	IRtR4Rzo5vwvxkShhETqj5ghXgL+/d+wZAtelUW6M
X-Gm-Gg: Acq92OEnX06HBYfva8LncA8dko+1U/7NPvS687YzIzQTF74MiYiUEkFW97g/J56GNvq
	VmMRNj9g7RW4FefOpLPe+p627cVaG4c/0e9mi4bP//q0ixXarqH//mn1/yPtvdNksiGqaxnYsQW
	MRjdwfM0C5Jy6AygjjvQYOoSRFkajKQxJHZ0w9+3ZErlLCwKgkOOLHy23qEKw4//x1wXPeg3UeG
	lLlo4f54CPqGD+uySozxRsPOnwNacd0oZynB9eQVAururrmEU9ZdsAXwC4jeElClfyOu7kifeAq
	i9xTrshnkvfIsn/mTe7N2SiAije61Rso38mQpI5Bxf82xaj0xo5LKKkr1hvqsiP0iPM+eAaYuhA
	qpOwO
X-Received: by 2002:a05:701b:2704:b0:135:e312:47a4 with SMTP id
 a92af1059eb24-138066874afmr1383213c88.9.1780684804398; Fri, 05 Jun 2026
 11:40:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 11:40:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jun 2026 11:40:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <44o2z5j553adpapnyequmk2t6cukor2wjm5urujhrnqhufogh7@jbsolz5b4i2b>
References: <20260522-gmem-inplace-conversion-v7-21-2f0fae496530@google.com>
 <20260523010752.CA7AF1F000E9@smtp.kernel.org> <CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com>
 <vawib73p6wsjdihwz636soxorvp74v6zyqona2a2nnpuc673lt@jvlhihgqrs6t> <44o2z5j553adpapnyequmk2t6cukor2wjm5urujhrnqhufogh7@jbsolz5b4i2b>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 5 Jun 2026 11:40:03 -0700
X-Gm-Features: AVHnY4J1_4p8mu5YSy0mKWuQG8dcjs_GQ0Bde6jh1xabblqeid9ouo3IPdVn-Ck
Message-ID: <CAEvNRgFkfqirL6hZDk5eugeaf4u7J_=a0xj6RdE=QnG5T6N29A@mail.gmail.com>
Subject: Re: [PATCH v7 21/42] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
To: Michael Roth <michael.roth@amd.com>
Cc: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Michael Roth <michael.roth@amd.com> writes:

>
> [...snip...]
>
>> > > When KVM_TDX_INIT_MEM_REGION is called with a NULL source_addr,
>> > > __kvm_gmem_populate() attempts an in-place conversion. If the target
>> > > guest_memfd folio is unpopulated, __kvm_gmem_get_pfn() allocates a new folio
>> > > using GFP_HIGHUSER, which lacks __GFP_ZERO.
>>
>> For in-place conversion, if src is NULL, it's generally because src *is*
>> the target and it makes no sense to copy the page to itself because
>> userspace already initialized it, which means userspace should have already
>> trigged the uptodate flag to be set via kvm_gmem_fault_user_mapping().
>>
>> So maybe to address the malicious case that Sashiko seems to be worried
>> about (where VMM purposely doesn't touch/init the memory to try to leak data
>> into the guest), we just need to error out if: !src && !folio_uptodate(folio)?
>
> Of course immediately after posting this I think of exceptional cases, like
> SEV-SNP can set up pre-zero'd private guest pages via this path, where
> userspace wouldn't necessarily have done any touching/init of the page
> in advance.
>

Are you referring to KVM_SEV_SNP_PAGE_TYPE_ZERO?

> BUT.... in that case it would be okay, because the kernel knows
> everything would get zero'd.
>
> So maybe the post-populate callbacks need to be the ones that would need
> to implement these checks, or some API to that gmem can do it on their
> behalf...
>
> So maybe your proposed patch is the more straightforward fix for now.
>

Is KVM_SEV_SNP_PAGE_TYPE_ZERO expected to be used for a large number
pages? If not, I think we can defer this to a future optimization, like
in snp_launch_update(), if KVM_SEV_SNP_PAGE_TYPE_ZERO, pass a flag
through to __kvm_gmem_get_pfn() to skip zeroing?

For all other page types, __kvm_gmem_get_pfn() MUST zero to avoid the
issue Sashiko pointed out, right?

Currently, kvm_gmem_fault_user_mapping() will zero, and then userspace
presumably writes the entire page. Can't avoid zeroing to avoid leaking
uninitialized memory.

To avoid that zeroing, I guess there's the future guest_memfd write()
syscall too, userspace can write() the entire page - write in the kernel
can avoid zeroing since it knows which parts of the page was written and
set uptodate. Then, kvm_gmem_fault_user_mapping() won't zero since the
page is uptodate, and populate will not zero since it was also uptodate.

> -Mike
>
>>
>> [...snip...]
>>
