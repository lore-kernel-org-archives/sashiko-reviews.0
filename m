Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC940E8E2;
	Tue, 30 Jun 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836354; cv=none; b=SvpkMJd8JBK3EUTPoQVTHQ1hk+ExhIrha+U7m4fRDhj9Z/yJHNZo6C/NfqJf4R0jSxHeY1N3/lS/vSWlMD+ujJXGtI/lxgMeuDN6hhSF20dp4B15RWV6Y+jx8+rZfVCbX5zqgAy0iNgB0FVdjoDtNFV0oCFnrgpCsDKOns4Jblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836354; c=relaxed/simple;
	bh=5TvCWFhpaOPPCAFIB3sC745MVPyu4vs+NkxwxWXaR5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTAvELOoPWM1SI8K37UUPRL0UCBAPDbIDx7gyXuWWBtm5zxGV/hZHXCD0P+hwEeX+KU1n/hA7oXFswW05ObIKnLghHS2phZ9h1MG+lgWrDz/CrPPX+qsP8LvYQg6OVB6nIo/QylKuYDjRIXkcljIHjFRaWUstW4PJYz+YNc1lZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0IgMiec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0IgMiec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ADE1F000E9;
	Tue, 30 Jun 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836353;
	bh=Qnh7z4wQkjadeMiyIpIyUCMyM7cuCIxF6s3McyioJfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a0IgMieciE5vITkeWRQgBkdJG5CCzzG22Duzi+lkyWIgAAa6LFdDPPG3v+xEqX2Hn
	 AoDB7a5ILdwU50eTw6SUlbxX+1eelQv5O5dcpl+2106MmoAQhJfUiTgWS7xgDEybel
	 WmpRpv0D0hvsDyLMBhWwsdiQ2CaBv/dC1T11IaSzu7gLJJ6atqoaJuHTXI7jA2FyMg
	 Ft51dXya+uKHAQRXVKLTiwDFZVm+jeb0SuvGZXwkPQTw6VFnYEfej5z/qUI+TRRE+6
	 DggAAqchWNbOkCQfVo3q2DTvqiVn/lm0BQ+Hhb8vbKJC3oFtPk6/WDaf44sLWyD89A
	 yHCdg1pdrhwHA==
Date: Tue, 30 Jun 2026 11:19:12 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260630161912.GA3828650-robh@kernel.org>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
 <20260624191940.C0BBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624191940.C0BBF1F000E9@smtp.kernel.org>

On Wed, Jun 24, 2026 at 07:19:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing property type reference (`$ref`) for the `sram` property in the dt-binding schema.
> --
> 
> commit 6acd1cecaeb951d30398f9208dd4e87b7cfd156e
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> dt-bindings: firmware: qcom,scm: Add minidump SRAM property
> 
> This commit adds a new 'sram' property to the Qualcomm SCM dt-binding. The
> property is intended to contain a phandle to a region in always-on SRAM used
> for minidump download destination configuration. This allows the OS to share
> information with the boot firmware across warm resets.
> 
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 7918d31f58b4a..82c661db0b616 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -127,6 +127,13 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >  
> > +  sram:
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised on
> > +      the next warm reset.
> > +    maxItems: 1
> 
> [Severity: Low]
> Does this property need an explicit type reference, such as
> $ref: /schemas/types.yaml#/definitions/phandle?
> 
> Without a type definition, the dt-schema validator might infer the property
> as an untyped array based on the presence of maxItems: 1. Could this allow
> malformed device trees to pass validation silently since it won't enforce
> that the provided value is actually a valid phandle?

No, that's wrong. There is now a common definition.

Rob
