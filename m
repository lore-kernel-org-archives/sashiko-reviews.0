Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B83EAC9B
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297354; cv=none; b=TPTJiRjR16DxjFhnEydy4Z5dAoSHtUcM5y0WiOoFaC+Sg9rnhucl23KtQC/M3cj046R+kghwp3wUJ6tbZh4Q9W0PrC5uE67Z4Wmk8p50POCnxxecLHhAnAGZHKAfmnmt2qzN9/fcXe5ff8S+fbqqom1Rpu0ZaAsbnARXiAGHzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297354; c=relaxed/simple;
	bh=MLt2tnNzp74uVGtu4VkKS+MkXNeMGEZuFO6OXzbqmTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Abvq5ZwgreEyOisqpSmPyPHH5x0uPBIF/q0AP6Jh5zDeKF/W0iuHQY/MmBl7Z4Hd/Tu1Rn0WBWJ/PT7i92uNngNvPzc/qx+y2MnvaaQBI3WG5JA/gweMLr1niGEx/aAB6CGBGobCC+xNhDCxUMBLQzxAaMOxik28uX8CU1DOnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blY9Nj/u; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blY9Nj/u"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-837dfccd950so2465165b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 10:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779297352; x=1779902152; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ue8SwT8+H83JFEChssYsR7+2GhS8y/4jRpnpitk4RZE=;
        b=blY9Nj/usI7rkRsQ5fw7PTnT3rbnNDZ+2m0VBtRgmFCGRmBAa+3cluRECBriCLOfua
         X78c+5mXOF+g8ajVNFyMsErupQzcmdjUR36hljDwY78BWQV++ceQ2Q1FC0yyVRWe5it6
         aGD6F4Xkkbil2KBVVgO/GEH6/G0zqlJUiAVHpRGq5JZp701a99Q2RIN7nJtlX/9rDBry
         4EfsYgib65tGqHDxdSH84tPpv5yqgt7aYBRTqXlf+sTUvwstymAoRsJVVSsPpyigqiRd
         P0iyC8S8BFj1zCYKkiDlB0SWkF8glODXDBVZmIc0v6QDcDSAKuapegPWc5cgfyBHHl0t
         4gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297352; x=1779902152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue8SwT8+H83JFEChssYsR7+2GhS8y/4jRpnpitk4RZE=;
        b=O/xCehOxFGZ2miIGAvX4nBPJ2lhWA8DPfTa75nC/UYmCSiRaEJbuOND/YrJkFcCJFX
         44YiH460nHTjZh2FRq9MN7DCqVYqueDqIA6ROB//CMBxwrAo/G4sCHpYhkmjl5nbr/0u
         gTRBW8f5cvUzDfcUA/HAzpBqcV+DVKZb8pdF7O57JxUqLFpsKIFteahs+1xipijsshEe
         T2TWaDVUwGo4uWMZJCzfNaq5YGf/oXHWNiYt/Ywlecf167vP1e841pKrJgvNq4fJKLzv
         ILYRzXTOqEGnJeNbJfRGPz9Lxxj/VXyk9kCveITG3ELIILxz9ru9Ty8HX/TM8JAO49Ie
         enBQ==
X-Gm-Message-State: AOJu0Yx8HfRzIMBR3aBOSLBGj/Jiez1lTWF+m8hhpf1ulczRhxnLCaCR
	/o2uWpd8Lgo0+XjmdzyQv++h/9tmjtGw6jpXHQjI5gYol30Pfo55WUAijgn5nw==
X-Gm-Gg: Acq92OGfKHqM67b2mOd64OT5HqXfY+LpqngeIwgt+jGjq3ik6pSnbiUPowQWojW+e2x
	mYB/tJa0HbNOUpMFeqLp90fu+s4Rb5peRm0ml0iD0hJgLVKqA7khLiTW7BDRA2kp4sypc5v4Y4h
	fJswyBJAHOXakyGxKozHHbJw+gB7MyL5tVVNJ7zX/QEYpSjo5+rihjE9p5CKwqOAe50DPK/4E0l
	Q+FFR+p//dQooDn597hRFiCCqPGy8N4sLM8C96VbMB/oSDeSh1vSneS8Sc3bmD+80hyUNbZcNae
	sfpaH0Np09g8ZJIWrefadzN8pgY7EoThqypB3ihQ+GMJLFJpIyaGgh2zGTLetZJXkE19HYQ015A
	Sxp0s11YCddLrUIIM8khpcXJIFXJ3Ss+3OVM2BR+8CC128oKCPrWraSRB+WZLISL/VrDypeghFN
	AHeVwRqywstyPmrLgSiVYhVh8nBGRQVWA=
X-Received: by 2002:a05:6a00:240e:b0:835:cc47:6fe8 with SMTP id d2e1a72fcca58-83f33dae668mr26095823b3a.46.1779297351847;
        Wed, 20 May 2026 10:15:51 -0700 (PDT)
Received: from john-p8 ([98.97.43.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660easm21263882b3a.11.2026.05.20.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:15:51 -0700 (PDT)
Date: Wed, 20 May 2026 10:15:49 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Christopher Lusk <clusk@northecho.dev>, bpf@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: tls: preserve split open record on async
 encrypt
Message-ID: <huduxtn6parzgiaf5cyiyrrvjjvx6jsdedowvrd4nkwmuyeind@j6migjgofh2i>
References: <20260515151556.189841-2-clusk@northecho.dev>
 <20260516151628.F18DEC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260516151628.F18DEC19425@smtp.kernel.org>

On Sat, May 16, 2026 at 03:16:28PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>- [Critical] Error masking in bpf_exec_tx_verdict() leads to zero-copy Use-After-Free
>- [Critical] Use-After-Free during __SK_REDIRECT socket lock drop
>--
>
>commit d94934a96df0cedb5ae4fee1bc9264e363a4efb9
>Author: Christopher Lusk <clusk@northecho.dev>
>
>net: tls: preserve split open record on async encrypt
>
>When a BPF sk_msg verdict reduces the apply_bytes size below the open
>record, the record is split. This patch ensures the remainder record
>remains rooted when the initial encryption completes asynchronously.
>
>> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
>> index 2590e855f6a5a..5682849e102c7 100644
>> --- a/net/tls/tls_sw.c
>> +++ b/net/tls/tls_sw.c
>
>[ ... ]
>
>> @@ -861,6 +869,7 @@ static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
>>  	struct sock *sk_redir;
>>  	struct tls_rec *rec;
>>  	bool enospc, policy, redir_ingress;
>> +	bool async = false;
>>  	int err = 0, send;
>>  	u32 delta = 0;
>
>[ ... ]
>
>> @@ -910,6 +919,10 @@ static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
>>  	switch (psock->eval) {
>>  	case __SK_PASS:
>>  		err = tls_push_record(sk, flags, record_type);
>> +		if (err == -EINPROGRESS) {
>> +			async = true;
>> +			err = 0;
>> +		}
>>  		if (err && err != -EINPROGRESS && sk->sk_err == EBADMSG) {
>>  			*copied -= sk_msg_free(sk, msg);
>>  			tls_free_open_rec(sk);
>
>[ ... ]
>
>> @@ -979,7 +992,7 @@ static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
>>  	}
>>   out_err:
>>  	sk_psock_put(sk, psock);
>> -	return err;
>> +	return err ?: (async ? -EINPROGRESS : 0);
>>  }
>
>If async is true due to -EINPROGRESS from a previous fragment, but a
>subsequent fragment encounters an error (for example, if __SK_DROP returns
>-EACCES, or if tls_push_record() returns -ENOMEM), does this return
>statement mask the -EINPROGRESS status?
>
>If the error code overrides -EINPROGRESS, the caller tls_sw_sendmsg() might
>not increment its num_async counter. When the send ends, it could skip
>calling tls_encrypt_async_wait(). If MSG_ZEROCOPY was used, could this
>allow the function to return to userspace while the hardware crypto engine
>is still reading the pages, leading to a use-after-free?

Christopher, this at least looks like a legitimate concern. Did you plan
to address and send a v2? Or explain why this is not required?

Thanks,
John

