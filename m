Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666499;
	b=vdCExbDZkzsMe7PieY0sqc5l2akBEa0BPzlh3WZZEj+qEBolZxqzChtR52Phfw3QnCC5
	 nuYGua7zpJkYjNqtXCUM1LoZguzea2ups//3i+nhwC1U/xkyvNe/yyrmNC+nMleEbB4ex
	 HHjOc5YjXxPmSj2IX4+HWAUkI60s63QUSQQotKFSoCr8uMLqTydg1nIkS8n9wi8vZasAY
	 htpnkH4jA2twQLMI8qCiaDSSt2jM6i+uQ6D1JUacUilIV99N9I8F31F+/Zfo3Wi4Ex62S
	 tRepOEpRHFFE6DyqmXKfEEYJfJyvHP0qwgPWTLDqRFwSvvyl/UhN74iQsnXiJlW1QpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
	b=qqgHZkJgxeB0ABisp1QKuYAnBk/mbXvumYLf//D6LnTgSVEHPehzRIJ+poRtXyvKcWoy
	 +UPmQ+dq2DbC1PAy4o1gJlUHs5k8kAiKh8ZndEsGp2ue0OCKBTnjxj3tJ0n2rP2nZUaeV
	 tOqRZGm/faXcVYI86U3thgPawe14ZwGPm83044sPpI3+ftQKEyNN3/dTw59M3fhomWiF7
	 rufgvtQUIxntJoZerw/GI6+6DViz2SCRhj+5XH43tfc5rHBZRtmvKmVvqxdG/bBrrW2/j
	 DW9VURBnQCxjl/mkKnX+p4OvFgTud3ekyqiJRUgV/E6lRJ7gwszW1W1QZAFzah3nqxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUsHIRoV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4B606A331
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 14:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F4B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUsHIRoV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22994675e9.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666497; x=1795271297; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
        b=tUsHIRoV6QYHDWf/EGBsgejNFGxtm6y9Y/vJZvNEr62LXkZiC22YfKPk9cKI0zemMu
         3FWQQkIrr7/Ige/R8KUWuYJcteZI8vM3LMC0om2WCPli4tBgy5Adqmk2pHUiBU8/VgJP
         Giw7BhQ6noRoHDlkAxQyzmxm820uLK2Duejt3x7V9egZhfqfrUu77RosCbxesObZiUME
         UPQWVTCITZoi/WwP6dTJgBOKebtPBuZ+zaQqysc7wPIOxnptm41v8whpv28eN94aE96k
         4fEitw9crdd83wx9T5pz5bB4gW4F4LEkxd99eR2hIy30298mMCoif1fJz2bXTskOisVx
         dTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666497; x=1795271297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
        b=g6AToN1HB/3NFTmealJRMT8AcwqYRZRwuSsu1YegXrDJoPfSthNn7isjyJ6HXyebWH
         48wFot1/4w9bMWwBgVC1WFoptsRsNh3wbnb7QBoEWKPtjNSIk1Ebwhp2LUDcgBjrpfFc
         t7P/kfXJ6trat51JoVTXI7SMjoPheVzE97BftUhSYKNn8snLNnhokE4XIMklx9fxg+/2
         5lYp4FDp7mmve44dnCTLZdjQMX7TzCL0GrF71HOI9dJL1uc3d3D/o3Eg9+zluEQEZRRe
         R5Y+AlM8N0RnlRXZlHWw8uX/G8kc2ypWaIuM0imm8hzonKnARPeXFfERLJi7s2EDL+mv
         F0Og==
X-Gm-Message-State: APuU4Z9tCNVU3r6Nxl083JnK8C5Zypif4sDGzRr6/FVHgXW425HSbnpP
	oKxZAMtIHYmWRXf24OzAbaH6F5iTyORsgVedM58w2YEyD7HdafBLcZ1H
X-Gm-Gg: AYBFou2ZjO+QFQ6Gudy1Vm4DHT1bHBdgksaJC9X2HVa1FwarTP2PhOazzT27SWgrtZj
	BYLiKAsl2WlV8VHVF0vtl/T6qnuZn2bm7qpe+TFHVtsKqgN2bPfUkLz41U583dSx+u7ljHZv51W
	jzg75cIvsxIPfYOwhWIGaHxvBqEDMZ200l3LJuwzwtkm8H2eFdl44ZK5NPjlSsTCRqVC9kgBqVE
	LQNFdOzJQKyqyxvrfXXj1Gqu2lSRHUPvkEbtL2hgh7JkiXygvxDq8K0fDk680JLCn/NEnxxj0Cz
	9Kc2LfptpHPoH/lHutkjooMXhIYkGbE8n8VyhRFMbZ08BmNcKcAP0Vplp3I78TyhGrk3bjCFqw+
	iS27lz1qKTM9WSi4QUh5nI6qiI6DdGFtpkrrOFnmfUfPHjJKdSdy6GORrKNXzuGRF26Exc52+RD
	gRIK2JyA3cQN6fumGPori8yRRni0GCVew4Llh8Cyh3roFCPjUe/eki6S6DhsvF1IT2St97U0sUu
	pelTcaBLKQiEJU+WuRmiaSlxtW9H3e7sSDNrxGNwVtEjqFiqvn+jLP6GHQKYJwDOYboMtFKOYmp
	Watirzh5FqAm9E1EweuXcc3egto3hxV8rSjmCHevCUKpV4nqFHewd8R1KsN1yDmu9A==
X-Received: by 2002:a05:600c:83ca:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb55a4e680mr118360915e9.16.1794666496622;
        Sat, 14 Nov 2026 06:28:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm156028195e9.11.2026.11.14.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:28:16 -0800 (PST)
Date: Sat, 14 Nov 2026 14:28:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 02/13] scripts/kallsyms: Improve error reporting
Message-ID: <20261114142814.30c8786d@pumpkin>
In-Reply-To: <sashiko-outbox-208961@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-3-david.laight.linux@gmail.com>
	<sashiko-outbox-208961@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 12:14:50 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] scripts/kallsyms: incomplete errx() conversion in write_src()
> --

I need to do a v4, I'll change the message (and remove the '\n').

David

> 
> commit 74224a3e189e43104e9d68aefe42fe16a066052c
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: Improve error reporting
> 
> This commit converts fatal error reporting in scripts/kallsyms.c to use
> err() and errx(), updates the usage message, and adds a --verbose option
> for timing output.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 140e888bf7133..aa3a8ec83fbb8 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -490,7 +485,7 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
> >  			long long offset = table[i]->addr - _text;
> >  
> >  			if (offset < INT_MIN || offset > INT_MAX) {
> > -				fprintf(stderr, "kallsyms failure: "
> > +				errx(EXIT_FAILURE, "kallsyms failure: "
> >  					"relative symbol value %#llx out of range\n",
> >  					table[i]->addr);
> >  				exit(EXIT_FAILURE);  
> 
> [Severity: Low]
> Since errx() already prepends the program name, appends a newline, and
> does not return, should the "kallsyms failure: " prefix, the trailing
> newline, and the unreachable exit(EXIT_FAILURE) call be dropped here?
> 

