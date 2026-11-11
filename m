Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420185;
	b=qZu+6PypKFcrtMKwKWmVOoo22WjyZGMDAB8gimD5vGtwYLiRczi2bcN7k8qKpJirtd7r
	 jHejI9stgE9YuE5vZiAREbDIVuSM29QYOdJKPz3MCVzzpw0Mgc/phEOTfT1ZpmH3b63cU
	 DsKOB+8eOY/e7RoQqcOR9DlNPuW/oFAoeN8XJZMMcaP654iVPVtcvoA9TZ8vfq1yPE474
	 slUYsDeCx3KGEvUAqehxTyEZnPNh74VFvmaKuh7p/WUYvkrszBoKE0bA/Vllp6JaaiKM3
	 1EYngrIWkJPU95QPi+rp/fhoZA5UrU2xWUgR+NhaZyxTu7GuTszDY13NhMravEk5iGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420185;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=0HncUmoeWQqiz9Pt1jn7AuWWLnngP2r8jXCgHPj2/f0=;
	b=E0hvfzVUCNaZjL1Xq1SFNBrVwobzqvCOD9xaHP47vIPUAbe+n7HJinSCAx7C8wqnhWjY
	 Px7JxanFz0614put3G0f2YHfVZESjkzQ9GY/jVDmZqeQ5rkalPk5TRbdueVRUjTB2NFEg
	 51FF8YIst4Gh3vC+bJ9NnPGABRnBEFvFLT3ABwp+FupruliAlU09YUeHgVuEySBNc8Ce3
	 cCxxamnNAxK0a2SBxmolOQzZkFDJgW3WfK7m4QHh831H9ynnL/rlF9R2xSI4kXZ57t6YK
	 5Kq2GbID2I3gNxRbBa6kKqxSIscY7FFo8neuvv3dB34mVg7e8JQA387VQb2aX2yCwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DmU2f9Kz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q0KSgNTW;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D6606A332;
	Wed, 11 Nov 2026 18:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5D6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DmU2f9Kz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q0KSgNTW
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794420182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0HncUmoeWQqiz9Pt1jn7AuWWLnngP2r8jXCgHPj2/f0=;
	b=DmU2f9KzL16UBRs2mKXgVySvM+gWFOkUH3zcN5lPusf7on6AqHwW4SInxmGdXoZRGUoAl3
	ckDwGvky54K2EooEJ2NB2H8oNG4q2BZYHlk6aNf5ZvjYRwoYWyRMXW04Px5x4yElD2B4cD
	b4W5e6VJNVMUP+Dr8rU8oJZurwVfV/EZ8Bb0hnnFp6GQltgNhLPt8ezVT9Vn6Z1J90IHmk
	7BSJk+c92nfIlAn9M0cD3ZLdWVo5kixMETzgMOPnews0oAatBDBWrbYX8FdqtOt9eYzraa
	93o2P3G3JdPpdnkIPdINB1eW1E3Z3DQl6kRr4jdbft1XRUO24nBt+qdhX7eAzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794420182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0HncUmoeWQqiz9Pt1jn7AuWWLnngP2r8jXCgHPj2/f0=;
	b=Q0KSgNTWtcLQk44D5Bg/O09nWRKqPtNtjiO/D8pSIQWMIucoyXU2S5FIxD81yUlLRSqCDD
	+UpceZBod/Ox7zAA==
To: Breno Leitao <leitao@debian.org>
Cc: sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>,
 printk@lists.linux.dev, Gustavo Luiz Duarte <gustavold@gmail.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH printk 6/6] netconsole: Always perform unsafe flushing
 on panic/kdb/restart
In-Reply-To: <avSXwwYEXZ6qsL4g@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-7-john.ogness@linutronix.de>
 <sashiko-outbox-207027@kernel.org> <87qzgrmnql.fsf@jogness.linutronix.de>
 <avSXwwYEXZ6qsL4g@gmail.com>
Date: Wed, 11 Nov 2026 19:09:01 +0106
Message-ID: <87mrrfmeju.fsf@jogness.linutronix.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-11, Breno Leitao <leitao@debian.org> wrote:
> IIRC the real problem is not target_list, which would be simple to move
> to RCU, but the TX lock on network side (__netpoll_send_skb() ->
> HARD_TX_TRYLOCK(dev, txq)), which seems to be incompatible with NMI
> context, even being a trylock?

Correct. __netif_tx_trylock() calls spin_trylock(), which is not NMI
safe with PREEMPT_RT.

We are talking about unsafe flushing in panic. Even if spin_trylock()
was allowed, is it acceptable for it to fail to get the lock? If not,
perhaps for panic_on_this_cpu(), the netconsole should ignore this
lock??? But I have no idea if the decision can be made by netconsole for
the case that HARD_TX_TRYLOCK() is called at a lower level. Or if
ignoring the lock is too dangerous even for unsafe.

John
