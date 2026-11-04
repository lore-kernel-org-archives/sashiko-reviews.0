Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754377;
	b=YphWeL7qZswWzLYbQVE59Vp0EOIk8rfsCOxC6FOFD7nh1iCcYu74Mh6p23K9mgaaZQhV
	 vipVmsopPQ8ekGazCpfwWrkFilFGo1lqQhVet7w/KTkta0sW6QdWTrBl2nDdrok1kT0AL
	 CZB4IcmOolsJDNSCxLTMWFPLcVmEbTxuBaY8gY0UBHNh37ukdAfCCh8HMfOXIXBqMJDEL
	 AQK/2WyS2iUkGxUf0qLs8El6+DKIUJe3gA3tD04yRt60naNPqu9UEa6tCCjLbEmSrdbcg
	 HNWpYQjuUn1NSVwG62vk3wcWgDaIRYJlIDVAt+wQ27ge2sg9c2zwAjz3QAY4wU9fx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e/ZOJR6zfCMRRFgaVH1u8A2/xnBqnirZbIxroagefr4=;
	b=q+/XfenDuEW0O2vk/gAAKanotqUjjACaidS8vTxEc9Vl/1Ho+Nh9XiPhjjBo8x43le61
	 zNJyYt8aXpZhn92gwxiVq94lRe8BoYdpLjqm+KwjQ3EtIG6/iKkRd/3fF5/ABagkfGEkn
	 doVdn69PiUtK0vLRB6wq9VlOY82pvb995wSL3Fw85LQv4FfH5yCYzZL8Ek0nVP6nLddwK
	 he0ON9CL6aZ7SX9fwYU1kW3Wnw9btjN/wT3RC3cjolhvvjDj/fEsUYciAyzpdseIjVXXd
	 nLHSh4x/FhPgF2dPFqWFu8OdQp8pJzdUhtldF7TLajuXCNSyiPTOKrSMH0ABgcUB6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHDI4kFe;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362FB606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 01:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHDI4kFe
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso85314a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754376; x=1794359176; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ZOJR6zfCMRRFgaVH1u8A2/xnBqnirZbIxroagefr4=;
        b=nHDI4kFeE/eTHDB53QnmvFjPKirznRizSSkVfyiZnBqgB78JHQ394kk0D7R16lIQM7
         aJdPgqdctBAbQsEOCX7/VHnairaasJw0I2brppvntuMJDReK+2oALMXJ7cWfzuA/iHeg
         r+QBYeL0A4oDwq37Vi9ZietQgoWz4Xaze1wJCyD2kqoyS83g1zxYN/KxKRmWmy5QKDL3
         Zgu4vSqs3kQrS9IObM7xLrTAskHPhrhNfGs4ncZ6I9fY4lw3u3W6q4OtAqtlGm28yMEp
         h/hBCP/3y49dbQrvfs8kavh2PclZDWxY4RdJhee7T5t9Te+POsrn3N8xrjwicTjAROy7
         ZTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754376; x=1794359176;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ZOJR6zfCMRRFgaVH1u8A2/xnBqnirZbIxroagefr4=;
        b=PnTvb+ropFxgj5dSn8yYolIwT68PLqEX4XpyxoD+AT3Q5le4rq+4ZISvoc3slybFQT
         k08nvRD3vvMm0NDr8rGN8V+gNPqNaUDWMMUuVOVXYiwCctrKdIxTXujhPbImjq42JYlM
         GiFulF6Wy+351RwcGi1x8csWKSr7CqmpwfBEncpiyIQR5F4VxEo4dyM5ldmUsYn/XTsb
         poVHLsEfZo+Dpj9sfNamIg+spFxbP6tLvU29uv1EmM4uqb/wZfU02/DmCxVw2GDHL5Tx
         IE+ZPkDc/ajzxW6yrnPzgGojv1B9WOlET9E4sALaFgYlsiayPgboLnjCblVFiz+VAROp
         C5xg==
X-Gm-Message-State: APuU4Z9YR9KltHczIRwakJKi/+o5ry0tinHjVg6Dsy57C5siotWaQs/v
	RYBdbFti8zQpWiC7sR4vLuxPSPqkJS98UNE2qqq8DeaRIyT5CFRpjw30dEphSQ==
X-Gm-Gg: AYBFou0SRaL1BlotwcGahhZ6C3yO67xWCUoje+b71p/lFC0ozqCH49NsPSdpTsnX7ks
	OtMM4Kr1IPtYARQzR3zGkU4k7CcVqmP0fnSZsKBTNBcfzs2zA5IkZT5rY8N54MGHr7nY19BhtDA
	W3lbtljCK4msIoYvCf0kdJf8QIhrmLlPh7MkVP0fupe83r7W2prI156sdAiZ0xC8es7Kk5+mNpa
	3PmSsETbEGc14F1SaFeLVLaocI4twCA5L5ZiIY7ZzSsvLWa/ombERjTqon68Ryxv8vlEzRjj6rh
	P2gglKn3TtaOFt+Zcn8Xk5O9Uqx3jmbqFGRiv3/MLI/qTTZJIEyRtQaPeM6OBImFdlwFC8ag+jc
	8MwtdltxpodMcfys0TaD8LrGBQabJrePPE0fWiY9qu+OVv9Ds3OXgxtas2lNL84F78ZA1sbm+0Y
	3UbhgUKDLvvVauOHNhdeMhxaYXVwGANJUfTuUZoYLjsCHy+QObu4dY+RfGWjIUCh47qhQHhvZVH
	JCiTBokiWVWlbWLuCSOAvdgdmAik2GbGgg016lUdnUeRzu7oyRwAoqX7dCmSuscfiE+OqvALt80
	pnV1rwgdZSAHfp/vNojHDm6Ly3BiQLhVFU7zdtourqzmfOqKDmkGzBjkWAbhjDG/VRg82VG+NdT
	Dot2ZdSE5PTeSgGPoiLr2YwagYyNoCDE0dQ==
X-Received: by 2002:a17:90b:3d8a:b0:3ab:9f89:e1b3 with SMTP id 98e67ed59e1d1-3ae89764eb6mr12121690a91.40.1793754376342;
        Tue, 03 Nov 2026 17:06:16 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09451c650sm621686a91.0.2026.11.03.17.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:06:15 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 01:06:15 +0000
Message-Id: <DMM0UW4OALM8.2AATFMTT6BYRV@gmail.com>
Subject: Re: [PATCH bpf-next 29/37] bpf: Count '!=' across 0 in 32 bits and
 loops that go down
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-196311@kernel.org>
References: <20261103234104.208239-1-alexei.starovoitov@gmail.com> <20261103234104.208239-30-alexei.starovoitov@gmail.com> <sashiko-outbox-196311@kernel.org>
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

On Tue, Nov 03, 2026 at 04:26 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	if ((op == BPF_JLT || op == BPF_JLE) && initial_val.ptr_reg < 0 &&
>> +	    (latch->jmp32 || latch->zext32 ?
>> +	     (s32)step_val.umin < 0 && initial_val.u32_min < bound_val.u32_max &&
>
> Should the comparison allow equality when op == BPF_JLE?

Not a bug. Such a loop has no count, as before the patch.
The verifier walks it one iteration at a time.

>> +		op = latch->op = BPF_JSGE;
>> +		bound_val = (struct scev_value){ .ptr_reg = -1 };
>> +		sign32 = true;
>> +	}
>
> Should counted.jmp32 also be set to latch->jmp32 || latch->zext32 when
> rewriting the latch to BPF_JSGE?

Not a bug. It's a limitation.
A 32-bit counter under a 64-bit jump has a count when the first value is
a constant. With a range there is no count, as before the patch.
false_until is too small there. That's the safe side: no count.

>>  	konst = scev_value_is_const(&initial_val) && scev_value_is_const(&bound_val);
>
> This sets min_header_count to max_header_count even when the original
> bound_val range includes values at or below initial_val that cause the loop
> to exit on the first iteration. It also forces mixed-width latches
> (!latch->zext32 && latch->jmp32) with non-zero upper 32 bits in initial_val
> onto the constant path where they are rejected.
>
> Should konst be evaluated before bound_val is overwritten?

No. Only the log at level 2 reads min_header_count.
The verifier uses max_header_count. It's an upper bound for every bound
in the range.
The mixed-width latch has no count with a constant bound either.
