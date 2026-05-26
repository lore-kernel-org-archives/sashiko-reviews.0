Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483132F691F;
	Tue, 26 May 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806082; cv=none; b=VTrQ6G/ys75u79rbSFj7waPOU8DRh+nQ0SImadilIYjCYMsJQgiG37AbXK6zNgdKTb6x8iyABjWuNxR8cla+qIxUiXcsKojiHy/BspUDpSCQbYcqV/9119zNO7PXHkRHw8EhBo14ukfYxFNAAOy5S1r8YG6WtUj0lNPY4fJts6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806082; c=relaxed/simple;
	bh=mDzX9CdYP640nxuSpX4i4TSvETI3+PkI7fFzmV7MiT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqo4jVIM/0RkgtMgjN4cg/woTPhdn7v00OoQ5+uLosNNuG0WUQYK3YCj6qeCi+pdBeLi7mjYBA2WWpC+CYIEpGPzooyfTbrCKSRZno6jEHgJOeRe2zBdRQO5G2LWT6hbezjK4FbbsP0i4LtufCOPYg+1KE1vAC8XePjBQn92zVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBZyNc0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBZyNc0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0271F000E9;
	Tue, 26 May 2026 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806081;
	bh=Ek5lrBzczU2aR62gMDENtWcjQ/WBpYlAIGjf7K7K2dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LBZyNc0uVf+MpCe4+Hr9THXbdTyK0ESJ0a5W5iuD4M/0kUY69afClvjM8+Fp4eypN
	 BpCa2sjPiK4FpN4efpD795tZmoaHfl7zAQWJsVEZSxvHsxTVWIhN7r0i2MXVxG3Ith
	 4RgUZGNdufUEHQpmU5SEEgDa9fY0toJHG0G86HZJBlZTWM8wbAuWsDKsJj+UoqyOxu
	 Sl6TwVaEFvMDgrmK3gz/u1yyUn/8vlAXBk2Wu7PPiqznWqYtmZ0B5Ug0NIlaDUakBw
	 AkIVeD3q6mc/4MnXKO5PtjeHXx4fpy/Q1yYTSO4GuIn4raGKBEHMsjg0DGqa+qe+Mh
	 dN2K4coa+rNSw==
Date: Tue, 26 May 2026 16:34:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
Message-ID: <20260526-nocturnal-dragon-from-lemuria-c517a4@quoll>
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
 <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
 <20260526-uptight-bustard-from-jupiter-291e59@quoll>
 <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>

On Tue, May 26, 2026 at 01:02:37PM +0300, Tudor Ambarus wrote:
> 
> 
> On 5/26/26 12:39 PM, Krzysztof Kozlowski wrote:
> > On Mon, May 25, 2026 at 04:06:40PM +0300, Tudor Ambarus wrote:
> >>>
> >>> [Severity: Medium]
> >>> Since the commit message and binding description indicate that the
> >>> Application Processor relies entirely on the ACPM firmware for all
> >>> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
> >>> required list?
> >>>
> >>
> >> I disagree. The property remains optional because the ACPM firmware
> >> can be bypassed entirely. The TMU IP is capable of handling thermal
> >> management directly without IPC intervention, so the phandle is not
> >> a strict hardware requirement.
> > 
> > I see your driver will fail probe without it, so something is not
> > matching here.
> > 
> 
> 
> Yes, that's because plain TMU register access, without the ACPM, is not
> currently implemented in the driver. The ACPM can be bypassed in theory,
> which is why I left the phandle optional in the binding to reflect the
> hardware.

The point is that phandle is not optional currently. Binding must
accurately describe the interface implemented by SW, so either SW does
not fail the probe on missing property or the property is mandatory.

Best regards,
Krzysztof

