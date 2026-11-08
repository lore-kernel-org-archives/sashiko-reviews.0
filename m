Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154113;
	b=g3TZxCOWuApn+Ibe4Z5NsESCRn7jl/o/6GHRdiG4ozkDHaT2U7J+OGP1Cfl6NYR9o4hf
	 jvgE5mJalZfW3+FdCGYJhiSBJi7hIPdFauCYOlW28NsigClDuq0lMRsI/o8Wrav8HJF9P
	 CNA+0efR+KpLlkL2wPnhMkWff2/aX4ZQhr+aUq052fvH9lAQPSKnEjZCPyDTQVINlJ++g
	 5DATSmAXLZS8WgF304tfsdVORiXXFKTD4CgeLoeRqFKv1SN0Kk6yXMQb5bBE+aLDnGZYC
	 O3rI5/uM4eREu5syzXqudARFOMc7Yxt0ccT7lqG7uvu2LRYcuCm5y/iTENQMAgp7ipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NOeGCapXsRsus++SJZpGsxfNcw1CzTDVFljcgsUPEu8=;
	b=U4Wpk6QTd2fb1FcroIIfm6lMfjKxatqaF7qoBvu5Yt/6qIE3D5zKPo03nCiHchJCi4Vs
	 2IRHOAfJXWkukDQL4+uCjNK2FIkhqS7bDbL9FI51qUujBZBhplt4qHX9+R7mfJRg4Uqs6
	 UzGAFM2bpukAyt1IROiOyXg/hPq5/gAfQG0poZ4JuHWY4DcbC+rZ8X9e++BuATkab8K1W
	 OIrdIbljRIxHVqh7hBUlvMWU+NFxrooReLsxMS3ASd84INCHz5SgXM5w48dorW5iAsX9O
	 zuMOxEUPhZyBGawdI5IpKMH3TNqGKWSpXpwHIe4Pq+FRUf4RD9UPvA1wguOL88Sn8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uJq90/v/";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62E606A31C
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 16:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D62E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJq90/v/
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so68887a91.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154112; x=1794758912; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOeGCapXsRsus++SJZpGsxfNcw1CzTDVFljcgsUPEu8=;
        b=uJq90/v/fFOIf+6ZuE6GpzOfzpm5rY5c16LI9F/XAYuniWGU1lPKEhn/vK95KX3AzB
         4ql44aQE/JLoxelZ78oqq12yXU9+5NFfLxq5pQGHgrSEI1pj6mUoD14K5L0b/3xw2vFT
         C61h8nO8i0cV/Flr+W60VEx9PsoAeL2dSlc5Y49jC6eEIFQr9OPZUWOc6ouNwVWElyzp
         rzrv925D0+A8LgtFXK0dLwkuFTz0v8JxJDK1x0VAQLxI5ipY5IrzNIjS9pCBesjCMAqF
         8bobwoMhN4dnSTEAPA+lHvygwVMjhP77bhzz1ddkL0VN8m/o5OINY1ZbLgzPYD3yJsKY
         TrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154112; x=1794758912;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOeGCapXsRsus++SJZpGsxfNcw1CzTDVFljcgsUPEu8=;
        b=JMrY7UApzuDN4E03pm/uR4o9SCJJc2pGHlHhm8bomP6CskaJAzAGDXOVPjR7ThOiST
         0ersULJuw9TbCbd5yO0+dYcjGlmfON/7hGb/4l86+ZFW6UsNT5tWDzN5WgMDu/uhuHvb
         CPwFeMi1+dJdgb9Doa2DcRrPVDaxb2gfeOLwIf3ZPHTZZgziWKoJwHyP5GDQ9xj7uVhr
         7QxJDKBpHGFDQkfR8j2FtAHwZGg3KVC59RXgf1J+psZTzvE3qaa1kwChOkpuaDUGTK0a
         mNASOxVb7nN8CHOiyEEYtyHX7lFq1WKS2Bw9RTV+mtBrJbS3BN+Xxdp2nTaY8aFRPugI
         yrVA==
X-Gm-Message-State: APuU4Z9oBqOLNIrrLvlz4UuVaA/q2ZMa4L8IeBC9GJKKi5iRGog4lCca
	uC+HlHY1xah/KL2UyA248EBjB6zrBiafRZ6HLHlvy2mQTiO6NYNV0gedB3idrg==
X-Gm-Gg: AYBFou3hRGQiNPGdLkee9YRcaT+QBKqB98PM1wk8uZuaBh56sl8u2uc82wS/tyEi474
	QxLhvrIUsR2iVEQp9gwlk8tpxpyxO+xx2WjyOKxSuI5hifmjj8vyRh0Xbk88HmDMAt4mbySGoDM
	PwMtHprI6O/cUISuucwNqCe28E1+tRJBC5PoZLCQFIoCSi5lfvg+/eh0NeeG5ASBxY/r+GAVp1Y
	YVi7kdczT36dj8uh3aVjhJmKYSHeG6h6l/LglbHQ+lg8TI1dVL4S6N076yXdgIdqOk8YeER1weR
	dnP7BCOgn7ufZq/h40m8RRg3NBHz/CF2EdYccF9mnmmGYcor9NVXcJ6BENy5GMRGaVAm6iGAdiE
	le7hu1xiEI4XGSkaP/ToURqIx0l4HY96WVyE9tl0mcauIohF3MtaqLsY5Ziy4LpHofmn9Q9Vukc
	fyI+wihHCoy/aq80WbzxqE5R1GNAkfJLuOQmFvpjtGcJ7IcZt5KmjcSYLsrc3NFZKwD8SMo5vKb
	E9ijTcJ51QbB4EVfAOPKzB6iRc0+lIOiqgAoVVqlvQ+hy2lr2/9r0V/e8bXNJzav69kWkyocnCq
	3qI95nJZlLBe6Jb7g7jk4wQb1rzzI0eMOw1CyCNvWCPPDKiIBR0qNok6mNVoMHRxNR/yLYrRrV2
	2q4OVjaIYZA7ktDWTdC9mHq3Y5/7g8zUs4ag=
X-Received: by 2002:a17:90b:184c:b0:3b0:a4d1:6d7a with SMTP id 98e67ed59e1d1-3b12d33d28amr1278110a91.31.1794154112257;
        Sun, 08 Nov 2026 08:08:32 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm7405174a91.10.2026.11.08.08.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:08:31 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 16:08:31 +0000
Message-Id: <DMPYJW83DBZV.2HJY5R042YSW2@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: Keep one basic block in the level 1
 log and print the way to it
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-203594@kernel.org>
References: <20261108053937.4134138-1-alexei.starovoitov@gmail.com> <20261108053937.4134138-3-alexei.starovoitov@gmail.com> <sashiko-outbox-203594@kernel.org>
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

On Sat, Nov 07, 2026 at 10:02 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> @@ -2883,6 +2886,7 @@ static struct flow_state *flow_new_state(struct bpf_verifier_env *env, int prev_
>>  	s->seq = ++flow->seq;
>> +	s->from = flow->from;
>
> [Severity: Medium]
> Does flow_find_state() look up the caller's basic block with a callee sequence
> number after a call to a static subprogram that is verified on its own?
[...]
> If verification later fails in the caller, bpf_flow_print_way() steps back to
> call_idx carrying the callee's seq in from.  When multiple states were kept at
> the caller's basic block, s->seq == seq never matches in flow_find_state(),
> so it falls back to list_last_entry() and prints the wrong state and incoming
> edge for the caller.

Not a bug. It's a limitation.
When the seq is not at that insn flow_find_state() takes the last state
there. With one state at the insn that's the right one.
With several states the way can show the edge of another state.
The way is a help for the reader. Nothing depends on it.
Level 2 has all states.

>> +		if (level1) {
>> +			bpf_vlog_reset(&env->log, log_pos);
>> +			env->prev_linfo = NULL;
>> +		}
>
> [Severity: Low]
> Should this also reset env->prev_log_pos = 0 when rewinding env->log?

No. Not from this patch.
Inside a function every prev_log_pos is larger than log_pos.
The rewind cannot make them equal.
The case that you describe is the first block of a global function.
The log is at log_pos already and this bpf_vlog_reset() does nothing.
prev_log_pos is stale there without the patch too: do_check_common()
does bpf_vlog_reset(&env->log, 0) after the previous function.
The two have to match to the byte, and a newline is all that is lost.
