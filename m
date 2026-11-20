Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172916;
	b=JuLoEWTFJdqqNJZwN5e04zGx5uvCf+KjJd6jFbZdxOG9HWyzAgbgEto++4qUtNy1lq8A
	 WkwQO/7iZNdRYgxj9Di64fySHizR1MPiXVhbKkw0vvUYoJFv5jtJ3rjvOQbT2ia/6ZLov
	 wcQ5TSvMwxG10twiaSKFDz7FIMzvsHcB360kUVzlnDJxSnp36tLWsFZahVpcEcSt+xPkl
	 f+awDv4UBQ3F02Xtb22/l2njg7FT7DvT+J+yYm7gC0eTyw1dFnT9RzRO2yUCLCoRE1QxU
	 zZSXEKLalaVKmPU+fv9hT1DK3nS0jrghlYcPi7FON3Dkl/uHxERujUX0aKT1z9u2N5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172916;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=vQHnCxumodLceV3FCZMlZjlsObg36p4OHXhw3jDQXfQ=;
	b=LmjR+ZhH7iGJwedGsM2wkps8MitasmjJ2uzYv6T4GQmrTDqtz1cnPHNfEPusx5xjjQTW
	 BIAs3ZWGRwqXph+fnblk9pM2tfVhxRqpXNNhT6DTDCR2aBm2JiPNPIf787I/QVujoO2+I
	 GnlZ6PnbjUoe0qCOt/IlobYEdDLclL40QgUN0WMmJa6mURL3XfL9oubunZvekFfy9HTTY
	 65aqsEMLWQpAHFdNYLz+5fKdIoaax2zOoVD55BIxucD3/JMGGNLwXJxP8fNqywRj71Vxl
	 ZzBRpLF7HW++Q9peR6xTVJrHbcaIcGm5qsm04/IvYsNHlc4FrFuRMPMjjaoKL9ibiVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WrS3EUNm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=unkgHDqC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB1606A32A;
	Fri, 20 Nov 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDB1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WrS3EUNm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=unkgHDqC
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795172911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQHnCxumodLceV3FCZMlZjlsObg36p4OHXhw3jDQXfQ=;
	b=WrS3EUNmG2sMWwRLVRW1rkZfopMVF4HQl/AgnR0K0qazkozmURGdqWz8iLNRtGD9ARP4IV
	GVghr33yVeMuzB3O/vtO7O14BrW1gwyJER7IVP8FVDzl5FTj1RqgwhuPtaGwqTWu+HitWv
	WKFciAqDTQlmQe0UQbMfQQmQWKKXVM+OTKoXpyLvuRq8lbZpPFB4Vd8DM4JB0JMGigXdMj
	CcqNKBofMq3DyPIPrr4ND2Pqh86Ufvbz6BV2pX7vLMD2uAa+bICo4TuaNmsruW+hVu6LNa
	aReFSNxfV18vjQHuWTRQ/ZMjJvs9ssSgkvn9e0BE43RirsBDCZ22PRQs9fmlRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795172911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQHnCxumodLceV3FCZMlZjlsObg36p4OHXhw3jDQXfQ=;
	b=unkgHDqCc8H/26uI4szPOP+5vgt5UtTl0ZOrU+tNxfDVTDlMNAZfXMcoTtQ9gIJYiMufiM
	nIo1WiFSOMO8oHDw==
To: sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Breno Leitao <leitao@debian.org>,
 printk@lists.linux.dev, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v3 5/7] console: Support unsafe flushing for
 panic/emergency restarts
In-Reply-To: <sashiko-outbox-224168@kernel.org>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
 <20261118230345.808560-6-john.ogness@linutronix.de>
 <sashiko-outbox-224168@kernel.org>
Date: Fri, 20 Nov 2026 12:14:31 +0106
Message-ID: <87fqwvlpzk.fsf@jogness.linutronix.de>
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

On 2026-11-19, sashiko-bot@kernel.org wrote:
>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index c3307b5b2c922..daf1fe8522117 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -557,10 +557,6 @@ static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
>>  	if (!ctxt->allow_unsafe_takeover)
>>  		return -EPERM;
>>  
>> -	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
>> -	if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
>> -		return -EPERM;
>> -
>>  	/*
>>  	 * Check that try_acquire_direct() and try_acquire_handover() returned
>>  	 * -EBUSY in the right situation.
>
> [Severity: Medium]
> Can an NBCON_PRIO_EMERGENCY hostile takeover clobber con->pbufs while the
> interrupted NBCON_PRIO_NORMAL owner is still using it?

Yes, this is not acceptable.

>> @@ -1465,12 +1461,19 @@ enum nbcon_prio nbcon_get_default_prio(void)
>>  static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
>>  {
>>  	enum nbcon_prio prio = nbcon_get_default_prio();
>> +	int unsafe_policy = con->allow_unsafe_policy;
>>  	bool allow = false;
>>  
>>  	switch (reason) {
>>  	case PR_FLUSH_RUNTIME:
>>  		/* Never unsafe flush during runtime. */
>>  		break;
>> +	case PR_FLUSH_RESTART:
>> +		if (prio == NBCON_PRIO_PANIC)
>> +			allow = (unsafe_policy & NBCON_PANIC_RESTART_FLUSH);
>> +		else if (prio == NBCON_PRIO_EMERGENCY)
>> +			allow = (unsafe_policy & NBCON_EMERGENCY_RESTART_FLUSH);
>> +		break;

Yes, this is also not acceptable.

The current console ownership implementation relies on panic being the
only context that can perform hostile takeovers. This is a fundamental
rule in the implementation and cannot be changed without significant
rework.

My idea is to reduce NBCON_EMERGENCY_RESTART_FLUSH policy to only mean
unsafe printing and not hostile takeovers. I think this should be
acceptable. The changes against this version:

1. Restore the WARN_ON_ONCE() in nbcon_context_try_acquire_hostile().
(And add more comments to it saying it must not be removed!)

2. Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe_usage() to
give it a more appropriate name. The implementation stays as it is in
this version.

3. Add an extra "&& extra panic_on_this_cpu()" when setting the
@allow_unsafe_takeover argument because that argument is not just about
unsafe printing, but also about hostile takeovers. So it looks like
this:

allow_unsafe_usage = nbcon_allow_unsafe_usage(con, reason);

if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_usage)
	continue;

nbcon_atomic_flush_pending_con(con, stop_seq,
	allow_unsafe_usage && panic_on_this_cpu());

This will allow unsafe flushing CON_NBCON_ATOMIC_UNSAFE consoles based
on the policy while avoiding hostile takeovers in non-panic.

Thoughts?

John
