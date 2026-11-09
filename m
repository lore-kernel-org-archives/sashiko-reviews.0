Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224110;
	b=Q+BVAVhpx1kqIecsda2NujVL6I3HNG1OiTwy8m4Si/lQPh35pmqp4oxIbc2sy2WEne5d
	 TvK5U2q4a3nG9TVacfq6n5TpcJRCWtlwFeFY9PrsYbIfnk7T2Gv8AvfIaN0OsUeJz6qzS
	 wM+4UxgqXAR13clHeet4ZhbTgIJx0SZC/XnsvZ6yuYJiW8EBsNpfdljjrOdumCajSxHkn
	 zHLv21Nzvd69JtLLalp669/M6uF7ijuoSOyWWJSVJ306mZh7slPA7+q5Nu6M+UeYkJD/n
	 wVS4EvGPYSH2WJQ9VtfO0DbUfJLIC7ss8kzw1rKhoNdY8muaw51YKrbRvXWNHQKDxbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224110;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ANHxOzhJPGflBT0G8nSgwaWuU/QO9+lNdn8zzE2S848=;
	b=DfrZP+VSuFmxwC+YIUdKR6++uqNdL1ec6TUcPDEA3nt1mMxOIVuDFoR9nXVduocm47ZK
	 9sz889PFOXSnMhjN7cTXMQVng3IHTzs6EEVoUBhi85enXOzG9653Yy1GGO9ZnbyaEiV85
	 iRjEw181mOx9FxlLo1CswoAfoaWsBqfnnOK98Pu+xLwftsyOBINisLQIVotjSpLLYVPCX
	 Ae5giVfoIL/tCJkP+3MjJ7VLRP0SyNoLmITL7HBNv2pSetiHrrpkhca1Jn4Rz0hwRV+kW
	 wEy5Lzn78ZrczvOBv4YVq2medLkfGMmWCbe5RdmBvq3siRpjvVZdct4li8bS7Otjpaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d83g7iTg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5E8606A322
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5E8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d83g7iTg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3454A1516;
	Mon,  9 Nov 2026 03:35:05 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5B713F85F;
	Mon,  9 Nov 2026 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794224108; bh=MWU/VLGz5DxyOuJy58S1eckeT6uY/JsD7BNyDuhq+Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d83g7iTgYNtX5lXxQjHSwS66TyqloN7ycPmfcOHIt4ekbKSA8MX0PwokioeF94bT7
	 3BegtQPy2JRO30kU/g8O6J7q4oKtgKHg/WKNOmL8nsNzWfXncMysNkfdtOHQHbkrE1
	 k/TDDsa3BOxgRZ8XUcs7/FkJBYt633pMyeyDb4Hg=
Date: Mon, 9 Nov 2026 11:35:05 +0000
From: Leo Yan <leo.yan@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/aux: Avoid reclaim for optional higher-order
 allocations
Message-ID: <20261109113505.GX9176@e132581.arm.com>
References: <20261109-perf_aux_alloc_optimize_psi-v1-1-d56ac4bf3ef5@arm.com>
 <sashiko-outbox-204821@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-204821@kernel.org>

On Mon, Nov 09, 2026 at 10:31:42AM +0000, sashiko-bot@kernel.org wrote:

[...]

> [Severity: Medium]
> This problem wasn't introduced by this patch, but can rb_alloc_aux() leak
> rb->aux_pages [1] when the first rb_alloc_aux_page() call fails?  At
> that point rb->aux_nr_pages is still zero, and __rb_free_aux() only calls
> kfree(rb->aux_pages) when rb->aux_nr_pages is non-zero.
> 
> [1] https://sashiko.dev/#/bug/linux-c1a2bb3b-5d2a-4fca-a697-ce07992a5cc1

See the patch that fixes this memory leak:
https://lore.kernel.org/lkml/20261109-perf_fix_aux_page_memleak-v1-1-aae781d6749c@arm.com/T/#u
