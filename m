Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330370;
	b=FHqYzCr1JH9J8q8MGUY3SBzwFpx6ZQmUbggmI/hYMnd0vrK6ObArsjZkaHP5kOUpi0j+
	 hLop0/R0jQwy6EbY4+iPcAX6ljxdOiNZLZgVCxUOReqciL86ZbU+7/rRuFh0Vgvxi8CB7
	 4SqEGXV9PwTiYKFUELu93aKpKB68bfzWkfXUf6e2AtcAlFt4FFptmMTY2nevnBUeetg7X
	 FXtftrFjec26nK/eDvf3RXZPnggW5jc63Ek669Hd6KI6Tj5yOD5g1iQqXQGwX1l719KC+
	 UgHZ+r1sY/BCdD0rui12gK6DbgySkPYxU21OSTuuP2hdyhkHI5LqQ6JBtsK5vtV4lbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330370;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2rq+PIwUCms8DsPAO6QrWfvrFWsMOaqlsYD/F2PLF74=;
	b=ucMURoLDNaDaOttYG5h7z0YluQCCgpdMSqF4ifT6zRuS5b/UPyP9FI/1XuqgeNSoiL+f
	 5vuVvOunjmQ2griN76aAwXd0m9NbtWZCwjdB7RYRlmlRrCgenCp8OpQ5iDY0JajYqBNrw
	 8FrYk0OdQ6TsGx6cBfSCZppr/dtRhNGtS/xuulrE8TRgVYei9dOXtTTVzuoWu2MCUS6pw
	 4g767892VC26oe+JIWtslPAXejtTJJbPvGkIlbjam+576XFgdr8oebetvHZtrxAcutPsV
	 laGI+1EGn4M13vKaL5BsImFMYVIzFy/EGj+K6o/QSyBEiYP5y1EMAMP4WmOR25mjE3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="V4Y/AMqH";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="q0VrR/6I";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B843606A32D;
	Tue, 10 Nov 2026 17:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B843606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=V4Y/AMqH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q0VrR/6I
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794330367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rq+PIwUCms8DsPAO6QrWfvrFWsMOaqlsYD/F2PLF74=;
	b=V4Y/AMqHngDCyYOPHxZRRmocjtzPDsy3sgKUNNiJUo18QnilpFPy07nUQaTvgphf/OwkNL
	qNKdqoZSMUp9XDYyRepFC2AC2d9vHLp0liyv0MSNv/aDYI474e1RDafJB+bWtU/W5CDSHN
	mwl2bmjtT9267mPGUoPT0okTSz3qWlGfl8fZZBJNXcUw6uDeKV7zNKSuwocLNmQPtIGk9u
	wBV4hBQ2S+U6IdOp/gbmSi8O48QLtqIe20E/rCuFyF3Shga1FWyOh+JyXwS0I4SGb/3yo4
	x0EqGqnW4e6QsxamRQJJKVNfVFVkZ4+w+K0bD32DGxXPRSP0MjETeht9rlRiRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794330367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rq+PIwUCms8DsPAO6QrWfvrFWsMOaqlsYD/F2PLF74=;
	b=q0VrR/6IJ1xVqfZBfrbXgxQrzJAxCnuencnGHp7KLoxttWlbROYIFGzzy1GHkp5uBip2oM
	Xxd/jyJLBbVz7XDA==
To: sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Breno Leitao <leitao@debian.org>,
 printk@lists.linux.dev, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
In-Reply-To: <sashiko-outbox-207024@kernel.org>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
 <sashiko-outbox-207024@kernel.org>
Date: Tue, 10 Nov 2026 18:12:06 +0106
Message-ID: <8733t8ipkx.fsf@jogness.linutronix.de>
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
>> diff --git a/include/linux/console.h b/include/linux/console.h
>> index 0841bf5e88aac..8f5097e7f4741 100644
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -670,13 +670,6 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>>  			/* The write_atomic() callback is optional. */
>>  			if (!con->write_atomic)
>>  				return false;
>> -
>> -			/*
>> -			 * An unsafe write_atomic() callback is only usable
>> -			 * when unsafe takeovers are allowed.
>> -			 */
>> -			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
>> -				return false;
>>  		}
>>  
>>  		/*
>
> [Severity: High]
> Does removing the CON_NBCON_ATOMIC_UNSAFE check from console_is_usable()
> allow console_flush_one_record() to invoke an unsafe write_atomic()
> callback during normal runtime?

Indeed. nbcon_legacy_emit_next_record() needs to set and check
@allow_unsafe_takeover in the atomic case. Something like this:

@@ -1547,6 +1548,12 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	ctxt->prio	= nbcon_get_default_prio();
 
 	if (use_atomic) {
+		ctxt->allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con, printk_legacy_reason);
+		if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+		    !ctxt->allow_unsafe_takeover) {
+			return false;
+		}
+
 		/*
 		 * In an atomic or unknown context, use the same procedure as
 		 * in console_emit_next_record(). It allows to handover.

Of course, the question becomes, where does @printk_legacy_reason come
from? For legacy consoles the whole call chain is horrible and hidden
under console_unlock(). So passing in a reason is not feasible. My
suggestion is to introduce a horrible hack: a global variable
@printk_legacy_reason, initialized to PR_FLUSH_RUNTIME and modified in
printk_trigger_flush(). Something like this:

@@ -4743,8 +4749,11 @@ void printk_trigger_flush(enum pr_flush_reason reason)
 	if (ft.nbcon_offload)
 		nbcon_kthreads_wake();
 	if (ft.legacy_direct) {
-		if (console_trylock())
+		if (console_trylock()) {
+			printk_legacy_reason = reason;
 			console_unlock();
+			printk_legacy_reason = PR_FLUSH_RUNTIME;
+		}
 	}
 	if (ft.legacy_offload)
 		defer_console_output();

My justification is that legacy is on its way out, so we should not
spend too much effort trying to beautify it. Also, since
@printk_legacy_reason is modified and used under the console_lock, this
should be good enough.

Thoughts?

John
