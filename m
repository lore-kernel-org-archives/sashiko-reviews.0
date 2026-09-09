Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369C471247;
	Wed,  9 Sep 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942799; cv=none; b=VYHNKaOeZAktD72TLvW0pq7zuRfVQ7Qc7zUSExq5bNJZlKehZ3Uxe0jfRLYzp6HoXu2VZXa0cjgj4Fed83LK/Z93IaGspEistQPYhoZvp6kcAIIbQk/mYBVOnNeqbLLk0J4Zd+Hw2dB0xhJOw7+bny3+B/TOC2Y29DdueRnmxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942799; c=relaxed/simple;
	bh=Ezk4regEZRDctYL3aAjB/VU7lROBPDS5W3U9qYg/2+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVjqj7L/cn1dXJDS3CF97CtvcQ2VuQfEvwEBTydjqAKmTd77BXcXW6z+IABj1I4uAvJkanCrS6fnCnXG46H2VaFh0UpKfBaSMsfCK7x/Pm0v413kpoO41aNBnen8vRihKvwG5dip/c3jq9MgUkk6Dp9OYQq93Y6qhM8e5mBMtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzwAwrA5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzwAwrA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEF81F00A3A;
	Wed,  9 Sep 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942797;
	bh=yU82TqqHIJUO1hdfVOEkiTyN+0Mjhw/KvMXRh/l6lEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dzwAwrA5mgsqoKJpfVsoekrrNHMPfWwjicDDMMr0zQYb7zPvz3B0fi4gqSYCFcPTi
	 9RAlVYplA2cNQYYNAiFl1qYdm0h0leAakRqxdhIviaG6Uz3lQSz0Gb+Zrplei2y++2
	 0/KcYxy1xy887/ygko1iwZAfTQLScsVWCUFkNBZjBvzCxZrMX7LMhgxLwEiWMBEUS5
	 /05dzscQHmxc3t+8+0v/no8W5OTF22m8u5MK4RK90aJtxGGv6DNYx93yx57yPmZ5Ph
	 GPNZbzeJ3tXco8Ot9AGfi2CuuYGUHiUW/ehpRR030LdR37njK0GM0M2gE2RT6QYm3m
	 2nsZdMFS9EoOA==
Date: Wed, 9 Sep 2026 10:33:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dtc: dt-check-style: Consistently pass same content
 as stripped line
Message-ID: <20260909-feathered-alchemical-cicada-fcea21@quoll>
References: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com>
 <20260906181332.280591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906181332.280591F00A3A@smtp.kernel.org>

On Sun, Sep 06, 2026 at 06:13:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Passing `stripped` instead of `code` to `DtsLine` for continuation lines breaks code parsing when comments contain quotes, causing false positive style warnings.
> --
> 
> commit b0e5f002675043b5c126935e8c52f79036f0359b
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Consistently pass same content as stripped line
> 
> This commit updates the dt-check-style script to pass the stripped string
> instead of code to the DtsLine constructor for continuation lines. This is
> intended to make the arguments consistent with other DtsLine constructor calls.
> 
> > diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> > index 36e5b5db5e14c..49ced18895583 100755
> > --- a/scripts/dtc/dt-check-style
> > +++ b/scripts/dtc/dt-check-style
> > @@ -203,7 +203,7 @@ def classify_lines(text):
> >              in_block_comment = True
> >  
> >          if not prev_complete:
> > -            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
> > +            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, stripped)
> 
> [Severity: Medium]
> Does passing stripped instead of code break parsing when comments contain
> quotes?
> 
> By passing stripped (which still contains comments) instead of the properly
> pre-parsed code, DtsLine.__init__ falls back to its regex-based
> _strip_strings_and_comments() method which incorrectly consumes valid code
> if a quote appears within a comment.
> 
> This can cause the dt-check-style script to generate false positive style
> warnings on valid DTS files when a continuation line contains a comment with
> an unescaped double quote (e.g., some_prop = "a", /* comment " */ "b";).

I could not reproduce it, but also don't want to spend time on arguing
with LLM so I dropped this commit.

Best regards,
Krzysztof

