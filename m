Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470651;
	b=5Z9/0P88it4NZ/4ExcFkzf2ZcJJaK4/TPGUOU3Mdzf5asJvnIQgwQ4OJ2/jt3AU12mYD
	 9MsGzunjG3zqjtuSOsx+d9kBarmj3v17nyytELICAgHsF2qD0LIkTkMA4d8r8D+32M50t
	 j+j5+r+FxQV3cxH7pSLXtyvtbhqPeWBytGNQoCbhFNrlpC93KLLZ7bObgom8jZRKhT4nP
	 hI9AU1jLSdMy2tEUhcTiGYYzFc6tiIgkmrX87GB/AXWQ9OJXKo5f69swfLukMr2Hi7/62
	 5N7GiQJjixaskOnKSYXCP7MiN2lebHH+1sOTVfyzQy/xnGiosOc0LEdfqgrCogs7V6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470651;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=KwfIC9w5+Dsb3Z7ZsSlMvDgkuO9sLeD+ol8gOYO/XGU=;
	b=LB/0nhUdFMFZavgh55tY+XuVGLJQ+fkImSr1qaim1ErmYgX4GtrqA9+lw2GYRKWP3yUd
	 8O/068S0/2E2GvfQ1PoVOaUTylAdcHFjiE7kPzfPtdd3d1kSHmglXhamptxOQfHQU4MpA
	 Qm5Jt0T+x8p/+bCYxKCSL3kZGPAGFal9xZsLHzigoRECkt5LeyZ/eJjF1i3af36C1SeVC
	 j1dy+tiP7iAFL3jl6UQZx0PdH+wdfFTZQxNMBoIhRWwHEkREHysi1QC70HLNgnApIqvzG
	 Od8Euq5jms045SWCwn/GRlc44SbC9C+COFnn7nFgpTINJzC3PE4bNemcquPBlgasOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b="q/0//lIs";
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB6C606A31F
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 04:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB6C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=q/0//lIs
Received: from weh-cvm-dev-vm.y50bckvjo0hefgfnzfztsfttff.phxx.internal.cloudapp.net (unknown [20.169.55.37])
	by linux.microsoft.com (Postfix) with ESMTPSA id B6E9220B716D;
	Mon, 19 Oct 2026 21:30:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B6E9220B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792470643;
	bh=KwfIC9w5+Dsb3Z7ZsSlMvDgkuO9sLeD+ol8gOYO/XGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/0//lIsfhOVPJayY/cmdILeb33ChMX0PqCRqec6HLrFm6vXr/QtCIUrlPPymkKEP
	 m/9kaKQBjJp1ds+9U4Xfsj50HA4aj6fOe0m792CKotlYwolHbQccbbJC+gAxFqAihB
	 0poLefqDKI7jsnU/Gb0JJFSNQxYBELIZ/Rm7KaP0=
From: Wei Hu <weh@linux.microsoft.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	weh@microsoft.com,
	kuba@kernel.org
Subject: Re: [PATCH net-next v7 04/13] net: mana: swap queue sets in mana_set_channels
Date: Tue, 20 Oct 2026 04:30:40 +0000
Message-ID: <qset-v7-sashiko-04-v8-plan.20261018.weh@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-175604@kernel.org>
References: <cover.1791710735.git.weh@linux.microsoft.com> <ec57f3853ef344a7d5ec8907ba530313b0163bae.1791710735.git.weh@linux.microsoft.com> <sashiko-outbox-175604@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi,

> Does mana_xdp_xmit() require a lock when updating tx_stats->syncp further
> down in this function?

I will leave this counter update unchanged in v8. Multiple CPUs can map
to the same queue, and the aggregate xdp_xmit update is outside the
per-frame send lock, so lost increments are a real issue. However, the
same writer-exclusion gap exists in both unmodified upstream bases.
Moving the counters to port-owned storage does not introduce that race.
I am keeping that independent statistics fix outside this series.

The claimed sequence-counter corruption and infinite reader loop also
require a configuration this driver does not support. PCI MANA requires
X86_64 or ARM64, and CDX requires 64BIT. On those 64-bit configurations,
u64_stats_sync has no sequence counter and fetch_retry() returns false.
This does not excuse the baseline lost increments, but it does rule out
the reported 32-bit hang for supported builds.

> Could this u64_stats_update_begin() call deadlock a preempting softirq
> reader?

I will leave the folding synchronization unchanged as well. This second
report depends on the same unavailable 32-bit sequence-counter behavior.
There is no odd sequence counter for the preempting reader to spin on in
the supported 64-bit implementation. Adding BH exclusion to address that
specific scenario is therefore not warranted.

Thanks,
Wei
