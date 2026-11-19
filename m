Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052707;
	b=J/0NVObnVJklxMTQmDLBjZ9ky9FfCtQEnrM/kyeNC1YTPk6vA95A423K6h33q/g3830W
	 vorBQaUS4lQkscgajfjjICi6X/vOiioEYbOac94UfURQWOvcYNFMX87FktlLzctTHXEL5
	 GxYx3GN9YUKeTebTb1wp6j8b0YhGcRDA/VEakorWrrvfc/8ASBsnyKvgVoUj6f8Um9sxo
	 pSn+1YanDz4+edNzhTbAAL9PPhaejsL6+SeANyaFjJnp6bvzamru3vKltu13ua6mPFRUm
	 FJrQz23SFWUfInIIUGBWlZgjrCNhMHIJ7pzhmC0cn4FDVnj/plgtz/+II8lhRgv1WLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tsSPte2OHRCCjjgAaKFsJbmdFYgco+qIPW3i7HnbLCI=;
	b=UP4nEdUH2FLt99f2mnVPtJBeVoHC5Evd6sQYFm8Pol4oX5ARNRpDvITgYNcu2Vc8X6fg
	 nyplhzfIXcNJWV0Kyh2QkmpNVTs7O41E5kdJ1zzfZoCPdxSKKHgfkxXoth5c7K5A8LN64
	 dJdXW+mBsV95KJOpeDsekkvT5ykGcpz3RpzbnfT9GJdhBha9AfTTIqayNcdisUXo058T5
	 vsh4owvIp+eqI4h6NQxrQ1mX+YdSg2FyFy7ZMpyxkIhx/4o1r/KnQEmNUDBX1jSeITfCV
	 RW9A2uBbnnfOwdd4msNLul6ytPl2N8tZn82vScLtx87tH0donFPgLnd8qydQWi5BbFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wx+1MUZy;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B5606A32F
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 01:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207B5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wx+1MUZy
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so1210541b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 17:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052706; x=1795657506; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsSPte2OHRCCjjgAaKFsJbmdFYgco+qIPW3i7HnbLCI=;
        b=wx+1MUZyWGFdM/UuGXIyCbxe22A1Qmh8nvfzek4pg8uLCVxrYf0jxNkG+F3idhEAGe
         jVEnXPgQVr+Gjpqv0fFVR0W4Qlt1Seug6Tp/RU/I+D6vAmTs9WoypG2mt1CWlWRwT0hz
         XLJP24WCuj3vvSvXIfn1/Tr9xCXTF1dSJ+OFjBBUy5Zivz15xd1ci9cx+PMaIaPbrVR/
         1A3w/okWaxEOtKMYRiphU0tRdobgKjmsfz3NJmjRmGFdS4bpOW3UtseYN3zslx+Q2NMh
         5HVX/JcEb/Yi4cb+by9adioPd25IXex+0RRdSI+O5NYlR9ccvY2QU0mtv9v7JKQkn7Be
         E8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052706; x=1795657506;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsSPte2OHRCCjjgAaKFsJbmdFYgco+qIPW3i7HnbLCI=;
        b=PBxPAen4kyFdDBIn5rUQJgdeSm4YO8FqkLhYzcHF5nOWEvZcjye1UMDRAUUC5zJiqg
         GNb6s4w6isfdwiKB6uKSVJerOvBZ94nADDm8QBV8zJLxX+1zr2tv+PtKKNoLoKdHpJQX
         ChneCQiA9vIlCcY8MHmQFotSrL68hIAf1oT8/j1qPcswkPBGA+NW7+LJT/B6g1G99UY1
         OrWVMa4wryxknirh/UwE5Anbu6K9Mo+Gn65Gboc/ASV60YUFHcjrgqcrTmqhJpk2NI28
         jUxT/KLHAnndtDg6WlZ5fmA42fiQ+D5MbAu/ZW9HxUkdT53kAm2CU3jebsbXGEfuNv7N
         ldzQ==
X-Gm-Message-State: APuU4Z8P4+ofqhtI1xKG/W4iufD41ejiSPt2pvaJUj9988Twa5uiCj2u
	IBI6dwdBqMPDL1jH4zB4EUxEPWeehF9PC49ENXg0INghxW4CnRvwbYRRd86BHw==
X-Gm-Gg: AYBFou3zXXq+L2l1/mjJsRNCHcPbKMs6J0jrabg1GDwbHBWO3d2WQprC8VhlBqlCD/9
	m99a4qj4yd1AfhAuAXQjlTAeNfbUItJn2O2vSPaMblMNn0OETrobIetr+X4Ajxs4v3A3vJt/y9f
	/GQw5k+fww18JsYYc/kI+2VA0xCPDWyvZkTktfiiA+yY5gmR1J0ki3evamIYD79E69+l0Ok5e4l
	ANY6dS2fHy/FmKm7tzz0tJT5IV8C7eruE6lgYQFIK7NJN45O0u6NRznxXRmmVhIeJMpfWHWidBi
	jerMtZiee1UTaIUta2r5ZYoUI2nEiUNvBK8j7RROhHQv2X0u/0nDtz/lK8C8THKBfheoaosgnyo
	XNC5vAoCCHXznBd/j1cD7fGwbw7nygIER28BFM58Ey74D9TKze6uYXaYbneexjNsHUVzTkgnwMO
	ALrTs/l12yy+ADbE/1wvLnKTFsWo9CQH2BFO5aKekiDhvqjU0QYPtEtW3hF+NMJ/ET+aMgwvrHs
	5fzuZjy3unLOjbjjuXONNCNVmeI3RvOJjk/BPZMn3KbN/kGoa7ImorjQb+XJca132XTVtvZD69Y
	h6RRTxzzw2XR9EuslBOH5AhgI6fQO12ow2Aif49afDApSK2iVEYT43XOinqNn0apewkB3ByQ/rj
	4p1g+TXAdseW1/5rngBv0dQk/7i/Eo8bEnw==
X-Received: by 2002:a05:6a21:8203:b0:3de:456a:6e07 with SMTP id adf61e73a8af0-3fe8a519514mr5262258637.46.1795052706175;
        Wed, 18 Nov 2026 17:45:06 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad86d9fsm1940114b3a.27.2026.11.18.17.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:45:05 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:45:05 +0000
Message-Id: <DMYT2SQGVA4C.2B8FUKCDOZZV3@gmail.com>
Subject: Re: [PATCH bpf-next 3/5] bpf: Remove BPF_MAX_TRAMP_LINKS
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-222288@kernel.org>
References: <20261119012909.3657417-1-alexei.starovoitov@gmail.com> <20261119012909.3657417-4-alexei.starovoitov@gmail.com> <sashiko-outbox-222288@kernel.org>
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

On Wed, Nov 18, 2026 at 05:39 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
> This problem wasn't introduced by this patch, but can
> bpf_trampoline_add_prog() leave a dangling node on prog_list when
> fsession_exit() fails [1]?

> If a BPF_TRAMP_FSESSION program is attached with a link type other than
> BPF_LINK_TYPE_TRACING or BPF_LINK_TYPE_TRACING_MULTI, fsession_exit()
> returns NULL and bpf_trampoline_add_prog() returns -EINVAL without

Not a bug. There is no such link.
bpf_tracing_prog_attach() always inits BPF_LINK_TYPE_TRACING.
bpf_tracing_multi_attach() always inits BPF_LINK_TYPE_TRACING_MULTI.
The only other caller is the cgroup shim and its prog is BPF_LSM_MAC.
