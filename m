Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8E38E8DC;
	Wed, 10 Jun 2026 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076525; cv=none; b=NSP5V5tNijr7XsYqi1/w+t94UX7ovt0gYKXwHE7cWw6mgfItPdWMJS96nkPEiS91qE5/zPlvEqPuAn67NCkvbBdSe2gXhnlivaZ1M1rzsWqQ/v9V6jSPHE6l7KqOOaTmeLij8KfSFHr7QoC3G7yORNUCfFjyfVeOUojOvmdLQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076525; c=relaxed/simple;
	bh=nrTkUCqByKLn1h5ASLMSFW3q7y1AFtrM5nNZBMXV2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkzuJcXH9riKwV0v0GMarNIRFDEwy/TNOZzLruz3fwWyFJ0idjTkWUPG9UlZ/mGgKS35/5jzJRzXa9+96yCHneL62B+nqJvIvxJ9vlKs/dEOnEGznIB8kRPZ54sdk5wI2ZFRCtquxfUF/9ZIfmBZ1A7kJY2TwxUpam3M3C5mjgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDbNnYHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDbNnYHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCABD1F00898;
	Wed, 10 Jun 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781076523;
	bh=oL/1GG8YgFCTdl3mIPdHnD/ArxJiOzWU3ywVHks5kxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iDbNnYHLbCfLuxtBXQPwz9LIKCmR/KF69+5w1Dzcn+irjCut/z4BqY+q5cwd657zu
	 hbPwMACumq3CACCN9GqtXLYzBJoJpIm7w3EGx1sFrnZ/Qpo/P0o97BHff6JgYszfLm
	 LodEk7+49GaZmQupFvswMkHY21Yku7kF2EGwjavmjAa17LO4TQFyiuCcEzB6/Deodu
	 9DYU8uoQ58EooGGCGtYV2mgZ2pqseNZ5mh82ZCN+yH8ntL7imf1t/OwIspG6TBhmzQ
	 NkbHNstj9UU4KrMoo4rtvIIkhsO8VgLww4YHxQazkCeGY7XbZ2fh0eRPdjls5/XSWb
	 YJjqW0LbHv01w==
Date: Wed, 10 Jun 2026 09:28:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Message-ID: <20260610-omniscient-dainty-giraffe-c690cb@quoll>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
 <20260608205406.45ED31F00893@smtp.kernel.org>
 <20260609-appraiser-sedate-c76c7b06690c@spud>
 <20260609175259.GA2210649-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609175259.GA2210649-robh@kernel.org>

On Tue, Jun 09, 2026 at 12:52:59PM -0500, Rob Herring wrote:
> On Tue, Jun 09, 2026 at 05:36:30PM +0100, Conor Dooley wrote:
> > On Mon, Jun 08, 2026 at 08:54:05PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The patch introduces several new compatible strings (e.g., `ti,am3352-scm-conf`) to the exception list without documenting them in any valid dt-binding schema. This causes a bisectability breakage in `dtbs_check` during the series and leaves permanent 'undocumented compatible' warnings at the end of the series.
> > > --
> > > 
> > > commit 0cddec624a3b6ba2f0c447b95621f32101d2e31f
> > > Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > 
> > > dt-bindings: mfd: syscon: Disallow simple-bus with syscon
> > > 
> > > This commit adds a schema to disallow the combination of syscon and
> > > simple-bus compatibles. It includes an exception list for legacy
> > > configurations that currently rely on this pattern.
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > > > index 14a08e7bc8bdd..2d5eef5add544 100644
> > > > --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > > > +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > > [ ... ]
> > > > @@ -52,11 +53,44 @@ allOf:
> > > >            contains:
> > > >              const: simple-mfd
> > > >      then:
> > > > +      # Always require a specific compatible for syscon with simple-mfd
> > > >        properties:
> > > >          compatible:
> > > >            minItems: 3
> > > >            maxItems: 5
> > > >  
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: simple-bus
> > > > +    then:
> > > > +      # simple-bus conflicts with syscon - if a device is a system controller
> > > > +      # with miscellaneous registers, then it has at least one dedicated
> > > > +      # function thus it is not a simple bus. Allow existing exceptions.
> > > > +      if:
> > > > +        properties:
> > > > +          compatible:
> > > > +            not:
> > > > +              contains:
> > > > +                # This list CANNOT grow
> > > 
> > > [Severity: Medium]
> > > Will this break bisectability for dtbs_check? Since the DTS files are
> > > updated later in the series, it seems like existing TI DTS files using syscon
> > > and simple-bus without these new specific compatibles will fail validation
> > > when this patch is applied.
> > 
> > Perhaps worth telling the sashiko people that transitory warnings like
> > this aren't something we care about, especially since even the normal
> > development process for devicetrees introduces validation issues in the
> > platform maintainer branches.
> 
> I think that is on us to tweak the review prompts. There's already one 
> for DT that none of us wrote. Though really I don't think that's all 
> that maintainable. Really, IMO sashiko itself should be able to 
> incorporate feedback like any other reviewer/developer.

I was looking into prompts (Chris' and therefore Sashiko) and honestly I
think this is incorrect approach. The prompts are duplicating common
kernel knowledge or coding style in separate repository. Both generic
and subsystem specific coding style (see
third_party/prompts/kernel/subsystem/workqueue.md).

If these prompts are important, because AI tool cannot build on review,
then we should improve in-kernel docs so humans will benefit as well.

Best regards,
Krzysztof

