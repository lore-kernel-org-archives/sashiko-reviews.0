Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE20421F18;
	Tue, 21 Jul 2026 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616558; cv=none; b=bsmttyeOeYrT3/II70y7I27pNnjp09b0PPfswEZLD7cE64QIkfKKmv4w/8p074/jDjRSNRBgFx76ZdVuyco4OBxsKKS7rAB+Zs+GRBkNb/QVfH7nR98ljHwIc2exRq5Nx1FtNdFizwoTKP4XA4yoCM7tTEGoyqx58h4oCBEB1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616558; c=relaxed/simple;
	bh=ACyZ6iiFUyxvht5IcX4Plkq7g5oD6YglvpTMqADr3WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mhh48VmLd+bSuYkq9GnYwylk4Gs3Dgq8K5I1jtYmAvRSAfD4xIbVhmVVon5MDAU7PH/cbVsOBRXMgBa7M1U2PpfyZcmAuA51E/LeeARfDuDmrrWjYlMjPHvlMLBFuD2PUL6NYGLiwbhNhTqqAV+LMp1iHzsu6QILsLD4qx8Jpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQY7Sw+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQY7Sw+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B725F1F000E9;
	Tue, 21 Jul 2026 06:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616557;
	bh=7fvqVpYjM4uGVeylRl1rZ6/tMsvtUYkVQ9XEAWhuWyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQY7Sw+t3JnWt+NGsZN9Og1+PC931PHYzy8yEOhpS8lteE904E6prTu5xU1cAAdNR
	 rXhhIblECUpJJIx3esJWgjS+6XWd95bb97cUyTEINZK/Qb1Og7EH0szQXnJaljWtsb
	 HVCykn3kGNCjfA43rhuT8R39aKFHQsfj5H3v45fDzgdwEu7Y2dEoLztifdPpVP3LPW
	 VoLwETwacpRa/By1mG5RYK2zQEptT9ux9zfECpEh/5+ZLYjzUFZPoYpm8ORbyO7tYI
	 tg/GTfL0JCSyCdmXqkFavctsO5YFJ8HJts8ogOg3lwJIromu5K6iQ0xe++4ySiRJz5
	 FJ4NMBxvkP5zQ==
Date: Tue, 21 Jul 2026 08:49:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260721-blond-tortoise-of-authority-ab3dca@quoll>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720161033.5277A1F000E9@smtp.kernel.org>
 <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 10:02:39PM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 7/20/2026 9:40 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Contradictory array lengths and definitions between `clocks` and `clock-names`, making valid hardware clock combinations fail validation.
> > --
> > 
> > --- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode ---
> > commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
> > Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
> > 
> > This commit extends the qcom,q6apm-lpass-dais device tree binding to explicitly
> > describe Digital Audio Interface (DAI) child nodes. It adds address and size
> > cells to allow multiple DAI instances and defines a pattern to document per-DAI
> > properties like interface IDs and clocks.
> > 
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> > > --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> > [ ... ]
> > > +      clocks:
> > > +        minItems: 1
> > > +        items:
> > > +          - description: MI2S bit clock
> > > +          - description: MI2S external bit clock
> > > +          - description: MI2S master clock
> > > +
> > > +      clock-names:
> > > +        minItems: 1
> > > +        items:
> > > +          - enum: [bclk, eclk, mclk]
> > > +          - const: mclk
> > 
> > [Severity: Medium]
> > Will this cause device tree validation to fail for valid hardware clock
> > combinations?
> > 
> > The clocks list defines 3 items, but clock-names defines only 2 items.
> > Because dt-schema limits arrays to the size of the items list when defined
> > in this way, providing 3 clocks in a device tree will trigger a "too long"
> > array error for clock-names.
> > 
> > Additionally, do the array index descriptions mismatch? The clocks array
> > defines index 1 as the external bit clock, but clock-names index 1 strictly
> > requires "mclk". This would prevent configuring "bclk" and "eclk" together
> > if "mclk" is not present.
> 
> 
> The sashiko review assumes that bclk and eclk may be used together.
> 
> However, the hardware supports either bclk or eclk, optionally with mclk. A
> bclk + eclk configuration is not valid hardware usage,so the reported issue
> is not applicable to the valid clock configurations.

But you wrote that eclk ALWAYS follows bclk! Look!

+        items:
+          - description: MI2S bit clock
+          - description: MI2S external bit clock

What is the meaning of this?

Best regards,
Krzysztof

