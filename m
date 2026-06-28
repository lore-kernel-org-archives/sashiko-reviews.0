Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629923F417
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782628570; cv=none; b=kjWtHjqhqKGcp416czQoaf44ab8huczNu7T9h+QNAWehyTH40UVnZ+Gj16dkLNPxGC/AWZ8n+EBIIaWK+S75lgv4xdeN1m+LM/4VR+6ZWxN5S+zHa1qv2uTaTGd8cNN9cgOUahRIy4ygZYAxQfWOvvoRe2zOr7Lrf5m3P6lq+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782628570; c=relaxed/simple;
	bh=s644IXHGwwZwz7RR43ekRmlAu/YVAo0KE/f+9qLmtzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChGQ3kxbqGfb2vglR6k36zPXD/zlepowJNPSxRLCiOijjCPCbCrgfWrie6iTp/PgFpKoaalBWsLVbLlf7OgUeTOIY+F2tZO1GOu3b0B8jf/Rqr70dPorEWAF+DgynxeaKxpDktegDx7MeRn1Twban8gbrsnkWY1ZxOpX8q5tV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgeIsdQp; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgeIsdQp"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3022193eec.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 27 Jun 2026 23:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782628568; x=1783233368; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5XNx4q7Z6p8WGo2M6eIxEnOXOYIe6d/zNN6spEqUvI=;
        b=AgeIsdQpKAjSBhKL1pisZh12RZjRWwpI+SXmL4+nkGobA0VAUrlyI2KGD7TXgt5sFt
         HDUkk/4CZdcaaS58ob82B36SbHEnlUxCKPsYggbSeIAOcwvtzQu7kTaGGLQcoXGO529O
         cbNS7Hr0O71FC/GpE+Z8ERCFWWleNidExDA1HCbF9LD9KgvXAq9kch5vIP6avlQAMRdN
         dpEg06Cr1wKbPUuelkj6Wx3ihjb2uwaLz68L/6vRe0JeMHP46JXr3JLuGQTgCTDLfzhP
         k1S3QpR2ptSy56Qhvd6ViK/Ze8+d0GIpch/42a6J/3AFD3uJOEtpl9Z68t9Moco2h0qY
         D93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782628568; x=1783233368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5XNx4q7Z6p8WGo2M6eIxEnOXOYIe6d/zNN6spEqUvI=;
        b=IpyFs/bfxhoK+wdCmZNuNs0uCcSjX2H7PfLvk1K0l0tB44+epXJk7ZvEC3NkLst7T2
         4w9a13oPBKfKnGwvvXkKB8vtyk2yU0OKfesE/+qJ99sKB/MnZic6SObLJtOgwoIs4dLS
         8p2M+lEuXd7M3SeBhlldQgcFfl+4P9xpp7b+jlsRqRF8lbheI7dZVJSV7GW2lDWQurid
         tZmOymOv/74gtpoW7V1uFssYXi7GAEhIDr97l4OKX9ggx+yT8feA7ltiFVczi02/swyM
         WqKsjgDZddhB6Gv1f+tKAOBA5d26fzX1CvqJk+hXw/e9XW1SFudV+7z7yzdr+ftkLahq
         ez+Q==
X-Gm-Message-State: AOJu0YzvHXAvwvIXqrhEsQQ3wWWsATxvjhu4FZBdCP0J4tN0ah3Fj/hs
	7TRs8LJ48vmpH4a1pJWivPdpn2T1r7mq49sU8g1IP6MLV6nOfPBpW5s2aRtjaA==
X-Gm-Gg: AfdE7clY8keyeztnshKDr8qmgcABzW16KMlH+CbtehoOlCDtILKIra1JEpBginCAhwO
	bydvHd1DzW4fjxbH76QpdfyiCWpzco9K5SXaX60UMmfrTVsR19K7UUax6zyCQuYVGo87x+JeAur
	clK83rxkBC6aYfa/v96OanlKjsKgFQlSkzsfroz5l24LONnydFXWzuJKJTgNlEnUcrUGu+A3G3Q
	De1Dj380HnJVuuUDK3PGsa4FFFZp5HDDJ84L8MVW4x9ccPNPNH1We5wNCbtLbxFUuAQzNZqnesU
	g96glCc/yuJdwpFsbipkgxTjARO3M+uVqfOKTSmoxhDE/JlPmkgF50q3qQBzpvNog7i2w7dvHLJ
	XF03yo89xtdlrMvI7L3pM0TniqI7wl9QmeNnj2VSl0CLV4qmb/+t5C2VnYFO+aCU164xREhYLPD
	D3VrYNruzh4CovZID4eXEo4q/kSPJnevymN1cMCvs=
X-Received: by 2002:a05:7300:3084:b0:30c:ab4d:382a with SMTP id 5a478bee46e88-30cab4d3cc0mr6329645eec.44.1782628568353;
        Sat, 27 Jun 2026 23:36:08 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f14f8asm20075142eec.6.2026.06.27.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 23:36:08 -0700 (PDT)
Date: Sun, 28 Jun 2026 12:06:02 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/3] riscv: stacktrace: Implement
 arch_bpf_stack_walk() for BPF
Message-ID: <akDA0mbLQhktZNe-@computer>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-2-varunrmallya@gmail.com>
 <20260621145658.C8CBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260621145658.C8CBD1F000E9@smtp.kernel.org>

On Sun, Jun 21, 2026 at 02:56:58PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does this code need to resolve the ftrace trampoline address?
Yes. I forgot to add that in there. 
> Looking at the generic unwinder walk_stackframe() in the same file, it uses
> ftrace_graph_ret_addr() to recover the real instruction pointer when the
> ftrace function graph tracer is active.
> 
> If a kernel function in the unwinding chain is traced by ftrace, frame->ra
> will point to return_to_handler on the stack. Because return_to_handler is a
> core kernel text address rather than a BPF program address, the stack walker
> might silently skip the caller's frame and miss the BPF exception boundary.
> This would leave the context uninitialized and trigger a kernel panic in
> bpf_throw() when it validates the missing boundary.
> 
> Could pc be passed through ftrace_graph_ret_addr() here to ensure the real
> return address is consumed?
Addressing in next version.
-Varun
> > +	}
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260621144259.288135-1-varunrmallya@gmail.com?part=1
