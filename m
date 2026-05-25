Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F93F0773
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723857; cv=none; b=QbcLAZrkP7crmjZg33GCkkmdzeju5C/OI3kqVedcuJp9fRG+NL9TNsZNf3Ed/GOf3iTGOQRFzykcEgzydD4D+OOs9vbjEewBpD0FHEdAlpcZ+IBZGCtMgdWosDAxeRx+9fu9KOV5Q4bSwTBGXysgrGPpW009T5aTrqeQUuXig9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723857; c=relaxed/simple;
	bh=6yr/TZL+jG3AO0/J4h5aLvKtPOiLQW4800CcvJ5a7mI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfsokyyXeYYnTOZF0oYmjP7mfu+B9W1g6T69FZInMPNJcIQDGJu32IuDNNW6nTnfMhE2YLW6Ra4hu8XoEMGttOK1KqzdBwFM/YHnyytl/DM3NXt7SOiBIK4ArVSf8bx2hfCZVSpan1ysQZq93letapLDkgJiLccUU4aSuGkCJwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbIL5kdz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbIL5kdz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso8407675e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779723855; x=1780328655; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9mYRg0yKJiJYKF/BL7N7a/URtWVcgMPdn6a6SoBoPV4=;
        b=ZbIL5kdzaxRlwKX8QxYhIMiQQrlT1hMCAEkcGUpyMRTMw0NBSvg7dmryghroGQEC7c
         PNtHda9cI8Eigz6QQKg12zoOI3C7Rmq/xd1DKh2ziwbHMqN4vmvaTg0Te3/AwLfQHnx8
         MBly7Lt+yDEa+SZrwSKH7KSeRBfJNcKEKx5I7HFZgKOyLtXv9Nw41WD2cWGZrxYDGfra
         aQMhU0WT/WbKkohA8vi//9nUYHoU0UzsrcHlDyfAM8azCSLXD+lh6u/Sf8bhro/bb3Dr
         xrYc7rkyLuELfi4u+mLx7xxu+sEa6PPGnxkGd3IJ2PF2e7mpY7g/n+mLdxPAaKfXYW5E
         ufJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779723855; x=1780328655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mYRg0yKJiJYKF/BL7N7a/URtWVcgMPdn6a6SoBoPV4=;
        b=dM9udTO5BCm3X4Fxmh0HR+qF/xqFV3oh8y6aKQD8jUu5jfa6Ls9sBS7FyCVPKGRmfn
         1uAMGTim1e9cz+Bq20yNKAFyHuwDCsVCBxa2rL+1Oq5GtF6O9HIGA6fJHq6e+tvKYxFr
         GADH4UcCnAN6iAAB/ImrZS8MQI+yNwzqlt0YQLiN/4irD3GrSD0gTxa9VPcgPeXP3rvH
         XVAB+3g0aGubf0sW+KvYM0a5Ny9HwtqT8/Sl9nzFPV3NVClS6VKS/gdw49hRs+cYTV2c
         Yrt31ocBeG9gyCbKZTCdChJBnhROpgSuz3aIf48dqBGChPo281SUG4FmR57k0LERQnEP
         LFHw==
X-Gm-Message-State: AOJu0Yy3YUiH3TLz2TYkA0BwGZO0HoRM+thXIF9fs+nkoDvKEVdqIrEs
	gi2YbA5uLcEbPZ/9sd9Ovn7IJN7Ue7l8IZQAP2/smuxDL22cqzJ3LnDnPOFq2Kcc
X-Gm-Gg: Acq92OEfo7fPH5WHlTVg1FPrKDPTe9q9Im4EYxDBYQJF/6KEPDP3kdR97qeTPoYH9wh
	e66HkmnktjYqxWJuvHqjv60OCg6u+wbf6KEzVWLnCpUdZTQh/LLZvS9reXLF/5wNf+e6+jUoZpc
	YoQC+SNtSfq0gYb6mJqpg1GJmFcB9tHSmz4+8ca0mxi4EgyoJV3N2iZrDNHzbBQxANTF76U4dwB
	zQV7rtCSp6Y16FfeAmGFBFYHaj1XckFYayE4WE+KgLZfGUrz82b1o4GkfwuBrCUSVMasP3qhBEO
	suF47qrrX5qp4/X4yKjGoM7a/RtxAimq0VA0xecf2GPRkPka4vZ26IGhd3sXGUHixnbAdO41b6O
	SoZcJx7fIOmQBAvFgLW7ktvzolJo0vRtxW6Kqdg7GWf5ovDxGaCUtcEQBvHhj4MoFXJpJmUFr3P
	G0DSGTc8eE4Ps=
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr238487825e9.28.1779723854249;
        Mon, 25 May 2026 08:44:14 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904179826dsm116003335e9.2.2026.05.25.08.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:44:13 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 25 May 2026 17:44:12 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv3 06/12] libbpf: Detect uprobe syscall with new error
Message-ID: <ahRuTKNgJ8UmguT7@krava>
References: <20260521124411.31133-7-jolsa@kernel.org>
 <20260521132920.227EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521132920.227EB1F000E9@smtp.kernel.org>

On Thu, May 21, 2026 at 01:29:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing kernel-side dependency causes selftest failure and feature detection breakage

replied in the previous post:
https://lore.kernel.org/bpf/agzJtkZuSRVK3YR_@krava/

jirka

> --
> 
> commit 2bfbf90e3446befa63868457a72590c57c20d562
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Detect uprobe syscall with new error
> 
> This commit updates libbpf feature detection and selftests to expect
> EPROTO instead of ENXIO when the uprobe syscall is called outside a
> kernel-generated uprobe trampoline.
> 
> > diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> > index 4f19a0d79b0cf..a37aaea5253e5 100644
> > --- a/tools/lib/bpf/features.c
> > +++ b/tools/lib/bpf/features.c
> > @@ -577,10 +577,10 @@ static int probe_ldimm64_full_range_off(int token_fd)
> >  static int probe_uprobe_syscall(int token_fd)
> >  {
> >  	/*
> > -	 * If kernel supports uprobe() syscall, it will return -ENXIO when called
> > +	 * If kernel supports uprobe() syscall, it will return -EPROTO when called
> >  	 * from the outside of a kernel-generated uprobe trampoline.
> >  	 */
> > -	return syscall(__NR_uprobe) < 0 && errno == ENXIO;
> > +	return syscall(__NR_uprobe) < 0 && errno == EPROTO;
> 
> [Severity: High]
> Is this patch missing a kernel-side dependency? Looking at the current kernel
> tree in arch/x86/kernel/uprobes.c, SYSCALL_DEFINE0(uprobe) still explicitly
> returns -ENXIO:
> 
> if (!in_uprobe_trampoline(regs->ip))
>         return -ENXIO;
> 
> Without the corresponding kernel patch to change this to -EPROTO, will
> this cause libbpf to incorrectly conclude that the uprobe syscall is
> unsupported, and cause the updated selftests below to fail?
> 
> >  }
> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > index 955a37751b52d..c944136252c6d 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > @@ -762,7 +762,7 @@ static void test_uprobe_error(void)
> >  	long err = syscall(__NR_uprobe);
> >  
> >  	ASSERT_EQ(err, -1, "error");
> > -	ASSERT_EQ(errno, ENXIO, "errno");
> > +	ASSERT_EQ(errno, EPROTO, "errno");
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521124411.31133-7-jolsa@kernel.org?part=1
