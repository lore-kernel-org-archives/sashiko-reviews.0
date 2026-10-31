Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485852;
	b=CLrnmsmSCE3HM9hCNUbHB+mKI7fAXzM7JSq9Ig2InHnntKUxR3mjMUsFcv/p2E0LdHS1
	 4+cT6ccG5JRKRQgTVXUDVOxG91UpEvcs28E9/ljcrSlOv26X/yh2l/zbN9I9EZ4OIcNQG
	 Qh9+OD1RDOZ7Jt+cP9OTUpJWVAr4O3QH1HxQVVpdEPUoFeZkAzbiMs5pNLdSepAnX9w2M
	 r9DQAt/jRnPOyCfd56mZbXx/0hGgBIFqgH4aGCY913OAvQ2e9XCkM047wGQG8oof3ayqv
	 55Ip5XGw/9bUijV2VA+u8sfWImVzmUhgx9P//dh6jAQvqo4q1iN3rT11fF6XjW6KjGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MGo4Bgn3xfsuhIWP7gZlr7cJuf2A0Z2Vo1yEXLBRDEY=;
	b=BjwZrP4VqWUe4/4IXP99iFIFSiI+wzOdrcLgNmTEYpphMTc04hCknC2o0oJWMonrBja6
	 OrcpfEnADK8jgf6HhlFutvVKR7Kt0sJIP4p5PKbPSd8GWOxcKyP7Mqq43LBdHcX2faJx3
	 k61O9hyj51jWIFkKtJbLI4r7noWeIuzgUvxwiXYExVbH9KgoHmZgdv3a2zK9JFEWqQ3Yl
	 NaW7hdL+tcCvudpusgVDjsev9iTyHoIVSnPsNg1Z7vMp5kSAkcaswO5PI/xMgdSvbE2fo
	 YVog6RezvRutDWE9KaZzN6Ve/Shr1o7/vKlZEqVYQL58WPsUXUysnjec1h+a2aMd3DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rG6iwSyD;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850D606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 22:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B850D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rG6iwSyD
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1171672a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793485851; x=1794090651; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGo4Bgn3xfsuhIWP7gZlr7cJuf2A0Z2Vo1yEXLBRDEY=;
        b=rG6iwSyDA8f9l/l7gNPBkcK9alDzfkUGPjUoPqKHYAYqbJFqYMBeHyknaCNjhmFUaZ
         zaQcmueqxVejWspJkYovJvxAwuISMJFk5ON7d4LGeDI3VBPhJ8s8BPV0056IIHvlLzuS
         j7CA1LO/+FgNZEQV0knQ9hIax5JeAS/RO+prCzsezW4vG2T720OQ+YzPWDGYCutehLqY
         1HphfgB7ulW3EVViioAkUg9k/HaspeaO5WQ+V8suVa1IuIPnfm8jFmca1Jm6yVQz/7h2
         KpB7WuWtBmQWZmcdu99nCJ0af3tgXIeiZrmGhHuC1kV7RMGLE8D2zq4t0qG+YgIRFkmE
         s0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793485851; x=1794090651;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGo4Bgn3xfsuhIWP7gZlr7cJuf2A0Z2Vo1yEXLBRDEY=;
        b=Fs4WxoUx+EYLAPj+IHT7NllFagRzc8q+RvU7Et8MP4+wG6vqem3+vE0JJc9B+vVdPX
         Tvd/hikgkE1KGp6VQCco9Tn5T01JU34e0XUFVnBrBmhZZBLFr0Q1LFjq5MZR1J0KyjSG
         C14dzRJuAIQkOUHRMCyXVKVHZWmoViRtomrW5bn3ENJxeFZZwYmmnIbmmRtuu7X0hB0e
         69JmblVjkbe+tuEm7rnHAmWJakjkWj/GxxnPKg5nrYmSAp8VddO57gkc/s6W/6sCY1va
         pSaa1rjp3SCjE0gNU0Lioh6Mhe2+tljk3t1U9wp6BAETATry4HnlIrFJM9hfeeTdwE6H
         +TBQ==
X-Gm-Message-State: AFq9FYL01gyR6w36nknakqZzhuWw5f6fo9kERIQ0lwqHigKyAe+ipg4M
	cSCS8Lhcb9oEqBspj5gb69irnFh/WeuNgXkt+ifK089WhEZyCMg7fDecQFi2Tw==
X-Gm-Gg: AYBFou2kf1saDYawTWwzO4JaqPXxGBmctIWTQGrXOa4aCJam3b6TGQfh39FcJY710cw
	50jAtvfx863HHeHDJjhGEGpm6ImJyka9lw3CUS7so+v12yz4TTHnicbc6Sn/Qsl57GpE97lZzuB
	SLiqEgre6WrVfi3VyGWLKsghNOX7376U4w8wPABpdG8giiknltxoN6UnZAqtj+nDrGoYgozuPu9
	txa4tqs0nFkNFLdkUfPS59PjsIXFsvVbTDHAskt+CRV21G7XPVEcCrHrF2n3c8yCOkaW1aTFEdq
	AojhQWPstMQ8JMkV1FFcCaGwvof6XactLOaCoB0javBW5T8ReexMap9s7zsmoTWrM4n3pwGE/GT
	ICYGSBfO01wzOEUaj3mKbwc+Dq5VxygTAh2wFv6D9u3p5Gknb/oKp58UdyT0sj3l7aNyg4xmCIi
	mWPAqhHvVHr1SvhHCHZJhUb0nKRBzTjna3V0CfkR9vGFcpLqE1BaYli0/QobhWP5QQkqKwbKAlU
	wlRLXUDD9zwiMHTR27qNIUaHcCHJ8oZGn8C26KI25wTAplGnwvokqfUvelQ2TnDdytQcJouYYPq
	CdIYraXAlRK1C2DQxJGCLR2nUzzUBINsfSDL/Ohk9K/l8kRtRTtBKFQHL98BsHFzftqxy4gONK/
	EALG0tUrXOPrC+iMR1gYRMJApPfckBfzh5g==
X-Received: by 2002:a17:90b:1e42:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3ae8957d4ecmr5239181a91.4.1793485851158;
        Sat, 31 Oct 2026 15:30:51 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm8689761a91.3.2026.10.31.15.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:30:50 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 22:30:50 +0000
Message-Id: <DMJDO9F7MS0Q.1KWWWLKDATXA4@gmail.com>
Subject: Re: [PATCH bpf v2 7/9] bpf: One may_goto time slice per prog
 invocation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-192205@kernel.org>
References: <20261031215543.682284-1-alexei.starovoitov@gmail.com> <20261031215543.682284-8-alexei.starovoitov@gmail.com> <sashiko-outbox-192205@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 03:25 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		off = off >= 0 ? off + tail_cnt : off - jmp;
>> +		if (off == (s16)off) {
>> +			insn_buf[cnt++] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, off);
>
> [Severity: Medium]
> Can constant blinding cause the 16-bit jump offset in may_goto_expand_timed()
> to overflow S16_MIN on backward branches?

Not a bug. That's the limit of blinding, not of may_goto.
Blinding adds 2 insns to each insn with a constant. A loop body of 32K
insns with five constants in it fails with the same -ERANGE before this
patch. Every conditional jump of a prog has this limit.

[...]

>> +	bpf_timed_may_goto_save(prog, &saved);
>>  	callback_fn((u64)(long)map, (u64)(long)key, (u64)(long)value, 0, 0);
>> +	bpf_timed_may_goto_restore(prog, &saved);
>
> [Severity: Medium]
> What prevents bpf_timer_cb() and bpf_wq_work() from reading a mismatched pair
> of cb->prog and cb->callback_fn when bpf_async_update_prog_callback() runs
> concurrently?

Nothing. The race is there, but it's harmless.
Two progs have to set a callback on the same timer at the moment when it
fires. Then the callback uses the count and timestamp that its prog left
on this cpu. Nobody sets them anew, so the callback gets less time, never
more. The limit of 250 ms holds. The other prog gets its values back.
