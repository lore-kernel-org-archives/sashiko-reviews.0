Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408277;
	b=DNX0G51udC8mGamEZonpxgOvxU8/TTJd5TXXAvD2bAgQvNaWo/pVjwKCS4+TtQZ0joad
	 7M42N2BtKLjFjkz/fMR/twf+iYE1ri1TMdZJUuDr+Y/rzqcktv6AWJ0f6CQER8SSxoY7e
	 I1d5AigFUjGwHT2gBbPrv11XcHAevKVeDhZ4tnX4+D+hwJD405Xq2Kp7nsde0xD2L6wrR
	 nS1gpfRCqLhAz/u7EcTV1MfcuR32B665yJKNIOxrQ3UAvA4vOslR9pXs8xChkcdU8oQYZ
	 mo3qu/RUYAkcpr/C/1gJHI2KFLYXlowg6M6VQhOTtzd/ayRqjnOeHG/cRjo7/AqJZFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408277;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=a7rbe7qEm5cj4so+pimfL/Z80bGbxMWL0QRnSgXz8Ak=;
	b=GMXVd7/a/DY2fmhFVXilAw4przbGZXHAxdCdhdUk2Fj4gLAX9W/VFCyIXdF6CAtDaYZp
	 q3nf/yZAlUq/dnl6m92o19HGSxpdJvj4Lg0Ei9qM940mRTN2NBzUHUHDsbZhuZhCmJ50w
	 gtSoq66Vi/J7GbHDs6Fm4V2wuIYIEQLZ2KSNu20gnsUFF1w17etvsfyxRAE2+QvTp25sT
	 kCrMlmhiL8+/ed2ABSlku/GgujxtWnMdLV9ZDrxxhfsl4A6tqsvBew13gOpDRXfFKym8J
	 AbclwsqtKtmsr2EmZgd0rx6P11IsGALn4Ur82FGj5GfaJykKM8ZRmHjsX3OlNZTW9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="yO/eo232";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w3s7UxUY;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE9606A337;
	Wed, 11 Nov 2026 14:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEE9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yO/eo232;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=w3s7UxUY
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794408274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a7rbe7qEm5cj4so+pimfL/Z80bGbxMWL0QRnSgXz8Ak=;
	b=yO/eo232OaS1P01eYAGwOiqJOS0zT4txLlsKmk4d2KAdHT63KFmTE/97ewOp+Gy88Lhzpe
	qhrD9//wcClqrItthYnmllNAx7AtUQ54Un5jPm6M1QQwKX8legJlpHmG3CG0XW6NvwTQcf
	gNtggEXCmDf374AB8C/7yFcxg54r1/U+YJkuWAbckJlHzYWvG0tHpG/w21G4GuhPs0RP9m
	yzkqzMFjgds8ZAyARU9yBRX7Et+/qwbYXrCyC+hJexzTQq7ovUeV3bahkEoZVF4bvEbQDP
	OHfyTniU6f4a2NXEiruJm6+JIyJ2F1wvMLnOGVYW2nvSuPzDhdzzzmk4nRDUmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794408274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a7rbe7qEm5cj4so+pimfL/Z80bGbxMWL0QRnSgXz8Ak=;
	b=w3s7UxUY8RvQ7nxtOpEfUjbLpZamUyVCD3r64YyJeNcWF3MVGS3WbwFv/D7rScu+rR4VrO
	xgzKR7vKjLj9rhCw==
To: sashiko-reviews@lists.linux.dev, Breno Leitao <leitao@debian.org>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Breno Leitao <leitao@debian.org>,
 printk@lists.linux.dev, Gustavo
 Luiz Duarte <gustavold@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH printk 6/6] netconsole: Always perform unsafe flushing
 on panic/kdb/restart
In-Reply-To: <sashiko-outbox-207027@kernel.org>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-7-john.ogness@linutronix.de>
 <sashiko-outbox-207027@kernel.org>
Date: Wed, 11 Nov 2026 15:50:34 +0106
Message-ID: <87qzgrmnql.fsf@jogness.linutronix.de>
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

On 2026-11-10, sashiko-bot@kernel.org wrote:
>>  	.write_thread = netconsole_write_basic,
>>  	.write_atomic = netconsole_write_basic,
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can netconsole_write()
> race with target list updates or device teardown [1] when called from
> write_atomic without target_list_lock?
>
> While write_thread holds target_list_lock via netconsole_device_lock(),
> write_atomic invokes netconsole_write() locklessly.  netconsole_write()
> traverses target_list with non-RCU list_for_each_entry() and dereferences
> nt->np.dev in netif_running(nt->np.dev) and netcons_skb_pop():
>
> drivers/net/netconsole.c:netconsole_write() {
> 	...
> 	list_for_each_entry(nt, &target_list, list) {
> 		if (nt->extended != extended || nt->state != STATE_ENABLED ||
> 		    !netif_running(nt->np.dev))
> 			continue;
> 	...
> }
>
> A concurrent target addition, removal, or device release on another CPU can
> corrupt the list traversal or cause a NULL pointer dereference or
> use-after-free on nt->np.dev:
>
> CPU0                                CPU1
> drop_netconsole_target()            netconsole_write()
>   spin_lock_irqsave(&target_list_lock)
>   list_del(&nt->list)
>                                       list_for_each_entry(nt, &target_list, ...)
>                                         <-- follows torn pointer / LIST_POISON
> netcons_release_dev()
>   nt->np.dev = NULL
>                                         netif_running(nt->np.dev)
>                                           <-- NULL pointer dereference
>
> [1] https://sashiko.dev/#/bug/linux-5d4ba9e4-a230-401f-bfcf-b5d9ed4aa3b5

@Breno:

One option would be to change @target_list to be an nmi-safe srcu
protected list, such as the @console_list. In your cover page [0] for
the RFC NBCON netconsole you mentioned it as a "next step". It is
important if we want to use unsafe flushes from non-panic situations.

Although, we could get that for free if your "one console per target"
patch [2] is merged. That would be an important additional benefit.

John

[0] https://lore.kernel.org/lkml/20251121-nbcon-v1-0-503d17b2b4af@debian.org
[2] https://lore.kernel.org/lkml/20261110-netcons_one_console_per_target-v2-1-bebf45b2733f@debian.org
