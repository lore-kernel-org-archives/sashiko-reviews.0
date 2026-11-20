Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207258;
	b=Ul8PT/HZg4c6tJcm4DB0BQSxMDVzE2sk+vKrK8sTZDYZo0W/2847gkjzddkvkJdDljzf
	 ZZApev+FL8IGOcmb02uNSQ112RP15CFKCNBcQZ3eqpL6NMgxuSVEmCb5jOlzmqazljlzO
	 PrVlsMY/WI++K53E9LqowT8/hoVNowXI8jmQYRkK8j2Oo5owXvx7Ad1KMGschwVV9tZh8
	 eOd5LhirRGR11fQgaEhImSIF9f7uSe1qzA1LgmOOC052F9t1e8ULRtLsOa8vJTMb7VNVf
	 2WQNeAGT4OYUrtOktOc/wNef4281fsCyTI+xgXTYEWp5hRrR1+fvp5aZj+SPAmQEZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207258;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=PXzImmwMcDhGvn09GiQZkXuApv8MaadtSn2F4xSnzms=;
	b=yAH8Gxi/bTT1ii1+F4Aw9IVNkdPKisQzL2XwGX9rRfZ6Y68npDqIwf5frKeZi8tEWWXv
	 eBh5h67ZBIBMMFBvdRkce0DhFOWxDyzQu8pkdq36iNGfoN84oYsyQkunXOM2jmkyk+KYk
	 InMn+jbeEXbLnhmccyd/m4rBaDtCjMkzNXerz9IsWInYlKWZuxk9jj+J+ye3mKv4E2a2g
	 Dy20M0PUCQn5OmuC2t4OUOIyrKywUjs8puhD1MOO+LCJ6J+nYJdLz4w7zzLHlnwMJgkF5
	 iezVT5T8pFTE5MjMWLxF7WHwpv9tU5w+CeQ7MgWpH3sTasttiD9RI5tn8/oFKk81C9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1D606A6CE
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC1D606A6CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5363316fa0cso17059691cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207257; x=1795812057;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXzImmwMcDhGvn09GiQZkXuApv8MaadtSn2F4xSnzms=;
        b=b3+AvANfNXAQELLFzxSw4PZu/dCPgyKsOUaGzewxWNFkPgmmWOB3CpOwtUoPMt89f7
         LAyxpvvi15U5qEH+OccM2qeE2uS1geKBx/ZAHrlwLd/0YEyi50bhyCbcXNq5S+tO3LSU
         UFv9FMWrofZ3ASP+ce0DPJqfEvyx8+N+uQgZzlzzAHElFwcURgU4ltzGJjQ2eZImADKz
         9Zsbve+B9wt2JvXRNO+EFaz5ZpFLAQ6Nr7vH+rCK8cF32E78w6XQSSAjtLm+g3slRsTU
         +U5cbCjU/d58YP6W3mR5iBXzsMtPPTXIpq5igSWBy3CG9QHIIA1fbajPHlhOHNvQiHRo
         GFSA==
X-Gm-Message-State: APuU4Z/sg0tMqDy/QbBGyIDy9hChAIHXdtCwTdi9t0FcFabz3OgyorX2
	kzYvtn/rB/vSiGNDaIJ5eJGx8hDFBA7YGro/k3CiZU+RKJaGUlRfVMCCJ75wuQ==
X-Gm-Gg: AYBFou3ZhGxQ0N+9hrZYSSoiWpPKETw+CWD7yKOP4t53KtJBncBBDf35Vxrue9JPMCZ
	IaR6WmEGqbkFmpS7ZLCR8CtKNX/KhcBZiNK/CTekWnwM1SoA31/ODB9hPXLnHcnTDqwA5gTVugl
	Otn5HzhGlB6UdmA2HA747vAh/YZel3hy/cWsovKPH57WnIVNh7+2+vrewdr12Vrg+HgayErkPfZ
	+eMqotMne4VSmavmR6ZySKVuLNxcEicijU5+H/8p2Xz78g8kCP7noGf97fIngw33i9UnyJBFpZ/
	0dZysBvhg5ecyHB4Z9Zw9pDE8m/HN7Z3U49pFojIauxa5pfyX4jKYSyD015PJSVuZ9Gv2x5+nz4
	Ke2/ra4/CoUmiK8U6OGkbdcrZhvPNXDD6QRKcNaHkwDs0tQ2O2SvEFIC4B+1DcXj2RK/+16bbXe
	TMcrHZHvcxEQ3UmimC1/jnFFVph8M4RjgPFjjsO147ET5OlxNEFJkn+QP2L1vfIxKKb4t7ygMYf
	UpNXbuPea3VCwxGScl6o2Kw9ezc5QwCxKeAEopk4I5oRcL0YkzrLtXxrK1uWA86RpyFqu0mgxKe
	9qvsnJIjbS19KxAA64XHbOBzFoRbH53Pvae9VftGr0X5MkhO1wYpb1Hx/zTKJl5Ztbzo2CljqOc
	Z70nD7UIbbMxW94brHfOC0pvgZ7Ensf2VKfjpDx0YLtoGL5CL4lpU
X-Received: by 2002:a05:622a:a05:b0:536:6586:4f82 with SMTP id d75a77b69052e-55d768a4acamr74184941cf.7.1795207256790;
        Fri, 20 Nov 2026 12:40:56 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b79sm36079326d6.5.2026.11.20.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:40:56 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf 4/6] libbpf: ringbuf: Use compiler atomics
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711417.18576.12732381933688672041@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260614015923.3BC301F000E9@smtp.kernel.org>
References: <20260613-bpf-ringbuf-fixes-v1-4-e623481cb724@kernel.org> <20260614015923.3BC301F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> does this write to
> consumer_pos safely handle a 32-bit userspace application running on a
> 64-bit kernel?

No. That requires matching counter representations, loads, and stores
across both word sizes.
