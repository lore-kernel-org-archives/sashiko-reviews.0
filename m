Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4103EB0E9;
	Tue,  9 Jun 2026 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781027581; cv=none; b=Uur9OlavBmnRyLPUQpdOGuCj6ZC7wu2P3eB5A2PZU10hiBFyeoETdUKzL0qcme6ud1CEE8cg9Dh0HC4bGqTVhKrFgIwl7Vv4jhfqFzLl6hazU9VaDQPDcOvs2xDyEfcTSrNXkzCYTV5k8QFS/mm0QK+caRhwcwRaOGom9kL/xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781027581; c=relaxed/simple;
	bh=efNM+UiVwyJPkn2P/vsYAiQ4LqMpywaA+OaaAugjTzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFA3CnWbruZCPgm0OKCqGbow7GwM5txo4UGyk1qlqhnKMyJnDPE4nAUQmAhatFaFfbsVlrh69J6KVofWB8Osg+eIBULLYNM5woELoUAsddO+BNyqarUqa0ZVYUOSwdzwU16ZXTZvHGudfhtOhn8AenMCYRY8T0S3XhrfL4TKR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6LAtnmH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6LAtnmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801B71F00893;
	Tue,  9 Jun 2026 17:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781027580;
	bh=mr2y8UnJqqGBlJcGkvv84elsjXTeR2F6kj4k+62p12c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f6LAtnmHBEKCHwEXkByiXo9MDM5ZsDGJ+nBifoP2CKJpQRv0bFGTbKQHVPpSpAhuu
	 OC+KfFvnubyofrJdf/Id+e0sz5wYe2bN9i/mg6ByHmOLHnfSHZABRxLI3o1tgZ5AuM
	 dJ/gnxvaakZyeWnsqG+/yk0wy1p6VzMoLqpuOHaUtvE2oF2AP81QPLdQEvWs/D4boi
	 p2/XrccAj6BQ30hiXLYe3hpihwkb5UTvsgDbMuAlmOG4dFiGhN+ALiwOLhIsrPF2SM
	 +UkfLkTGffAiy3ZOjdwotCQ5JgA+ekboFhep1Mn8Ml6ujE0V+v2c5saAzH+24KZqoj
	 gjB++bID3nsyQ==
Date: Tue, 9 Jun 2026 12:52:59 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Message-ID: <20260609175259.GA2210649-robh@kernel.org>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
 <20260608205406.45ED31F00893@smtp.kernel.org>
 <20260609-appraiser-sedate-c76c7b06690c@spud>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-appraiser-sedate-c76c7b06690c@spud>

On Tue, Jun 09, 2026 at 05:36:30PM +0100, Conor Dooley wrote:
> On Mon, Jun 08, 2026 at 08:54:05PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The patch introduces several new compatible strings (e.g., `ti,am3352-scm-conf`) to the exception list without documenting them in any valid dt-binding schema. This causes a bisectability breakage in `dtbs_check` during the series and leaves permanent 'undocumented compatible' warnings at the end of the series.
> > --
> > 
> > commit 0cddec624a3b6ba2f0c447b95621f32101d2e31f
> > Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > dt-bindings: mfd: syscon: Disallow simple-bus with syscon
> > 
> > This commit adds a schema to disallow the combination of syscon and
> > simple-bus compatibles. It includes an exception list for legacy
> > configurations that currently rely on this pattern.
> > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > > index 14a08e7bc8bdd..2d5eef5add544 100644
> > > --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > [ ... ]
> > > @@ -52,11 +53,44 @@ allOf:
> > >            contains:
> > >              const: simple-mfd
> > >      then:
> > > +      # Always require a specific compatible for syscon with simple-mfd
> > >        properties:
> > >          compatible:
> > >            minItems: 3
> > >            maxItems: 5
> > >  
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: simple-bus
> > > +    then:
> > > +      # simple-bus conflicts with syscon - if a device is a system controller
> > > +      # with miscellaneous registers, then it has at least one dedicated
> > > +      # function thus it is not a simple bus. Allow existing exceptions.
> > > +      if:
> > > +        properties:
> > > +          compatible:
> > > +            not:
> > > +              contains:
> > > +                # This list CANNOT grow
> > 
> > [Severity: Medium]
> > Will this break bisectability for dtbs_check? Since the DTS files are
> > updated later in the series, it seems like existing TI DTS files using syscon
> > and simple-bus without these new specific compatibles will fail validation
> > when this patch is applied.
> 
> Perhaps worth telling the sashiko people that transitory warnings like
> this aren't something we care about, especially since even the normal
> development process for devicetrees introduces validation issues in the
> platform maintainer branches.

I think that is on us to tweak the review prompts. There's already one 
for DT that none of us wrote. Though really I don't think that's all 
that maintainable. Really, IMO sashiko itself should be able to 
incorporate feedback like any other reviewer/developer.

Rob
