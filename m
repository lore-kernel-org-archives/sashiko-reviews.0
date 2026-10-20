Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470654;
	b=Reo6YSoXK2TjF70ZRjDK59GRCxuHYMo6BVV0mSvRFGpx3uswD2ZWnvC2MGvuX5m30vOr
	 tCn5027DbISxz/My8jBVLdGu+e5rTLcwm7+xhBgMP7onixe9FTTxHI7xslGHg9pRU2em3
	 NTf5yxK009VpXgm1/HIf7tGEPeNoI+kbgV0AQbHvgAPNFe5xUIxclv+ipacMCUgH47Jo8
	 FwWKezidr3rLYkmS/NRqY5BxLhtXhcKySU97pR9NC+5DzVXMexDK+hDYjRx5wH49Z6UGs
	 GZPJR9r4KqLP/BK1xwt1DXyd0sLHwq4thlirqKCyOYmotQFMvIoAdtbUwGjeLxadqug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470654;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:X-Spam-Status:
	 X-Spam-Checker-Version;
	bh=3UvhX2apNd/qnNqj12GKek217Nsl8pRDNQhnNCUM2Fg=;
	b=aYbevVicYgi6SfywKnqzfcWriAbvKrvIb+esTbT/qFMi2nIEJbrloazLSOUrNWjAJfyG
	 jgBW55FtdIbinX+OYTAULpujj9Uxy+P2C5d6SDWVAdjQHnQcJEzC0pzFIdadUTvUGP2DY
	 Stj1Hfcz3rTHQ8XHxbaSmHo81PlN+2WTLBuXlJaQTrMUgZbOmjbJdL9wpyNee4PyFYCc5
	 4BDZAyVz6ImUH+zSunRwpv2QVfopeobwzUHoLTmb+YEBOsYic0bscPRo8/Fc7s/Sf8yq/
	 kBU/jbnNbqaRKpbXO6i5QVwBQRRXESj+PMP+1opSY3dN3NqB+pmA7E7B2JPaDfzwV1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=G2VokJw8;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78433606A33D
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 04:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78433606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=G2VokJw8
Received: from weh-cvm-dev-vm.y50bckvjo0hefgfnzfztsfttff.phxx.internal.cloudapp.net (unknown [20.169.55.37])
	by linux.microsoft.com (Postfix) with ESMTPSA id BB7BD20B7185;
	Mon, 19 Oct 2026 21:30:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BB7BD20B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792470646;
	bh=3UvhX2apNd/qnNqj12GKek217Nsl8pRDNQhnNCUM2Fg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2VokJw80Albs9KNiIGir3mmnO7536BzfkYg+6PbLtj7RYQYNC99u5FU7wEzQ6GQW
	 j77lUEQrFvGV6NjND+Zp0Q1iqwbKhVQgS2nD1WChXRoFLMCE+H/Xeyb60p5hWdANHb
	 jADk2CtzZHjJvp15s0UEEydqJ4qXQHpdUd4WpAek=
From: Wei Hu <weh@linux.microsoft.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	weh@microsoft.com,
	kuba@kernel.org
Subject: Re: [PATCH net-next v7 07/13] net: mana: swap queue sets in mana_change_mtu
Date: Tue, 20 Oct 2026 04:30:42 +0000
Message-ID: <qset-v7-sashiko-07-v8-plan.20261018.weh@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-175607@kernel.org>
References: <cover.1791710735.git.weh@linux.microsoft.com> <87e016ed7479a33be87128b01bb07d2e1807c87d.1791710735.git.weh@linux.microsoft.com> <sashiko-outbox-175607@kernel.org>
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

> Does this stats update in mana_xdp_xmit() lack mutual exclusion when
> racing with other CPUs?

I will leave this counter update unchanged in v8. This is the same
baseline lost-update issue reported on patch 4: CPUs can share a queue,
and the aggregate xdp_xmit update is outside the per-frame send lock.
That exclusion gap predates this series in both upstream bases.

The seqcount-corruption/infinite-loop consequence requires the 32-bit
u64_stats_sync implementation. Supported PCI MANA configurations are
X86_64 or ARM64, and CDX requires 64BIT; their implementation has no
sequence counter or fetch retry loop. The lost increments are real, but
the more severe claimed consequence does not follow on those builds.

Also, the submitted patch 7 does not modify mana_bpf.c. The quoted
counter-pointer conversion belongs to an earlier patch in the series.
Neither that conversion nor this MTU change introduces the existing
writer-exclusion gap. I am keeping the independent counter fix out of v8.

Thanks,
Wei
