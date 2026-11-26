Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689556;
	b=LDq2QkzXiy03EDi7s9ys7VGMK3T+ZasL0IF67z4Wko2KrR7RWrERPl628flZ/+Cwq5yD
	 p/yb+s3zZb5yncavU1QyNIYZ3sFBH2Nwo9iDzLDKhuMVQUam7BkaabnRcmW3ljhedSpgO
	 q5S1abi7hHNggDbdLR8uFl7+tFT430SRgQHeHnrYZBLpL7OdKZtfx7FBf1sVbOCgw1QhQ
	 qxvSKzes7HIqAzNmmmMOljtiGptgNXMMyru5ncA0O510834QSJEmTgnG3mMALYbe+D8/+
	 mpZG+g376z5n0e84XTFnzAjsgbIrFaYRaiat/sEbuWGLBHGX7HMb17bl7TCSgigaICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=y97/jaewEHbT2OW6StbmLAd/jwpSWkq1Rhi9mBatr9c=;
	b=QjqkOdPlx7IDObheiVEEUMGX0iA6mphVtWF4e50QeZwFQ0Lh0rJICvGCfYtE4WpJGtYS
	 qV3+U03n0sPnJJmugpd13xquWfOIgqbNmKHVKWReuDbPVYxS0yV6/4W3WCxbU0bb9cVLh
	 9f8/AIZfgXXY/6rDY9YlSybLRgV5FvEbGbZLnv71XMR2Ef/BgmGyOHNLtRwms2U7Z1ls0
	 Sr1rhUBU6RYbcGRt0g3mRxApY/DFM777Sx88MkUc8sv2VQOxDTdjzVxxolRH8Gv10iUiS
	 Xdt3TkI3uwNx3l/n7iHAfa9fhOgZkKzG/oRvrtBm+CJ/E6NXI39RhSKUmfjwGKOSFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvjrIAs4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E58606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 10:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvjrIAs4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so56898035e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689554; x=1796294354; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y97/jaewEHbT2OW6StbmLAd/jwpSWkq1Rhi9mBatr9c=;
        b=BvjrIAs4hmz8gc5tx9QWwMIMNvWWS00NrwQIqYRpthlbuGIhti61Nep1HWQSxvlMKx
         47qrqXhMsjDReAxvlzrwxc7Ec8Lq4cqmoLOzHKLG2zmppHkSbqVOh5gMfHYrHmYKaOSK
         SScRbL0/FXHxZPiZg6tc7H1JB9BA4xM2pjdGs2leyB8gohJseRuY11zRq+CwRWcW/aYH
         47azK4/AzEF+IE4ygFgyU50K8M6SRH0zhN8PZ5Zub9wW6oV/4K80WSCXB/VelkJ2cCsC
         OIFqb6TJOP/aJ42eh69OfrzycGFmOMSYLOI55AbQS24Y7QSfYPSckO9pouhKf8h7l814
         oqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689554; x=1796294354;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y97/jaewEHbT2OW6StbmLAd/jwpSWkq1Rhi9mBatr9c=;
        b=b+lRDCazyPHKW8ldq0AA3bUtUdPHkmJ+ysOWtxVOR8vj9F3EQKi+/8z1EdiLG4eAXH
         j7tLA5yvjTEDxFblk9P36/AWgbP5hrlu7gkK3hV3+/FVQaxutLUqMXl0Rdq2L4fvXOad
         +dC2SPu1hKxljodtn7bm/68mrJbO/Qddj/Rr3rZ40Z0U45YoD3dpw4hr6waN6iXipB7j
         5WThkExIdC7naWCTskzzvXN0xJfc5fx+KE3EQIc1aip+mX6KSvburUJNoe+nS8z/JJe8
         BdCc2zIRPJMV8eqpEbADStiMclrbeqN1e5ud+QlSYvPugPuGpbiQ5yz+BlwruLvgeWU2
         6mwQ==
X-Gm-Message-State: APuU4Z8I9GkRz7TMZDehg9+ZsU9s4ag96Sxuceo8V5hIsw8qBpkjkamH
	aOQoLKafwFTV++fPzj5vkoVLVBTSTKi+tyLMVLN5m36dAg/TZywWGUEoRHcD2g==
X-Gm-Gg: AZFdTZdMaTSTIbCdYn91RPmaKnCBvRPoV+1S8TYUoM8WrfI7xBVD0mFhW715XVVaf81
	MNOhbgiUaOAt/XwEf5p/IBOe1IB092Vj7Vk//9zHm1Pbj3pncefge8D82B1qE7FUPiVGjkb3eQ1
	JKFXi901DX0MG7EsUt2eb07aaLnKHAwqen61oiU8BuUsbj7zzi4RplDeDW4GNrHHT2oJFprJvIA
	gNLmBpFQ51wc1kS5nb8mXtcks3EecNrhqm+9deVpevJNWnHQenJ9t2yFh38byTKxpU+LKhCd3TR
	Mn2KuzbjFskpj3Pt0aTFDDCWqbPus8GX1hZQ5OoyJh+M8T0e91P9Jx/iil7zgCJ+xnsISaJd8YU
	Cd+bcCKkxkudUURb7lYsLwot+Cb5QqxpmRv2BUlhSU/NxGkoyw5fysd4MlTqQD0TzOh8unjOUal
	hUpIgjq7xTi93QKlbteS1oreDhQ7kDazXLlsN5neM2aDLN1Ow/z/6nEd4J2UL6l9E+yGLTzbvQw
	oCt58KsC09/GZmTedhcazBntuZ/FYzJ8ecR2/XxD7qZFwdOj9Ll044VEAtR4Pn24MJVSWg3FZ/v
	S1OXuwQ/1XTMnQIvnV3NyJ50rb8kUZptTuKjeA==
X-Received: by 2002:a05:600c:8905:b0:4bb:6816:127c with SMTP id 5b1f17b1804b1-4bb861468cdmr394543635e9.8.1795689553958;
        Thu, 26 Nov 2026 02:39:13 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm40021061f8f.41.2026.11.26.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:39:13 -0800 (PST)
Date: Thu, 26 Nov 2026 10:50:50 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 1/5] resolve_btfids: Do not tag functions
 which work on BPF objects
Message-ID: <awgPCnuRzevgb60e@mail.gmail.com>
References: <20261125212849.868523-1-a.s.protopopov@gmail.com>
 <20261125212849.868523-2-a.s.protopopov@gmail.com>
 <sashiko-outbox-234173@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-234173@kernel.org>

On 26/11/25 09:25PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] resolve_btfids: missing Fixes trailer for fmodret_tag() BPF type
>   exclusion
> --
> 
> commit 36940d1b337a769c63009cfc2b22cfd69fcc61f9
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> > resolve_btfids: Do not tag functions which work on BPF objects
> >
> > A program on tracing_iter_filter() which returns -EACCES makes the
> > verifier miss that a global subprog throws. A function which takes or
> > returns a bpf_* or btf_* type, or struct btf, works for BPF itself:
> > for the verifier, a link or a map. Do not tag it.
> >
> > __sys_bpf() loses its tag. A program can still deny a bpf command on
> > the syscall, which is on the error injection list, or on a
> > security_bpf*() hook.
> >
> > Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> [Severity: Low]
> This fixes a bug in the automatic fmod_ret tagging where internal BPF
> functions were left modifiable.  Should this include:
> 
>   Fixes: 4dd950adacad ("resolve_btfids: Tag the functions that return errors")

I didn't add any tags because I consider this as a follow up.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125212849.868523-1-a.s.protopopov@gmail.com?part=1
