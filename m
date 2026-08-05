Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EE3DB640;
	Wed,  5 Aug 2026 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913980; cv=none; b=EkkZwSiHtGKVaFHjQX1ws8KcxlxF/5MGI47Fv4+OtyOc/M1KFpmURYmCBYhaDpkuI2Hg1CtOGTP1zoofMpb8Eap7h8t0cEOROw6F5zdrqX4Eu1wywMGcuLmT2DPC3rYCtdo7hEw8DzqJLnDeSo6sB5fbYMq/YZM8LggN5Q7AOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913980; c=relaxed/simple;
	bh=XyjdQw5vHv15miHITuqhLViV0PeC4EhnBTkPzrqYcxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQp4/kdp4RCorK0voKKn5CF7k884MPI7ppDKg29zUpqTxD9S04jzz1kLiKkDD4HhxWwgUq60UYaiuy0MNeHDTtx+GpPIKz2eis0lOc4GiYnQYtHI7tMjZ0gRuz+0sS4+aSuGvcoI3LtBANap3QPCDal5nAC5UrdYsRIt7aqqIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyAYyd0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyAYyd0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E201F000E9;
	Wed,  5 Aug 2026 07:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913978;
	bh=o59jN68wgLw3YD6yQjMfoBUtaqcxWg8Nf0mXb6+LxHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WyAYyd0XkmwQg4h3Xi3yNxPIKBdkK5A3qPh8B6GR1wwLAHnAlHqCY+2hJfUvS8Tau
	 7FJ69WVTZh7E32chnRUZoIeNa/FJnZk0JT/T3LKHbTc1VeTbdA13RSMEAQ//8hgn15
	 TSVIyq8DicuniAhrttXweRBUaDGI5l8H5h8dMsB4xSLr8wsXjrOkMYLBJ4/64V5IT0
	 HSxZnJ/LUQ0vWkauN4R9TQehVxOlvPw28xuMS1jgNChP9kPNC+e17Xwe9tQ19TuFFL
	 pxgcSbjAGnAH0NIjUYAMrAmj700XgDKPfB9McEJj/e8HWg3DF48CssVZEZqcgA6mul
	 jDpJ1wbJpQ9gg==
Date: Wed, 5 Aug 2026 09:12:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 10/11] dtc: dt-check-style: Add warning for redundant
 white-spaces
Message-ID: <20260805-durable-swinging-skylark-f687f3@quoll>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-10-6c9776928cea@oss.qualcomm.com>
 <20260803091332.53D661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803091332.53D661F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:13:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] False positives in dt-check-style whitespace checks due to unstripped strings and inline comments.
> --
> 
> --- Patch [10]: [PATCH v3 10/11] dtc: dt-check-style: Add warning for redundant white-spaces ---
> commit f5a3cbd31bda433ce990bca1b2244f3a3da27d87
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Add warning for redundant white-spaces
> 
> This commit adds a warning in dt-check-style to catch excessive spaces or
> tabs around '=', before '{', and before ';'. The checking is split between
> relaxed and strict modes to accommodate existing in-tree usage.
> 
> > diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> > index 1430c675bd951..aa2072957a1a0 100755
> > --- a/scripts/dtc/dt-check-style
> > +++ b/scripts/dtc/dt-check-style
> > @@ -348,6 +348,36 @@ def check_trailing_whitespace(ctx):
> >              yield (dl.lineno, 'trailing whitespace')
> >  
> >  
> > +def check_redundant_whitespace(ctx):
> > +    """No whitespace between brackets or other code elements.
> > +    See also check_value_whitespace() for more checks."""
> > +    for dl in ctx.lines:
> > +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
> > +                           LineType.COMMENT_END, LineType.COMMENT_START,
> > +                           LineType.PREPROCESSOR):
> > +            continue
> > +        if re.search(r'(\s\s+|\t){', dl.raw):
> > +            yield (dl.lineno, 'extra whitespace before {')
> > +        if re.search(r':(\s\s+|\t)', dl.raw):
> > +            yield (dl.lineno, 'extra whitespace after :')
> > +        if re.search(r'\s+;', dl.raw):
> 
> [Severity: Medium]
> Does using dl.raw directly here cause false positives for inline comments or
> string literals?

Ack

Best regards,
Krzysztof

