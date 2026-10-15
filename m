Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BE5A0AD9;
	Thu, 15 Oct 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096680; cv=none; b=jshaKPXyY9AwzOvZnrGLJdoK2I+HbTgnySTxbpV9j1M6Uv2bewDkT9+2mc+IMjKmi9aPiR4EvnRAXrV+xkRqmtrkZkfgRlh/A6FaJ51/9gnoLMhzYqdszSI1f7NrSk7s8d/n4z6R3TePrCKZ5IuMjvbsKrGlsFexD3iP7CNCpbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096680; c=relaxed/simple;
	bh=m2KKHJloLxpKSuq+bvXHNupjHn8VG6Rv+QZ+D6V1Fq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWz3Sgs0CRLnbPbLXPVZPdfu16utoAkPsCOeAHbWfdgLPW+Z7+Shb6us94ODhrkXeIpGhXUy8wgvh9TwFVk5QG3EwKnLYvm4quMPzxwV1IxzchxgjldH+U0QQxo6G3l/ldersuFIBCFNJh5eUSO+NZE+2TBuU6Cgr3UrduSXRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QydUA7nQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QydUA7nQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81451F000C4;
	Thu, 15 Oct 2026 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792096677;
	bh=X3kZA4UFDJda4OZmCXKfTwgESe8oCPO3QuovMIOMqpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QydUA7nQiMa2SWuo5N8jYOlIqP5Y7/RvB7g9SJHMvx/IYtdeIwNlRwgasDnk4w+JE
	 0nTGi091AyAAs/97PZ1pTlamifEYSLHfDEc0VhdNiuL4lEpWv84Nl0kpuVw54TBGaF
	 Rh3/F6Oq9EWsHLZ/Ox1N+yl4Zdu9jfKjNqEpBeiRO+WlWPgvupcjF8WvJolooxWuwf
	 vCMmFf0WNJ5oVRiCBGWjryZ/prhuMWnC4UUrGwvOU95Hr75geKo3BwcVFKBilG3l1u
	 +6vx8nS18q6qYswQQj/hNKrse6ryjIfqYDzrYvKr4T0j+a2igisQDUyxNKjubgEi3p
	 db0wVkGtTa+tA==
Date: Thu, 15 Oct 2026 15:37:55 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Prabhakar <prabhakar.csengg@gmail.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH net-next v3 04/13] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Disallow ports beyond port@4
Message-ID: <20261015203755.GA3103057-robh@kernel.org>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <sashiko-outbox-172911@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-172911@kernel.org>

On Thu, Oct 15, 2026 at 01:19:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: net: dsa: incomplete schema validation allows bypassing port restrictions via ports node
> --
> 
> commit b100423001348cf87abe9e11b4f74d424451c2db
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4
> 
> Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
> hardware configuration of four external ports and one CPU/management port.
> 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index fab6aa6237e93..c5e652c057a94 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > @@ -61,7 +61,14 @@ properties:
> >  
> >    ethernet-ports:
> >      type: object
> > -    additionalProperties: true
> > +    additionalProperties: false
> 
> [Severity: Low]
> Does this schema allow bypassing the port restrictions if a device tree uses
> a node named ports instead of ethernet-ports?
> 
> Because dsa.yaml allows either ports or ethernet-ports, and the schema
> doesn't list ethernet-ports in the required properties, a devicetree could
> define a ports node with a port outside the 0-4 range (e.g. port@5) and
> silently pass validation.

You should use 'additionalProperties' at the top-level to fix this.

Rob
