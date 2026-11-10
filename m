Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330974;
	b=OyA/+oXEcI0uRNsA/2cgI6B8Q9ep2o5pw9UPKn/DVUeMHsGD0pi4yYoKvNXfplAn4EQD
	 P7LX7+w6fpfI2xhO4+7MAD4/agWgKR+8/Gu8+x502CnNGEywnfxFD7ZTDDEzbQEbpunki
	 Blm93CD+T9NRS1cSpxC+MqCWIQlBOiOQyySSc1x+J7C5C09UabpmWdV3NBzwz3R6IyZKy
	 MlFXJeuFeTQAfNAf6paYt4TXLeXOHseyrnbHJex2aTK35jnN903Y3Qs3+NdO7Z6hNM2NE
	 PX4MfAO0Mehqyai1z0Hk4gE8yBqLJ/M/RUbQALwuUnjLuSvN65LSBSza6PewsYEDKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330974;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Rwk8MQ7b01/ILEtot3jfbzVxNK+nULznBkVGvLR8IFA=;
	b=y8K0r3rlzWR7bPVNqj0xlrzeg6whsosY5aPGq28DdQIxPGe4TNgi7VDKgzejcFkKQsze
	 bs2h5s0261qP6pQrf73rUFB1yJmu/uniPJEfZcTwBkDYtfHwylf1eojhM1ktCJK5zTv41
	 fKkqJPjxCniKX+NR3fpcwOPws8NlgP8g6CXwHYfHg8tJPyVv9iE0hJDIsB8zxG9aoZGq4
	 2JBGpteNcCeKotOswLl34UM5IPYCRUYGohRIlUMc8N7u4zAq8A+SQ+LepIG+McMWVPnRn
	 yq1/JYoC9LlQneeBqUOEcoLcCsZeRDl8mRpxSr+wXRjY33KIMqDUhFvj7ykFAMGIx+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nHI+Pgxx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xd24dSkB;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4E606A31C;
	Tue, 10 Nov 2026 17:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nHI+Pgxx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xd24dSkB
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794330972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rwk8MQ7b01/ILEtot3jfbzVxNK+nULznBkVGvLR8IFA=;
	b=nHI+Pgxx0pGavn0t1WcNKBAqs7m5mSFtK7SLCJUlcU59FCAeJLVt7XnkWkdeuouYE4CZGY
	nXIiOvFezDk8G4uR21bQLgIrtnxIp7JpTDuAMjMsezRlXmTmsGhmJYhQ26SQqBjSijHnQ/
	Lt6tniqd1CPszcv4ajMiAjDWLW9lbQBEbUYK/d4bvdH7OXVsFkpGZxsNZq+hQAILxGUX3u
	2W/ZQtLf3qPlmrHUM0A2v7RQpxigoRvOJya2BP33kYHD92Iypvj43s2x0PPmtFp6X2/DKP
	iNAleGQsvH+nipUNJeQGW8+YksOmkmSrJ8Vkn0GFu93Go74tlEt2/hWQZ09P5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794330972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rwk8MQ7b01/ILEtot3jfbzVxNK+nULznBkVGvLR8IFA=;
	b=xd24dSkB0QTqgdy4/yx/ItLc4srT3UdDeokt2QWO1vfEbierFn7bLcggCTaHpP6TufgM2e
	oJNDlGkkqNv0+3BA==
To: sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Breno Leitao <leitao@debian.org>,
 printk@lists.linux.dev, Andrew
 Morton <akpm@linux-foundation.org>, Rio <rioo.tsukatsukii@gmail.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Bradley Morgan <brads@mainlining.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Alessandro
 Carminati <acarmina@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Pnina
 Feder <pnina.feder@mobileye.com>, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH printk 4/6] printk: Remove nbcon_atomic_flush_unsafe()
In-Reply-To: <sashiko-outbox-207025@kernel.org>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-5-john.ogness@linutronix.de>
 <sashiko-outbox-207025@kernel.org>
Date: Tue, 10 Nov 2026 18:22:11 +0106
Message-ID: <87zevghajo.fsf@jogness.linutronix.de>
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
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index a4dbb6b8cd2bf..7c03a17ba1288 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -765,7 +765,7 @@ void vpanic(const char *fmt, va_list args)
>>  	 * Explicitly flush the kernel log buffer one last time.
>>  	 */
>>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>> -	nbcon_atomic_flush_unsafe();
>> +	printk_trigger_flush(PR_FLUSH_HANG);
>>  
>>  	local_irq_enable();
>>  	for (i = 0; ; i += PANIC_TIMER_STEP) {
>
> [Severity: Medium]
> Does replacing nbcon_atomic_flush_unsafe() with
> printk_trigger_flush(PR_FLUSH_HANG) skip the final unsafe nbcon flush when
> a boot console is still registered?

Indeed. My suggestion for Sashiko's response to patch 3/6 will not
necessarily cover this case because printk_trigger_flush() will still
respect the console_lock when in "legacy mode". I think in addition to
the above change, console_flush_on_panic() should also be updated to
take a @reason argument and then do something like this (assuming we are
ok with the @printk_legacy_reason global variable):

@@ -3564,8 +3570,11 @@ void console_flush_on_panic(enum con_flush_mode mode)
 		nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 
 	/* Flush legacy consoles once allowed, even when dangerous. */
-	if (legacy_allow_panic_sync)
+	if (legacy_allow_panic_sync) {
+		printk_legacy_reason = reason;
 		console_flush_all(false, &next_seq, &handover);
+		printk_legacy_reason = PR_FLUSH_RUNTIME;
+	}
 }
 
 /*

I am not happy about this, but see it is a workaround until we can free
the nbcon consoles from these legacy chains.

Thoughts?

John
