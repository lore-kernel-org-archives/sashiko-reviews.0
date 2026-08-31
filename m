Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D3207A32
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152571; cv=none; b=nAup4vFqCJJRd27DgJ4TeNGlMW8IPIVHIBQu2RJq3luJTlWIRIPNFLv0RvnBhBZ8dczkWZY+EcnpbSt9rfCGuOr/1s1Rlm5mVhMEzdp/KYI8qbhLvfQhwCztrIxPSAXtJ967XQEviPEF2lhPvzGCNf7eOXNvXL01n9W3VhsKnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152571; c=relaxed/simple;
	bh=+IoUalunk6EBcTh9xGk4fB9x0NW21q/3n3sKS5ELLS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luzfjVUWCzDcS2ZxFu6WI+a5Q9si79mVFFgEbbDK2sbT+rhRZrqvo9B66Kfd2pvf78LL53nWXL3fXTShQ1xIj8RUomGR7L5ddPk/+PlQfEwrD1/LJIIiyViCom3ueeVidq94sBS38U0OYrEQl72ekJAvpPFCBg+WA+tjyCWWrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItbaUzW7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItbaUzW7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso3458969a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152570; x=1788757370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4KeYjahQ7mXCY2qiFTNky7ut0uCfsaiu5clA8xyfKA=;
        b=ItbaUzW74bwL7oA8wxsPR8u+liUiwIf+pleO9VtiGlnqE31/mrxDeUH2p6qx+udFTJ
         NILab/q9NsOwj73ChrO8c+kEtXj4pDWcWh1pHoDOJCR+NLGbykSQX0+pLa+2EqdgKGn1
         Q/lFsLTNDCKIV7qLoiJpxV57K+t7auX34VSV3nrY8ca1N8ZUnMczrIv6rDpiVFGhWeGO
         f3k9RHdsQLbq0MxHIb6pTSMqQQULQIOe0XL55rN8DV8dKPwcUCeKNAxjKL8GSD/N9F6N
         ZoASyFlO+7MdHsGD6ixffb+E1xKhQQGW+tVf0uawuxH20MCb0xJY4yMk86ykYzGmBlSC
         kaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152570; x=1788757370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4KeYjahQ7mXCY2qiFTNky7ut0uCfsaiu5clA8xyfKA=;
        b=XCikT59UAeeavvIRmnVsiaYpvNFkKVScLOxHSQgWozYYt41dd9sFpVT3CUyOx5ZusE
         Qynmlkq50If8LhfYJjJzc6Dm/OJ6wupMmq+o87kV6DE37z88587vwVBcuTeJZdig2pZD
         41/G8ytRJkiqFBWDaQTBeZli0A7zyzAVx9Ci3917zqReq6jL7CZCuAH8Pa1dyqcsfaVP
         qaIrWX57161yxZbdYBIJ1WbEq74CrqCC+mpwfV7QiJDwOqtpuGR/eN1mN1VC94OLrise
         l//ukbEW0RfHGe9cL5rTmmxUJQdqydfyr1HBPqkjYI9M7K8BiQbTWJN6MJyBoj7nur3v
         1pVg==
X-Gm-Message-State: AFuF++lQQwIJ9RQa7gyxdubBvyrMrCERM44tm2j06Aj4kGOZgBOpVt7t
	pXrWFeKYfiDGLKNL+ZyWzbuk6yDyqH9V/nPCPkkFWrMkWDVV5MpGHrSYdbr8hHauQhc=
X-Gm-Gg: AYBFou0tKItiUUSXhbUaFN7DVx517gAe/xy0MsNWmm8Z+vLY+U6IsliGZaWyG7oJX5g
	w7dWEAaFEvObteohMTP3wHq3XW4PJyvUmA1q6Sqh+Yy3XVg2XLlx4UsudUt/982MN9BEopAfYEo
	1nj2zBcX1Mep93fQnJp9VyrSWcn7uDqo6uvqH1CC50LutA33duaFUw/ZbObXfUkV04EE/kMfoEF
	Hs5imp+qOcR1MH8yx9Ik+mpJFJkGxaR9s3zsauSQ+wisT1UbhchOSSAU4Iucme7AGMiGHrcM83i
	mGmJXJb9tfPgamJweZ0PISDKEzOspgFCoFIk25G7xrZJ7ACd+O5fa7+CY7bTVOgy3HZbbUEeVH8
	lDMZNoycm7jdnK9oxsoFa8sZpzGCUaLM3h3lsUu+rdPxi13rb4G2MHh1O4qBu4mgoE44am0Ez3a
	x014Za57uFxk0K6sEYEyPBu/rudZUbKMKUcsHs31U45ZQ0y0bPjg1zkt57BmLQAbnPv5+dzYgRy
	I8tNUhmkis=
X-Received: by 2002:a17:90a:dfce:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-398da5e8899mr4849560a91.6.1788152569656;
        Sun, 30 Aug 2026 22:02:49 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm24897806c88.10.2026.08.30.22.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:02:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvdimm/pmem: Release gendisk on probe failure
Date: Mon, 31 Aug 2026 10:32:41 +0530
Message-ID: <20260831050241.1303288-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260831044508.520351F000E9@smtp.kernel.org>
References: <20260831043459.1298059-1-hemanth.selam@gmail.com> <20260831044508.520351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 04:45:08AM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug introduced by this patch, but I wanted to ask about the error
> handling for alloc_dax() just below this code.
>
> In pmem_attach_disk(), if alloc_dax() fails with -EOPNOTSUPP, the code
> gracefully falls back and leaves pmem->dax_dev as NULL:
[...]
> However, the write_cache sysfs attribute remains unconditionally visible as long
> as CONFIG_ARCH_HAS_PMEM_API is enabled.

I do not think the two can meet.  alloc_dax() only returns -EOPNOTSUPP for

	if (ops && cpu_dcache_is_aliasing())
		return ERR_PTR(-EOPNOTSUPP);

so pmem->dax_dev is left NULL only on architectures whose data caches are
virtually aliased: csky, m68k, parisc and sh unconditionally, arm and mips
depending on the CPU.

write_cache is visible only when CONFIG_ARCH_HAS_PMEM_API is selected, and
that is arm64, powerpc, riscv and x86_64 (X86_64 only), none of which have
aliasing data caches.  So on every architecture where alloc_dax() can hand
back -EOPNOTSUPP, dax_visible() returns 0 for write_cache and there is
nothing to read.

Happy to be shown otherwise if there is a configuration I am missing, in
which case the fix belongs in dax_visible() rather than in this patch.

Hemanth
