Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F73F0AB9
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974014; cv=none; b=t0Xmr3/OtZkKPEloSRFuAXRubAuLSbgvGDlzzLnOKdgPdMhB9xhTOxerCvkGDinrmc9/DOZYp/l29X03zXUaFJahTLp69rWBaQiq3oGVbxWky1PPoDhgCLH7ljzwnQ3iDHYFXHYL+GIcXAbKlBmeZfuNfortWE1iQsHMYQoyg7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974014; c=relaxed/simple;
	bh=6gI/IaGvUNOqE9UBdKyhUIlKJBOTnH/MS9D1RGL9l+I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/BLyZBpexp5UQ5RqusbkNHnCVpFlIzMz2Ma/sf+sYOSXqMCF+lyFMYcL6iK8jDwLceLluznRw/xqVT9j7I8D3daRXmRXjV9vWvm9ZHMP/AU44anDPNv6rZnpoWb2bcoIc/mybrs+Dgq+Xm39BhS/6FbxJF3LjR8jJD1fMgHVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oE9Ahf48; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oE9Ahf48"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so440814f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779974011; x=1780578811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0UhdcmZU5g+2xq3LCaiaxmfZm0SekpsCS9FlBG96is=;
        b=oE9Ahf48u/wfSCc/dKnLJ21mKWkrZVDcDmhJZtKgiffOtv2A3/izuNvjrMb2rsAa9L
         wjwMNk/QFz39IfwPQos5iaL1qK8seyhTGieM6daTLKjkIW39sURSKlEIATxhQ7zDE7In
         uMhgaD/H5r5fFpWMlHmLwyJ4F3/97zohFdXfFjr4ML3Od3948e6pTXrcYk21dA2hm3af
         rZH0rTvlGRv81LxxMRl4nVuylARhS+issk5b0ClgCfR5U3pDpIhs4mQzMYh3316gUjOr
         jPOmXqm3XeNbyQNZ+CCiZAAsnSkB5cONvDK6hVPSKbqvMCrmTJOkuZY010dFP50MDiYI
         Di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974011; x=1780578811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0UhdcmZU5g+2xq3LCaiaxmfZm0SekpsCS9FlBG96is=;
        b=lcqI29/+Y1o+74Og6nhHVZg6GcTFL9jxuZlN5ZzGnvMRPIVEHjsSCcSPzN86dOukHN
         rSACnMharV6lwJn38IJkQqn1vagmNl+xUq5l8W7wLF2f70CyZ5tSWVZ9sEK8UhBByeci
         h25hDZUN2usJfnQsNY7AyS/yITPZhec2D7EAUzkIKWaJZgpxMW48OCQmgy7FFY2jpsB8
         vmvSCTWJT8gGXIhBF8knqAH/IRxNrz0+sBMGqMHDMiT+LEDcwP6RS7bWFYoaiL2rDohz
         s3/mxGOQKXfYwk9ylFCjQubsVH5jnhey6C8iw+nY8MmQhZycjuY6lxE2IFmus3RFXR9C
         I/GQ==
X-Gm-Message-State: AOJu0YxdzaE1uB3DaTVay8rV+wRvuhdesdjMcbCxOJjdcISmjtsKgFpX
	beyLVHtU3Uc2ewkb2o5NbfkAIpNdxjH6RacSgl/ZuSE6m2R7lS5e0ao0tW3r1Q==
X-Gm-Gg: Acq92OGXFnrGXA/MKTmz29bertrHBP5tOiKhFAiBzH3bYvZ4DWaRZnoByZATGwRnfRa
	RSsLtduZS6NO0RHXriave/hs6bfqq9hQ6mqHgIU1N9v58W6s7S2P/K3YcYYRVmJCMaEh/syJjNR
	EIxHvxZq9sC4j8Su5Zr+b/lyFGV43GvcXTFlXDJ3pw/KNNFc9ubJ3NECuvEgPKj9+0teURalXTP
	i2okS8giuqmeUf1+VWHqKzNpPQHu0YCrajEj9NnIWc7KINrx+b6Pk0KeJwv0KL6JcE7GdTJ5d1c
	NCAiv/gv8A1DJXC9ZfOuIg0cSrayfVpT9jvUD5rdRN1j3rPURWSTkbdPsgVeLbYHlbLUYoKo9dZ
	3NeCDEJwxgLujgQCJZJQNFZ1UCgatUPjSo74fBAoAkyCOjs96HPXzjVVqvsPOwIU3aNAIu3MVMb
	1YPkOaiD7UPtuO5MfEomXTbXxYzlpyEiuKp3qH
X-Received: by 2002:a05:600c:674f:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-490947a9a16mr22855895e9.9.1779974011005;
        Thu, 28 May 2026 06:13:31 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908ecba6dasm15375485e9.25.2026.05.28.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:13:30 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 28 May 2026 15:13:28 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv6 bpf-next 13/29] bpf: Add support for tracing multi link
Message-ID: <ahg_eJepW6u9Wu79@krava>
References: <20260527113951.46265-14-jolsa@kernel.org>
 <20260527143437.EB7B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527143437.EB7B71F000E9@smtp.kernel.org>

On Wed, May 27, 2026 at 02:34:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] check_dup_ids() uses kmemdup() to duplicate an array that can be up to 4MB in size, risking allocation failures and kernel log spam, and then sorts it without yielding, which can trigger soft lockups.
> - [Low] The patch relies on undefined symbols and incomplete struct types (`is_tracing_multi`, `struct bpf_tracing_multi_link`, `bpf_trampoline_multi_attach`, `bpf_trampoline_multi_detach`), which will cause compilation failures.
> --
> 
> Note: The format of this review has been altered to provide a free-form summary of the findings due to recitation restrictions. The original patch code is not quoted.
> 
> commit 5f2896efaf9a14c18ba8b610461b77f1dfabba8d
> Author: Jiri Olsa <jolsa@kernel.org>
> bpf: Add support for tracing multi link
> 
> This commit adds a new link type, bpf_tracing_multi_link, to allow
> attaching a BPF program to multiple function BTF IDs. It introduces
> new fields in bpf_attr::link_create for passing the BTF IDs array
> and its count.
> 
> [Severity: High]
> In the newly added check_dup_ids() function, the code uses kmemdup()
> with GFP_KERNEL to duplicate the IDs array. Since cnt can be up to
> MAX_TRACING_MULTI_CNT (which is 1,048,576), this can result in an
> order-10 contiguous kmalloc allocation of up to 4MB. Could this cause
> spurious -ENOMEM errors and spam the kernel log with allocation
> warnings on fragmented systems? It appears the caller correctly used
> kvmalloc_objs() for the original array.

will use kvmalloc_objs

> 
> Additionally, check_dup_ids() calls sort() on this potentially large
> array. Sorting over 1 million elements without yielding (such as using
> cond_resched()) might hog the CPU. Can this trigger RCU stalls or soft
> lockup watchdogs?

in reality I think the amount should be up to 100k,
not sure where to put the cond_resched anyway

> 
> [Severity: Low]
> There appear to be undefined symbols and incomplete struct types used
> in this patch, such as is_tracing_multi(), struct bpf_tracing_multi_link,
> bpf_trampoline_multi_attach(), and bpf_trampoline_multi_detach(). For
> example, the nodes_cnt field is accessed on what seems to be an
> incomplete type. While the commit message mentions that some functions
> were previously added, are they missing from this specific patch, which
> might cause compilation failures?

it's all introduced earlier, this change compiles in my setup

jirka
