Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006159;
	b=lyldoQYfkT0fvT/Lz2tAEkmy0ooTD6CFTqFWCF2v8NCPCwdhyZB7Z5gjm17em8OBtvFM
	 P0jh75XFUDpvGhDl3bforn3wPdR/6RaQyQwCQ7L4xxfgSrpgjh9H1ODKyFZsbyzVk7gxy
	 uw03NbtR3LUOncafL75e4f7lo4jrDWC1tDbftxDdd8mYsCXJI00yRIjoR9jUI656U+C8v
	 nhqPyugfa+A+WtWBG4qacgSPZ43s4ZZD6VsCgv8P5jbKyJjtcR4YbYJYgt4FYQLZXvfO+
	 80/t+/a0Gg9EGM2BAePtLbfgGuwL2dAfgdK4835RY69vDtisj+9xtZmgOJFXyT3tAfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006159;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=US0uto/7eSBm2nirGVeihVV9dWVz4q+SUEGpM6IyKCM=;
	b=Eli9FbK0GxmyO6+1KI+PGfiBCfpvMucD7p1SdSlf8ScXOSLIr++6A2J8iNGWE1iAMy8w
	 HDRnhdUG7GlAWNI1QOfJT9Sc5OunFX+v7R3bDWeN4xhWycT4v989vHjDgbV2W6wTfnGyV
	 QILqYPuc6PCZ/4smCszNnUboxNnqglEKe1sMiSSZV5XLMQHFif+wn3jzihvAVpWrl/QDP
	 dFSjjTxWVoYHW47S1vfqM4o1FKYhrvhjdDhauXUrS5p48F4+nikQbDM05u115xgsIhRrj
	 8sNxSc9V25l6SWSpr9K1bHFv7Fr+mxWmOwVSIbN3FvOfJCfOsnrVU4JUB218lqoUKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wxpYa9L1;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BF606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 09:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wxpYa9L1
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793006154; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=US0uto/7eSBm2nirGVeihVV9dWVz4q+SUEGpM6IyKCM=;
	b=wxpYa9L16PYztk7C+KBdLnVZPmQuCi/EzAnvPiytD1A2ShanQa+NuY3ptSFenWijIBTNDHI+crRruEWrJD1tLohTNxPat+BSGaHKx0GMpOneYPxFjs35OE9I2jnPmq7z1hU9RbJOxTJnEmq3fDoCviy5b+4qO6MLu4pou/Ic7to=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XDWAIMZ_1793006149;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDWAIMZ_1793006149 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 17:15:53 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: sashiko-bot@kernel.org
Cc: alex@ghiti.fr,
	graf@amazon.com,
	guoren@kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	palmer@dabbelt.com,
	pasha.tatashin@soleen.com,
	pjw@kernel.org,
	pratyush@kernel.org,
	rppt@kernel.org,
	sashiko-reviews@lists.linux.dev,
	shuah@kernel.org
Subject: Re: [PATCH 2/4] riscv: Add support for kexec handover (KHO)
Date: Mon, 26 Oct 2026 17:15:47 +0800
Message-ID: <20261026091550.9348-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-183678@kernel.org>
References: <20261023111612.2134-1-cp0613@linux.alibaba.com> <20261023111612.2134-3-cp0613@linux.alibaba.com> <sashiko-outbox-183678@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: High]
> Can enabling ARCH_SUPPORTS_KEXEC_HANDOVER trigger a BUG_ON() in
> linear_mapping_pa_to_va() during efi_init() when booting a KHO kexec
> kernel on a 64-bit RISC-V UEFI system?

Confirmed. Reproduced on qemu virt booting through edk2 with
DEBUG_VIRTUAL enabled and "kho=on" on the outgoing kernel: the first
handover dies in the incoming one during EFI setup, before the console
registers, so it stays silent without an earlycon.

This will be fixed in v2.

> [Severity: Medium]
> Also, will kho_reserve_bootmem() fail on 64-bit RISC-V platforms
> where DRAM starts at or above 4 GiB, or record a 0-byte region when
> all DRAM lies below 4 GiB?

Confirmed, both halves. That is generic KHO code, not the riscv
enablement, so I will send a separate patch for it.

Best regards,
Chen
