Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757771;
	b=nOELsUVD3Yiv//hMYRfp29e4Bp+AXVZl4DxIlMPBJoZOuZRTL3qjLtCa44o8k0oC7K5O
	 QdJlgm1f+GjS6/6FJcW3vI65LJufNlX7zvdI6L+oo541K8u2pksq/qqLd5xN8JhastxWR
	 QqM0qLYtbCEE0OGS2plQi+Vev7RUhr5uirPNgT6nK3ztsGEZmhtFBD8LTJYXHDQIQPCCF
	 wGbmqi95D8nLAJSHCnto7pdS2PaM9rQWNbUHmqPJkOjo5AYDT74/gNVKhU9nB/tC8hthH
	 eXstR1/sLGvsNXsWQaWs10aszyX8lIjh1oerKZqPvskcTbsitqsriB+JXy5qs+Wh2Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kFh0Z1KuZG/8Oqoz/diU9BAvZ1qwniasMufdEjvQJAk=;
	b=1xG8Xc9eByNIAAhSScBPKgPrhK7aLIuV9/Mw8GlqwLKutYSd4b1NqUsDK7+J1N4sAdWi
	 GH/QuoN9AI2g+hhFYPgLGm2OdNgO+bleynp7duAEJdJL0bPsYLMCgbakOTF9oIXTEe7jW
	 yg+fa89TqOKzfs7okoVRb7RSJKVS5X5szA0nhkr78ZH7B2EgbjPeP5WbVbYMQWU45FaG9
	 0Fk5QxjLq60NLx1DcnlUKCYioO59s6XqAucdCWSCnbIjuYLKzwoLhfyXwGszF42pByesJ
	 xefVoAXNWypmvTfPKKgh7axX05XVWGBF4U1N9RyFGDeqhYsNniblgCiPxNWsJsDb9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XD1UiVc3;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA71606A328
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 02:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA71606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XD1UiVc3
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so87645a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 18:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793757770; x=1794362570; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFh0Z1KuZG/8Oqoz/diU9BAvZ1qwniasMufdEjvQJAk=;
        b=XD1UiVc3E3RArBDoLvM15ys6UBMjumzXrLfBkmAFMsIgW72jHzETrHLpIRCABNXCPa
         6kxkq8HdPWrruO0BU7fWkGeDW1lpVq22bxr75Vd/RWYj+LQ/DKynP9DB0CMilx/Kj3DI
         erV/Y9G4zqNPOcrMHIzWHzOU1OkFqpdr4z0Ik3xSho7OXMwn9pVyqy4uNsmUEV73wG2S
         p/SHq3ccMx4pwJ8auR6QAYTFJtU85YORYiqIL/xyQ4b3yOEG3P6qqVo2b3tM65RJ6/vF
         04laeaAbOGmuPIttcbq5KR02JLiKcVEecLJ2J28mzSdbz58CBR6QcMy8H9L4gTM3SpgY
         D0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757770; x=1794362570;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFh0Z1KuZG/8Oqoz/diU9BAvZ1qwniasMufdEjvQJAk=;
        b=CxQwTwQhvi0b/6wp0nE3LJ8ysOhIydhdDeP4uomVg+sqoxzDjn6aiPDPO/+EAoQ8xo
         07UVPaRqXoTjl+iGUJ4ddZN1TUNP7vQLbG23Crjb28oTKkRTQ3HYXVEhhVecnUwCdAmJ
         dtBOAQe8hx5H2lodsvutVu3fcfjMBGdBfLeEZepKmmWf8kP6Ft+RmnioJhbWmBnzEX7S
         x3bxfqXdrOK541nS2p3pHg2NishtJ30fIxXxz9rGbVZOTJo5jAZRJruvYb1Cx/+lo3i0
         piS5DPF0s22x+Rv71AmN75Zy3ssbjSdR7+M0X6OrA1FsploGV5oNOFqUtU9uRYuMPHfW
         GSQg==
X-Gm-Message-State: APuU4Z/l+AgGCU2vAWiGNLrEW3liKJOF3t8ai2aKr/H8AyIfVAgLkAPh
	njF15bS+uBpctnzhY6vplaNbx3awVtXVFCnIWIwoCDCkiKgD6wYNf0Sv51/0Rg==
X-Gm-Gg: AYBFou03/u4ZNrW6Ay9805BpuONJm2FR1ctjMteHUqrFWO2DNHRnJmrTYgu00je7yFf
	SJWWENNJaLxaJZn/dxgFygD5Riyb/kn/JjVFfahm57zU1WcoXVXaAhcCfPmOOOLPXtJIem1H93k
	NSwogp1SBPEPOYPeen9+4PHx+qlF1+lzJBc+7WFj+eZ8WFa22+uC46FAEPOkg+cJqLO9YRgDj3t
	J0o75AjOL+3/bsRymbmVlwrNjm6Af6ruo47Igw4eIbkXM0QkayizeNUmT6cXf7yOjO3hqTCzQxp
	Wqgts6bi4u7abhvd+HsXaCTQpjAKWR7bwLkEEm+9pcxfypWrCsxiHxDehSWQ0r2qYnMrUUYP40B
	4TCH8r6dxiIucI8lCtIa1iV28lJe9dK9SykQoD86cF4QNUSnPKeNuFR7Efa583+zoSO63DmUce/
	aku7OQRyh8+20+nhq/GWppO0cNB+npLo0Z7TFV+jrfXBq3ifCRn9/lhn4WMFVQyT9TMGHOx6OH+
	wuIdt+s4KusGs1dx0yf7vYZYCnWLimmIhED1eV6y9ZTj9hXqcWPPCKqjo1Xrth9Vbi5QTqRwwdx
	Da5tsaisj5g1IeZX2PifZMOH5IcUUJAumAqIRf5YYUl4jXKz+V7puCweYgTTVI/florCrb+z8ae
	c3hInlgJ9GNkU7RtMr/XS3eY/K8cBRi2l3Q==
X-Received: by 2002:a17:90b:2b47:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae897a5c58mr12241966a91.46.1793757769887;
        Tue, 03 Nov 2026 18:02:49 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm435986a91.3.2026.11.03.18.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:02:49 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:02:48 +0000
Message-Id: <DMM226XFK9P5.265MSTVAV5QPL@gmail.com>
Subject: Re: [PATCH bpf-next v3 06/14] libbpf: Relocate pointers that are
 stored in arena
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>,
 <roman.gushchin@linux.dev>
In-Reply-To: <sashiko-outbox-196376@kernel.org>
References: <20261104012401.1354861-1-alexei.starovoitov@gmail.com> <20261104012401.1354861-7-alexei.starovoitov@gmail.com> <sashiko-outbox-196376@kernel.org>
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

On Tue, Nov 03, 2026 at 05:44 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	ptrs = libbpf_reallocarray(NULL, nrels, sizeof(*ptrs));
>> +	if (!ptrs)
>> +		return -ENOMEM;
>> +	obj->arena_ptrs = ptrs;

[...]

> 1. If multiple SEC_RELO sections target arena_data_shndx, the second call
> overwrites obj->arena_ptrs (leaking the prior allocation) and allocates only
> nrels entries, while obj->arena_ptr_cnt holds the sum across both calls. When
> bpf_object__create_maps() -> relocate_arena_ptrs() later runs:

Not a bug. Only a hand-made ELF has two SHT_REL sections for one section.
clang emits one for .addr_space.1, and the static linker merges them by
name in linker_append_elf_relos().

> 2. If an empty .rel.addr_space.1 section has sh_size == 0 (nrels == 0),
> libbpf_reallocarray(NULL, 0, sizeof(*ptrs)) calls realloc(NULL, 0), which may
> return NULL and cause bpf_object__collect_arena_relos() to return -ENOMEM.

No. Nothing emits an empty SHT_REL section.
glibc returns a pointer for realloc(NULL, 0). Where it's NULL the open of
such a file fails, and that's fine.

I'm replying to a bot hoping that Roman will teach it to learn from maintainers
and stop reporting such bugs in libbpf where input is trusted.

