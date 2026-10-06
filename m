Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4537FF46;
	Tue,  6 Oct 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297987; cv=none; b=YyfCWCzsmPjfaqRsUikoEjGYl7OHg0Q7RA0t/AtW4jFEeRE2fTcV8P3YRGJTr8MCYoUQ/2Uueyrj+mKA52uMMpTQXYCDh6w70DUV8GtaW76oXEPCssfF8FpvHpTpnQ5++MunueO89cN5RAPF2lABCqmMKjo4f4LjF4W2REEvQik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297987; c=relaxed/simple;
	bh=zamFwhdLiuEW4kitGtycKJPuFi8Vryp8GQZC7CK22vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD+8hGhdEnpV+16BirmU9tOm0XIleoqI4128m9r8sajp8qmdUSS7TPvtYiNr++VeaiAsJ2E+FWxeWkZrqiOjWSf40B2FBMjJjsgr8Qefy7Bi3NhxBLMt8xbSTojo7EwyAyjW9YRALdF6+nwaLdxvMsKHAR3swnxMqw0XPobDsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKU03Imf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKU03Imf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3776F1F0089B;
	Tue,  6 Oct 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791297986;
	bh=jrEgrOy1SQblcRUZ/5k3rGkL+cG0qO8/Q38RH6jd7Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IKU03ImfddeGvNot7jJLJdZS1YuxH9AEqSIcffHp32XrXx1FHK1v+dUCV4Lz+dnYA
	 JtOrtP49ShX6RdQQ0plKmhwXWXJCYmVtLICdD6c410tIlSVGWPSz0TGOLg4S/qnStc
	 tmc+6HVI/8cyujJMIYlcSsUrQZE/7WIvaHr5DdK9O0vaXBrruT1jzXgpN6X08CLErO
	 KAQ0d+b3t8VN3X6nazn/jzOKNipxB9Wi1I5PoztGhnprZMitGitwakWEccUM61wjc6
	 EWjLKvaT0d8eFezPlW6EHsnTUmEV4UHbFBNXGL1IAHmYX3EpVkH932CE7SmfBps1r0
	 Y1XTreYqse3yQ==
Date: Tue, 6 Oct 2026 09:46:25 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: Add HiSilicon local bus
Message-ID: <20261006144625.GA2194299-robh@kernel.org>
References: <20261005205310.2079198-1-robh@kernel.org>
 <20261005210035.1FD341F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005210035.1FD341F000FF@smtp.kernel.org>

On Mon, Oct 05, 2026 at 09:00:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing `required` block allows nodes without `reg` to pass
> --
> 
> commit 31cf8e8c992601dbcd36de1b649ef5c513febf6f
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: bus: Add HiSilicon local bus
> 
> This commit introduces a new device tree binding schema for the HiSilicon local
> bus. It sets up validation constraints for the compatible string and registers.
> 
> > diff --git a/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
> > new file mode 100644
> > index 0000000000000..cd9ecea88269f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
> 
> [ ... ]
> 
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: hisilicon,hisi-localbus
> > +      - const: simple-bus
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +unevaluatedProperties: false
> 
> [Severity: Low]
> Should this schema include a required array to enforce the presence of the
> compatible and reg properties?

compatible is implied, but will add 'reg' when applying.

Rob
