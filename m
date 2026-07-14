Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C5377A9D
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054736; cv=none; b=L9hNlw3TQKhqVUiHZql4RFxF0U+jYUO8WPEFP1TOfee+liEAsAX9ySTlvKHsuLkrcn5rf5wMgOUpU81W/VFeS2VM08BejApYKh0L1swxpPvIuT4qaAC7cAd+DRkndGzTEG0P6ZdxV0OzB111wQjo0fsilbePlQDZ84PHBiXkItQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054736; c=relaxed/simple;
	bh=62uohTRKl0OM+sEC4Vkt/hhO6ul8Eq0uykp/8L9mEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLg3PBXCTlkz8YC6SVwGwK0/o3FkpbdfUF6Tqw5Kyqon3X2mvgQuLcnqOyfxRERSeFJA3JbBpn9s77KP4z8yFMUxYljK51jH2bSaFGNIRh5Cj0ICDjpSA3Yauc1FEYTrix7Bm1ejnjhDUjYLR7601eZnVUQLIWOUZ5cMJozOfLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS4Cp5+M; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS4Cp5+M"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso2600385a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784054730; x=1784659530; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6nkP4rSjqnpaQArQbVk/tr97ZX+rJm31+SVlfb5Lu0=;
        b=CS4Cp5+M8ZxcXebaydJtEoNt118ag5eyFc2pOUAquCpFW6VqkIxv4Sv4eP0Ow8W3EL
         2ovYeaFMMnA5DE1ndxBUQqynRWJ+Wi6fy8wU12fhhQldw2PD2faWLB9rUl2nSOYCR+Ft
         saUIzUFQWVxk4nlXmy5sRe6LUS1tt2YnwzHtcDQwru+tqlaIFIh3xGJ+VM+/i/9QLliC
         CckqdMMIF5x3fl5dHewPYmH6LoIlZ4KIikp1svjAatS+1u4K0VaHlQRQ5Ce6CFjqrZNe
         xK5AJrSE7TEPJB6fqX4BOz99Wptw4QcHqx268khI0UprJ4ywf7svZBcqW/gJyar9euq8
         Nb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054730; x=1784659530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b6nkP4rSjqnpaQArQbVk/tr97ZX+rJm31+SVlfb5Lu0=;
        b=GXyJmhgcUf+TS87odDWw4PXReaKcXJXWG0ejWjw5v/Ty4jJrcU0kDM+EvvQUgdCbbu
         lK9BEf3WNXR85g5g85jlyIA91OSZ9976+4SfMIuoLmeZ+PXxnQyUkAEL33/S0QYoVB8J
         wFWh+c8cEd5rmZmQbAI5GsHYZeSVR9m2xJ+9R6gBdXKlfWqGD6L5dz/xce7crtowDDSO
         rnoG2OJQlwojw/hW0d8MkhfcbgkPocdJ2ptRqd6cQAEY3eubx2VEdLFT7KQQD9JkXsgy
         gLXZ+nEAn7dCMYaS7X3hQKY1BypwCNvc5nwWN04NbGEhaZXm8A1nGUA/4Gqzopoypb91
         yXxQ==
X-Gm-Message-State: AOJu0Yyx7PdrrzvbBjXrO8gu7PCXo2HNUIYJeX0ZangHzGVaaQ1PavbV
	nDq8VbfLkqem2ei2tZpIptT8DlNbaFS18tR3O/9HXfc0EcTyCWZtfmGzWiAeXQ==
X-Gm-Gg: AfdE7cl5en2YL2zkIwRZTqb265menYSIUheHHUhWA4sx1AHd/YwghcrqxpIeCE9ZH/v
	80milaAiUP4bSGUeTRFqo8ZaAkVXUqG+zldAgUxO2hIYufZSpwGU8gdAVolmZlyZT+PRzHnPP6r
	Bnd2tEMUKXpvak0c2u2O8RgYp0qQpww3NFah5aQs//mCgXFro1YMZxHpUuhv6xqxkTuk56hhIux
	BKFwXNf9h6KRT2Sl+25X3cAL0fBu0vrI9DKl3laM7WE+4a3QaNwIhWJPN/WgLn8TpyjdzOPcFH0
	UnFuPPezloBlNjv6LKcTDF3LwWuzd4L8VoR+bPZx2jQ9XK7k7qENxOpQ6Sz/8GrjhXFENyIn3hG
	mfOEQ4uvUhwSFUSFU6lOIJzCc9ud+oKdecvSkFl5Bp3HZR6uzhll89NRvuDeEJuLfXbamOZ/bNS
	7f5RiDBn8VVQ==
X-Received: by 2002:a17:90b:1fc6:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38dc7769973mr13933137a91.27.1784054730379;
        Tue, 14 Jul 2026 11:45:30 -0700 (PDT)
Received: from john-p8 ([98.97.42.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6da2sm1946213a91.4.2026.07.14.11.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:45:29 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:45:27 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mattia Meleleo <mattia.meleleo@coralogix.com>, bpf@vger.kernel.org
Subject: Re: [PATCH bpf v3 1/2] bpf, sockmap: Account for receive queue in
 FIONREAD without a verdict program
Message-ID: <alaAp3qrrn3XYd8u@john-p8>
References: <20260708-fionread-no-verdict-v3-0-b4ee31b3af53@coralogix.com>
 <20260708-fionread-no-verdict-v3-1-b4ee31b3af53@coralogix.com>
 <20260708171659.8695B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708171659.8695B1F000E9@smtp.kernel.org>

On Wed, Jul 08, 2026 at 05:16:59PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
>New issues:
>- [High] FIONREAD (SIOCINQ) double-counts available bytes when a verdict program is detached, exposes negative values, and under-reports bytes when a verdict program is active.
>
>Pre-existing issues:
>- [High] udp_bpf_ioctl() suffers from the exact same bug that this patch fixes for tcp_bpf_ioctl(). Without a verdict program, data stays in sk_receive_queue and UDP FIONREAD returns 0.
>- [High] Data race and sequence number corruption in psock->ingress_bytes during SK_REDIRECT.
>--
>
>--- Patch [1]: [PATCH bpf v3 1/2] bpf, sockmap: Account for receive queue in FIONREAD without a verdict program ---
>commit fc144ea49f61a51adcd404a526d68065c61d0452
>Author: Mattia Meleleo <mattia.meleleo@coralogix.com>
>
>bpf, sockmap: Account for receive queue in FIONREAD without a verdict program
>
>This commit modifies tcp_bpf_ioctl() to add the output of tcp_inq() to the
>reported FIONREAD value when no stream or skb verdict program is attached.
>This correctly accounts for data resting in sk_receive_queue that has not
>been diverted to the ingress_msg list.
>
>> diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
>> index cc0bd73f36b6d..8e905b50deadb 100644
>> --- a/net/ipv4/tcp_bpf.c
>> +++ b/net/ipv4/tcp_bpf.c
>[ ... ]
>> @@ -344,7 +345,21 @@ static int tcp_bpf_ioctl(struct sock *sk, int cmd, int *karg)
>>  		return -EINVAL;
>>
>>  	slow = lock_sock_fast(sk);
>> -	*karg = sk_psock_msg_inq(sk);
>> +	psock = sk_psock_get(sk);
>> +	if (unlikely(!psock)) {
>> +		unlock_sock_fast(sk, slow);
>> +		return tcp_ioctl(sk, cmd, karg);
>> +	}
>> +	*karg = sk_psock_get_msg_len_nolock(psock);
>> +	/* Without a verdict program, ingress data is never diverted to
>> +	 * ingress_msg: it stays in sk_receive_queue and is read through
>> +	 * the fallback to tcp_recvmsg(), so account for it like
>> +	 * tcp_ioctl() does.
>> +	 */
>> +	if (!READ_ONCE(psock->progs.stream_verdict) &&
>> +	    !READ_ONCE(psock->progs.skb_verdict))
>> +		*karg += tcp_inq(sk);
>
>[Severity: High]
>Does this conditional logic double-count available bytes or under-report them
>in some situations?
>
>If a stream verdict program is attached, data is queued (which delays
>tp->copied_seq), and then the program is detached. The unread bytes sit in
>both msg_tot_len (ingress_msg) and are also reflected in tcp_inq(sk) because
>copied_seq was held back. Adding them together here would double-count the
>available data.

This is fine lets ignore this for now. Every system we have adds sockets
to the sockmap on connect so this condition is not seen. And above 
solves common case.

>
>Conversely, when a verdict program is active, tcp_inq(sk) is ignored. Could
>this fail to account for unparsed data in sk_receive_queue, leading to an
>under-reported value?
>
>> +	sk_psock_put(sk, psock);
>>  	unlock_sock_fast(sk, slow);
>>
>>  	return 0;
>
>[Severity: High]
>This isn't a bug introduced by this patch, but udp_bpf_ioctl() in
>net/ipv4/udp_bpf.c appears to suffer from the exact same bug that this patch
>fixes for tcp_bpf_ioctl().

Sure but doesn't need to hold up this patch. Mattia would you want to
fix this as well? Otherwise I'll put it on my list and get to it at
some point.

>
>net/ipv4/udp_bpf.c:udp_bpf_ioctl() {
>    ...
>    *karg = sk_msg_first_len(sk);
>    ...
>}
>
>Without a verdict program, data stays in sk_receive_queue, and UDP FIONREAD
>constantly returns 0. Could a similar fallback to the native receive queue be
>applied there to prevent user-space applications from hanging or dropping
>packets when relying on ioctl(FIONREAD)?

yes we should do something here.

>
>[Severity: High]
>This is a pre-existing issue, but is there a data race and sequence number
>corruption in psock->ingress_bytes during SK_REDIRECT?

yep pre-existing needs another patch.

>
>In sk_psock_skb_ingress_enqueue(), psock->ingress_bytes is incremented without
>locks:
>
>net/core/skmsg.c:sk_psock_skb_ingress_enqueue() {
>    ...
>    psock->ingress_bytes += len;
>    ...
>}
>
>Concurrently, tcp_bpf_strp_read_sock() locklessly resets psock->ingress_bytes
>to 0 and uses it to adjust tp->copied_seq:
>
>net/ipv4/tcp_bpf.c:tcp_bpf_strp_read_sock() {
>    ...
>    psock->ingress_bytes = 0;
>    ...
>    tp->copied_seq = psock->copied_seq - psock->ingress_bytes;
>    ...
>}
>
>If another socket redirects data to this socket, the target socket's
>psock->ingress_bytes is incremented by the workqueue or softirq. Does the race
>with tcp_bpf_strp_read_sock() cause redirected bytes to be incorrectly
>subtracted from the target socket's tp->copied_seq, artificially holding back
>the ACK sequence and corrupting the TCP state?
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260708-fionread-no-verdict-v3-0-b4ee31b3af53@coralogix.com?part=1
