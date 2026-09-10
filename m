Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8B3DFC7F;
	Thu, 10 Sep 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032760; cv=none; b=aM/SeAg6CANFRbQbXG/aGmldk8Q+ecLyWpr2/T9CZy18gFjsp4RdTMZS7jsZvTB35apWI3SX8zD+JkU8AwgHb5sFQc4+1NqUUQWGFUrWDrUJUa8mcK1MbmyURCxrJ8zVLGJWhmP0jp32fN/Sz9wUB8O4qmNGoEZBaR/l+Ya3rxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032760; c=relaxed/simple;
	bh=KuzezYUAE9m1yyovJFTksGm/0DLv8v+/ivXAKx4Oywg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwG9ftN2NpR+YLD7T2lWtT3H93yMYLus4QXsFn6OFFKHWQZ7R823cUBzaE1cybaPruO4y0dcTtlJ0PoajvVMc50FCyR4ZZQ+VnYRi5cvO/6zPhFtxC1ERl7xEILkD5empXVebfh1wNEKRlHR8TANux9x9d7GPCopKKN0j9J2O60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFL4lmxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFL4lmxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8231F00893;
	Thu, 10 Sep 2026 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032758;
	bh=Y2PSETY3iMWTYoG2jjWvtnuSGjXmjTaXlOm8yiCF42c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IFL4lmxMD5EelRZ3jzeWvMLvSrZvE0MrP9VzZTSMoCHp/bTwtbUwprwsY/OesAZxR
	 uT4LGo7TjoufM6BqnaoaYvAUMiOW/4r3on8hDstRJo/Jx/7J6BO3B4UoFwTJcsX0Pz
	 e5BedswJgcwStLz4bOpYrQvW4kpVRti7OmAN6wSNtQVNiA4NYWYATh+bPZsgS2soL7
	 LEHjEX2KdVjvXw8c1EnR6LtxYdNSyMmV1Xt7b/yKexb66W5r8gM4S4PJE72mzUKVuz
	 EJiHeDnByVkiL9qrQXn7yikbn2oHdEn8xPjO9oiWn8DtSFNdX/4GPC01uzTqrweBVm
	 6/3DVDhx9etEA==
Date: Thu, 10 Sep 2026 10:32:36 +0100
From: Simon Horman <horms@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Li Youhong <dayou5941@163.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] net: sun4i-emac: fix missing of_node_put() for phy_node
Message-ID: <20260910093236.GP40544@horms.kernel.org>
References: <20260904080758.2432748-1-dayou5941@163.com>
 <20260905080854.5CAB41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905080854.5CAB41F00A3D@smtp.kernel.org>

On Sat, Sep 05, 2026 at 08:08:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unconditional call to `dma_release_channel()` with a potentially NULL pointer in the `emac_probe()` error path causes a kernel panic.
> - [High] Premature release of the DMA channel before `unregister_netdev()` in `emac_remove()` creates a use-after-free race condition.

While these seem to be real bugs that ought to be fixed
I don't think they need block progress of this patch.
