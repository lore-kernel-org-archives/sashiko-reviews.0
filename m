Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088935;
	b=sRMD4tArewABzWo0oa5SJiNlk5tt2lxm5Lv7s8jiUjDAaXWbfFYO4eShl2ts8h1CR1nF
	 BZ/ek2HZeGsk1Vpdsa6EfcGN/XDw0Yh1l7uWxxvQvXDOwma1JN5MAt8l9aDt8oaWeGcrs
	 9KwMMPyJKKYFjSV7yab38lUGNusQ0AOJQXfSn1Cj9nWNrNovqMTVlyAullcM0U77kngKE
	 ErzCI91i2TLgDnNQPNodF8hSfJlv05O05ByIAJHnE2kEfCQYx9NnhVq/SjG5iPcwQg6aa
	 PQuPyh+EfMOnR/u4wB5djWiBH923mWejOnGDmgniVhOVU8tt1X99tJjaTcUWeg5mMOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088935;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GX5EKeuAhzbPF5m8dbBP6m1Hd+vMy/q+DnezhQCi8Is=;
	b=izr44NYlSXol5bRK7ZhJ5zevgi4qK+qXuWrB8sb4JWHWBrsJjoEM8qiTTRBgZjOvnnXR
	 A0PrCfOoLY5OyW0toW5n3IbUble0TB88BgCkh/8rjLl2xkbVWFW4hbe2j0PYYvL/oLOnV
	 Xve8QRpaxZixjJ62uyihrMZgmv49W9mYV5VgFW8PIpTjEewW/I6UeAuUmVD1nmjyPdTbp
	 03hCf0fkDjBdNwgrfwlorHy60TxGJLp/alHtWOrB78sA0IOnj0PK144HtDTs5MwRwgwM8
	 Bow5wnqYlE778X113pCL1UZNafjzn5CoHVDCuzr3Hxd6Q9YUHf8RsqHnT7AGnneYVng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IEzlrrtA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="G/dN14RZ";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F986606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 11:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F986606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IEzlrrtA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=G/dN14RZ
Date: Thu, 19 Nov 2026 12:48:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795088932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GX5EKeuAhzbPF5m8dbBP6m1Hd+vMy/q+DnezhQCi8Is=;
	b=IEzlrrtAMv/5GAsmB5edZ50qL2Y+Jv5RLvnSI02qlrUMEcdz6rYsB802UBAMq3fU479eAC
	r2pE35h7spnGK55oaEQKFcZDC8RlG9J0AJma031UXANGtBIbJQEdLM3WO29jkbFpFoWvZo
	xaoXDhaEDwgpTmqG9en/C0z+Iy0yYFF4I0BjLXAbH/qur43qD1DxI81Yf7SevgjzzmMKJS
	+dr5mLIu7vvchv3O2yOrSINxEjJ4GqKjxnq7pOr2sx0Zf6j0p2LSp0Xv9lpUJ9mCicyibI
	Fy5+7YXJ8pzbTWqAkC/J1HpavNeUxDIHfZaq7q5T60VxmR0G7dvBowyE7ROISg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795088932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GX5EKeuAhzbPF5m8dbBP6m1Hd+vMy/q+DnezhQCi8Is=;
	b=G/dN14RZQU1ovSnuTBPbozhnAKLPZ8tNq0dcNNAHktPzLkiYa0/Dsy4ev03A3v6MmrmYRJ
	Bc10XQDXEJM+tfBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 2/2] perf/core: Disable context fast-swap for sigtrap
 events
Message-ID: <20261119114850.2dEaCmX1@linutronix.de>
References: <cover.1794914794.git.wutengda@huaweicloud.com>
 <cff9b939758dad9f16bb4eb0483c63b7787e62bb.1794914794.git.wutengda@huaweicloud.com>
 <sashiko-outbox-218736@kernel.org>
 <e940e69e-f7f6-4c37-a2f9-7caeaf9fb7c4@huaweicloud.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e940e69e-f7f6-4c37-a2f9-7caeaf9fb7c4@huaweicloud.com>

On 2026-11-18 10:52:41 [+0800], Tengda Wu wrote:
> Hi Sebastian, what do you think?

The bot might has a point. I don't see how a pending event is removed. I
would prefer to keep this part.

> Thanks,
> Tengda

Sebastian
