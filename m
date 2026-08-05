Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501473E1CE1;
	Wed,  5 Aug 2026 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913931; cv=none; b=pwwQ+kKz8URNQ3uv5lIuI0bQuh03uXCmdIbxzf9TVgDPOMhdSepjXq4V/XHIZmD+T8mv5GjGJ2SdRYIyCNFLg976aK4Ziy2NflKyyT6iu9LTIPpOnoRNJOAp2mvW0zL10NLGm66aCd8BbIEdgA17KGRSd9ZqE2/IR4Eb4V7SlGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913931; c=relaxed/simple;
	bh=Wcwm050J/UxkaaiHNw2rQZW+iGHIlte2C+hk4Rk48dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHSkNcQGXaVeeaZl/HGCdXq8xVkBDdOK0NqM71a/fHbPyEkIsGVlE2gjQ+/ecHqdKY9K9pTYQsrclBQ7R8/jnWBvexSUeE8sKjfK8L711YuzxvsRoGqnFYKabiOzaPfLmh63JF1t+DDrZoFsofJOdOyWqgrIpU1hN9W2x4hpAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaMFYaol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaMFYaol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4DC1F000E9;
	Wed,  5 Aug 2026 07:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913930;
	bh=wxcNhZ7NuaEAoAtD1IYU3/BFFpDti03lJm9hAoBOPBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TaMFYaolJFYxFwCIz+BDSp5787DnTZhNQFz8eSJORwf48qkpu5rkPRWLxtHsmJoaU
	 mKA+SRsKfy4SKG2d54gD3MsZ+x8q1L67bJEmnjlBwEk6YsyRS85gENw0deAIPC/zDl
	 mYHNQ6wj6ci3+zqIco/yEvB4J7JFkObTFnc1Yx1QLEEB/ls8Q/DL9xjAEwzRis4Ts2
	 4mlZVXWafPTTIPsdpZZRLvcRa1vUNvFo11DdCchOSg5AEBVrb+lh/uZxWrQCRzECT/
	 /Dl7Pn/+zDnLX2kSQWq98/zw6aY9sWdFsB8naVsVjVN4d2XlsHF4NroVppvB9oWAjv
	 CfwJ7+9iZrp9w==
Date: Wed, 5 Aug 2026 09:12:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 06/11] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Message-ID: <20260805-quantum-impossible-sparrow-619791@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-6-6c9776928cea@oss.qualcomm.com>
 <20260803092141.279881F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803092141.279881F00A3A@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:21:40AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The dt-check-style continuation alignment heuristic misaligns C preprocessor macros
> --
> 
> --- Patch [6]: [PATCH v3 06/11] dtc: dt-check-style: Fix alignment of values in continued property lines ---
> commit 2e7f6260952152a0c0c19383e03e859b1a3c8092
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> This commit updates the dt-check-style script to enforce proper alignment
> for continued property lines. If a continued line is part of a previous
> phandle, it requires alignment to inner values rather than the opening
> bracket to improve readability.
> 
> > diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> > index bdf36ba9e2744..1c67348fb5269 100755
> > --- a/scripts/dtc/dt-check-style
> > +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
> > @@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
> >              continue
> >          # First '<' or '"' after '='
> >          rest = dl.raw[eq + 1:]
> > -        m = re.search(r'[<"]', rest)
> > +        m = re.search(r'\s*([<"])', rest)
> >          if not m:
> >              continue
> > -        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
> > +        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
> >          for cont in dl.continuations:
> > -            if _display_col(cont.indent_str) != target_col:
> > +            target_offset = 0
> > +            err_msg_explanation = 'to < or "'
> > +            if not re.match(r'[<"]', cont.stripped):
> > +                target_offset = 1
> 
> [Severity: Low]
> Does this heuristic unintentionally force misalignment for C preprocessor macros
> when they appear as top-level elements in comma-separated property lists?
> 
> Looking at check_continuation_alignment() in scripts/dtc/dt-check-style, if a
> macro is used in a list alongside <...> elements:
> 
> clocks = <&foo>,
>          CLOCK_MACRO;

We don't want code like this... but comment is valid. The check should
rather rely on ending of the previous phandle.

Best regards,
Krzysztof

