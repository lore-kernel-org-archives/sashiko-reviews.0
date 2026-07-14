Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D711371873;
	Tue, 14 Jul 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039676; cv=none; b=XZY4nVLYFrXewRmtMzlAFRaV6PrVjNVlPDxVQs7gOGGtAq6BySMzy1FzF4XAuFjfWd0x75FX7aV88x+R7aAA5wCKCDVEXGekKqyB+v8/dzNxwxMR7wsG7WaUg5+IKiYOyYvH9UA8vtUVj3jCMP0Yp3fQNUb8oH4QtaM9SwbI/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039676; c=relaxed/simple;
	bh=L9Emhitq2fZbufK98cTv40SJFDXVFtQqBtiVu6ARKKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7CMd4jC6e6rjJtQxWkV6RjyekdWHFH1ttXNQm4okEjZLcp03DnDZVRtwn43wgkJrTZR0f/Qm1fseOosnFZvr+dDOK0WO3qtx7V0LpAlHpqO2/weFifn9CjnuN6sS7565OLtzdGRnonECPKjmIvvVQm1juZtdeczyfnkgQRkyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHtrnOnW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHtrnOnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848591F000E9;
	Tue, 14 Jul 2026 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784039674;
	bh=EwNVTon+/nbjRpzwjhhjH2A7QsMv/Rt06oFZ3UT6FIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CHtrnOnW5stVfjfg02P3Kk3ImhP5f3aFDPiEpGg6wdMgZ/9LXy0mTkI/lSmvI8Bgt
	 xKuMEw2BY1JQ9HgU/AfzfHhwYqrV2ATAE2ixtJSv2E83srd2sFcJiRsYQ/nUBOM5nm
	 w8S3vB5vdcGKxe5jrQgeg/IUqs0r/tBaUdl6WZ3Car+jDA5rOYOfYOxTQI+F08O/aG
	 sOenvtzBEEyvzW37bXxTsBV+Vx/Z7As0lmA90UCQnEL3RIz7KldYtPma9E37lNt9eH
	 wbSoy0aJ4DYRQ9XuTxgKcOOtAowJrenvQ+CiR/ezRgldOVVw3gfJPIBuET81HqDMpi
	 +Nr7MZgJ4rbHw==
Date: Tue, 14 Jul 2026 09:34:33 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Message-ID: <20260714143433.GA1476641-robh@kernel.org>
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
 <20260713142746.40259-10-angelogioacchino.delregno@collabora.com>
 <20260713144221.2C4F91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713144221.2C4F91F00A3A@smtp.kernel.org>

On Mon, Jul 13, 2026 at 02:42:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The compatible string `mediatek,mt6893-disp-wdma` is incorrectly added to the standalone enum instead of the fallback items list.
> --
> 
> --- Patch [9]: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs ---
> commit 8001f83833ae9c684be67bc719c7aaa056f90763
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
> 
> Multiple MediaTek SoCs have the Write DMA hardware in their Display
> Controller. This commit adds the missing compatibles for Dimensity 1200
> (MT6893) and for Kompanio 500/520/820/1200.
> 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> > index 97d052b0fb614..c3ed867d058d9 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> > @@ -22,11 +22,16 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - mediatek,mt6893-disp-wdma
> 
> [Severity: Medium]
> Does this incorrectly place mediatek,mt6893-disp-wdma as a standalone
> compatible string rather than in the items list requiring a fallback?
> 
> If a device tree uses compatible = "mediatek,mt6893-disp-wdma" to satisfy
> this schema, the DRM driver will not probe the device since it only matches
> mediatek,mt8173-disp-wdma. If the developer instead provides the fallback 
> compatible = "mediatek,mt6893-disp-wdma", "mediatek,mt8173-disp-wdma" so the
> driver can probe it, won't the device tree fail schema validation here?

Sashiko fails to look at patch 10. However, the commit message gives no 
clue whether mt6893 is or is not compatible with something else. If not 
compatible, explain why it isn't. What's different?

Rob
