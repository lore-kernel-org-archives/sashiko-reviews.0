Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3320FA81;
	Fri,  5 Jun 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780691101; cv=none; b=hRra0rWAPMspKp+bVLGLp5+ltU71q1jX1dr/mARmdV3qNbi4qzpabV/VBOS/QyyxvMZV+4AteH8pjWkmPcFrtJv8rX3jINXyV6r+TvCmHlT3TdtIi91X3WVdSrR7R2MPkWxCLGFfbyriQbzV7pXIWFvm0CTvXVYla8d8yZTbge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780691101; c=relaxed/simple;
	bh=nsBm8BUJvKZZNT7WZtRlEi0j3WlsL7RFLF1qhu7sDVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg1KeG+1DJc72YMmGNcKUJAjgvO6zOa/oItgvcPTzNZT0dJH8Ohcm4U4klLv+HPelXNvOKL8e1F/Me/qXeZZGSJExjaLPpLG1K64GYL/wSlhB8BWgZpDDi/um/YEC6nfwMHWFDyfCgEphBvTxCHKzclFCKAgM/eI/CKO9vN29OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMk2bsim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMk2bsim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637E11F00893;
	Fri,  5 Jun 2026 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780691099;
	bh=AawfnxPkBu+nR18PFrwVItmZPaX3o7vFcdq98RO2TxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GMk2bsimU+Mb1HFIU6mQvPXsEs8zIOlAwzfX5LYbZe0sM7Til3WaUdFcMAO2A+fvX
	 axiiea11D1JLKzZZ1w9ByNOcmJSz1gAN283rmiSIwgmBbzo6Lip2/lCBcewI9rEjVU
	 Cz5VMonxKOcCruXzurk80jmFIVuLWozz3yrmsH+vGjPTyNeyXCX873KjCK9KlPVwBN
	 O8QSbj+UHwe781TRcknt1PkxrEz4zeGMvjQXDSgS/EtaUUgK7DOmky0OZwzUBX68yO
	 q1s950gU2OYh2EUt+qeB4XBROhCS4l5YbI7Ek6bFuhlU70lEQN6d+sbNnyAz1i3BSV
	 mCleqJVjdUrog==
Date: Fri, 5 Jun 2026 15:24:58 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev,
	vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260605202458.GA6304-robh@kernel.org>
References: <20260603132059.503527-1-vladimir.oltean@nxp.com>
 <20260603133350.9FA271F00893@smtp.kernel.org>
 <20260603133825.l544tnmtn2pqfrzh@skbuf>
 <20260603-numerate-unbundle-ef259832006d@spud>
 <20260605083737.yryq2a763zhnkjyq@skbuf>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605083737.yryq2a763zhnkjyq@skbuf>

On Fri, Jun 05, 2026 at 11:37:37AM +0300, Vladimir Oltean wrote:
> On Wed, Jun 03, 2026 at 04:50:39PM +0100, Conor Dooley wrote:
> > On Wed, Jun 03, 2026 at 04:38:25PM +0300, Vladimir Oltean wrote:
> > > On Wed, Jun 03, 2026 at 01:33:50PM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [Medium] The `if` condition for enforcing the `big-endian` property incorrectly matches the `compatible` string array directly against an `enum`, which will always evaluate to false and cause the requirement to silently fail.
> > > > --
> > > > 
> > > > commit 8bd3982a89722b20a3686e42d4ab3b9f0711ae11
> > > > Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > 
> > > > dt-bindings: phy: lynx-10g: initial document
> > > > 
> > > > This commit adds the schema for the 10G Lynx SerDes used on most QorIQ and
> > > > Layerscape SoCs. It defines the valid compatible strings, PHY cell requirements,
> > > > and enforces SoC-specific constraints such as lane counts and endianness.
> > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000..8cf6027a75b91
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          enum:
> > > > > +            - fsl,ls1046a-serdes1
> > > > > +            - fsl,ls1046a-serdes2
> > > > 
> > > > [Severity: Medium]
> > > > Does this conditional correctly enforce the big-endian property? 
> > > > 
> > > > Since the compatible property is a string array in device trees, evaluating it
> > > > directly against an enum always returns false. Should this use "contains:" 
> > > > with the enum, similar to the preceding if block, so dt_binding_check 
> > > > correctly enforces the requirement?
> > > 
> > > The tests I did suggest that it does enforce the requirement.
> > 
> > Yeah, sashiko just doesn't understand how this works without "contains".
> > "contains" is only actually required for validation purposes if there's
> > fallback compatibles and you're trying to get a partial match.

Not exactly. The missing part is the schema is fixed up so the above is 
converted to:

compatible:
  minItems: 1
  maxItems: 1
  items:
     - enum:
         - fsl,ls1046a-serdes1
         - fsl,ls1046a-serdes2

If we didn't do that, the above is not what we want here, but 'contains' 
is as that's the loosest condition and works regardless of how many 
entries compatible has. That's what you should do here.

This fixup used to be a lot more widespread when we used the DT YAML 
format and everything was decoded to an an array or matrix. The fixups 
saved a lot of boilerplate. That's less true now, so maybe getting rid 
of more fixups like this case would be better.

> Yeah, I have no clear understanding of the json-schema syntax either, I
> just copied from another place where it was clear that the intention was
> to have multiple matches on nodes having a single compatible string each.
> 
> But maybe it would be good from DT bindings maintainers to teach LLMs
> where they get things wrong in this repo?
> https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/dt-bindings.md

Yes, there's a few things it consistently gets wrong. I've looked at 
this and I can go write more instructions (and fix some things that seem 
wrong), but how do I know if it really works? First, I'd be testing with 
a different LLM as that's what I have access to. Second, how do I know 
if no warning is just the indeterminate nature of LLMs? What's really 
needed is for sashiko to incorporate feedback like any other developer. 
Otherwise, it's going to be like some certain reviewers we've banned.

Rob
