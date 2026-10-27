Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131780;
	b=PR+VcS0w9dCJSVUzlypeo1FAnVW7fCN7cnXxlICb66VvH/DmVuVHs0vWxylt0407KwZb
	 mjoABw7oexjKtM3AUnkJx1GlhI0+duKwkuEiHxyzlvEIAaMKrxQjuS824J2KjPxyl6dWT
	 FyS23Sdi1VAcLtKmKAQMza/z+jElgnibYGrL10Sarf5LxoBy18hQfO1dEGbjb1J8Xizhk
	 00oRLDLOqhlXW27c2iaWAdac+Q5wgPC5KuHzv9gF83VFa7x0ScURhOP/tz/RY9mf2rHHT
	 lnzHCXFU/l3rv9QI/kP5ADRIpVPMbsF9/EqsX1B2H17sbffO6ZAVk0CNxzov7gdtaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/P2TITrzXa/dPGDQewBh/P5JTe2uDqJxgBUDeRvmS0Y=;
	b=2DqpnrZ985b7WM5VKz75B83g0+K3nnxV3Da8/ybTIDeQ9pKSz5RXCFkoCz/t5YaLHIgR
	 seEOlxYDuRadbaEiou6g1it0zeohlNcpyaIak4ubVJvV2Mj5+Fdkr2qjmV+FGEgg9kr4K
	 FLqbTRJUg7Hg34MkehWIMP/ni6rJtjjDBKdWRYjDFNfSY2Nf4skg4//RtLDYuF4ZKXPmG
	 Y6bQFizn0/wGxgm1Ymt7mmWezWdSVtnaBGW16p+IphqAsHUQRRkHwMlgdOcs1136M6AsR
	 F0Z9Hz+xLVzhUP2aanvkAn1/qaQgcnS8/bZjRDMSwmjUKnHRyxDiWP/wnoG1dWtEvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9BHK3Ak;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A454606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A454606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y9BHK3Ak
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so244797b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131779; x=1793736579; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P2TITrzXa/dPGDQewBh/P5JTe2uDqJxgBUDeRvmS0Y=;
        b=Y9BHK3AkL+QQKdk3QIvUIttrMv6J0rsUOAgr+VLuvEtFP5tYT228sEP8fJo7KS30WY
         rPO0V8Fvk/gpXOyAKLRud6BMs6OLuNqefPivtKE6NeFQ0Wa0AfBggqL0I7yiVE9tWIFU
         /XxI60Six1wvvc4TFFK1NdQkDzJshDYzJQNMpkVn7hNilxvQH+1iqSv4jcZyogO9pUii
         gD5pgIJXPdcFPNPxf6KK6ecHVKwPSAl+f5i4UF0PHvtqUquPgPRuKXo45N3xAWprLBE7
         hQgEoe21B3AHb+xMdTNuaaG5OfBYViLeTNDgoLCWXxvMJ/AdnOYP7d3+HG6rHXlM3O4Q
         77Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131779; x=1793736579;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P2TITrzXa/dPGDQewBh/P5JTe2uDqJxgBUDeRvmS0Y=;
        b=DNFALFq93UiDDWE8KNOU4GwUh515c+nXvC0Mia/mvTG4rtc/F3uPFJyp0kAV8mA63r
         gdyoqZcOQtvrPtJlnkaXLGSKC2QOQuOj1oMmabyT1KzNe4YUzkpYb9IkRaKt5WRTNLTB
         HyqI/aRH21DEzzCpw0tWs565KHmLARqBgFdS3Dm4+zyrI6tv5mGDRpeR/t3qPvOQf8LI
         9Ef9pA30TUxnpWcG869DFYqRzFINHbFNSDKTkxF5R+ERT0O5ovQaC4Cac88fciyYizcr
         c/fKq5Nl8/ofaB7rq0zIg0J35a9mEYNHXcNP7QT4w8I30o0r+/iuz+829fFAM9jcZvic
         xFKg==
X-Gm-Message-State: AFq9FYJc2qEXtHYijUelSoeNRxxjap6aP1Tw0lRK3GvvYoJcAZGSxYnQ
	4PboBBfL9bjXtL/81ZXcPCZlSSlHu+lZASVVL6tX9cxud2wZ85QceldcnHUFkw==
X-Gm-Gg: AYBFou2LZ1+LjiE5rvVCCGyWFu1CzUzrH7jQlLSvDMwoI35yhTIWZ57IClMZUTPvvmF
	XzI4i/ex8pGZ0LubYGgOsMpHyfHzPgPPixxsdrZ52PHZyDJmTnAwdgIiJWZ8iMsn80l4S97aMdo
	TDjHe95KJfGoo+iK6c+lDWhrV7bkBO9E9MwHSUVPAaLdaNuPAhYJM1SoIwPL02ht4QOLGHLRXrH
	48+ZPz72JlQXRTRKmytj/P0cNFE8dkavgmiUbQ6STHhuv8p0jvcgcQ4ql0vsnsrj2fiJCkK5h/r
	wB1L6WzYg6Humd1i/Fwe3cy+7UfcFeQTTM7h3vZEIOMBkQ5i0XZFR4ukNX/Vm8KH6vZbBp7Zdgc
	pdTGGFeiHTK89oAS8IPExtUuk287y2ncDhX7JKDXCGWgvy82bsniIF2l6YI5AvKsLq6LboDDAMm
	wW5+jAudIZ4awXCKN/VlI0DJIxzL7jQdjZXkXLJef4QxDJVVcNo9ldUrDdJBVXM6nlSvEsWWsBc
	pDYMTJK8P2z1qUVQ8ThORAiMzV6pv0HCm05/Ux9Vgsq4oreNxvMThKpfEz3FTje0uMfZoebg0Ci
	j4MetJmx+06Dq7jSl57OKZGnYM9s1Dc8vYsPSPugm0RurIQz/xF22waMY9XTJIA1xoIH01NWg25
	i18pmwkSOAsI5xnUfzlMk+76mBKpURU7ZpQ==
X-Received: by 2002:a05:6a00:a83:b0:886:9187:1a00 with SMTP id d2e1a72fcca58-8a6e8887c5amr242962b3a.59.1793131779263;
        Tue, 27 Oct 2026 13:09:39 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfa0e7sm440601b3a.36.2026.10.27.13.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:09:38 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 20:09:38 +0000
Message-Id: <DMFW5YZ93QUU.1AGG5BSIGD0JW@gmail.com>
Subject: Re: [PATCH v2 bpf 14/19] bpf: Reset the range of a packet pointer
 that scalar evolution clamps
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-187068@kernel.org>
References: <20261027190314.1440199-1-alexei.starovoitov@gmail.com> <20261027190314.1440199-15-alexei.starovoitov@gmail.com> <sashiko-outbox-187068@kernel.org>
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

On Tue, Oct 27, 2026 at 12:30 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		if (type_is_pkt_pointer(reg->type))
>> +			reg->range = max(entry_reg->range, 0);
>
> [Severity: Medium]
> Should bpf_widen_scev_regs() also clamp reg->range with max(reg->range, 0)
> when widening a packet pointer at loop entry?

[...]

> If the loop has a negative slope that moves the pointer backwards into the
> packet on subsequent iterations, is_pkt_ptr_branch_taken() in
> kernel/bpf/verifier.c will still fold pkt_end comparisons on the widened
> register using the stale negative range marker.
>
> In addition, when the backedge reaches the loop header, bpf_clamp_scev_regs()
> sets rcur->range to 0 via max(entry_reg->range, 0) while the widened header
> state still has rold->range < 0, causing regsafe() in kernel/bpf/states.c to
> reject state pruning at the loop header:

Not a bug.
The negative range is correct in the first iteration. The next iterations
come from the clamp with range 0. regsafe() doesn't prune 0 against -2,
so the verifier verifies the loop again with range 0 and takes both
branches of the compare.
The cost is one more pass over the loop. It's the same before this patch:
adjust_ptr_min_max_vals() clears a negative range in r6 -= 8.

>>  		err = bpf_set_reg_range(env, reg, bounds.r64, bounds.r32,
>>  					bounds.base, bounds.step);
>
> [Severity: Critical]
> Can preserving entry_reg->range across bpf_set_reg_range() here (and in
> bpf_widen_scev_regs()) allow out-of-bounds packet reads and writes past
> pkt_end when bounds.step tightens reg_umax(reg)?

[...]

> Here bounds.step becomes 8. Calling bpf_set_reg_range() -> reg_bounds_sync()
> -> __update_bounds_from_step() -> cnum64_intersect_linear() then rounds
> reg_umax(reg) down from 58 to 56 while reg->range remains 58 (and similarly
> rounds [0, 50] down to [0, 48] with range = 50 for a negative slope r6 -= 8).

yeah. It's an old bug, not from this patch.
bpf_widen_scev_regs() has it since commit 6ccf49f79327: it keeps the range
and lowers umax in the same way. The clamp is not necessary to hit it.

I have a fix ready and will send in follow up after this lands.
